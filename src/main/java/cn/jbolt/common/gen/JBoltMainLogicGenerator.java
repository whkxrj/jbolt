package cn.jbolt.common.gen;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.jfinal.kit.Kv;
import com.jfinal.kit.StrKit;
import com.jfinal.template.Engine;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.lang.Filter;
import cn.hutool.core.util.ClassUtil;
import cn.jbolt.common.model.Demotable;

/**
 * Controller Service html生成器
 */
public class JBoltMainLogicGenerator{
	public static JBoltMainLogicGenerator me=new JBoltMainLogicGenerator();
	private static final String projectPath=System.getProperty("user.dir");
	private static final String author="JFinal学院-小木";
	private static final String controllerTemplate = "/gentpl/controller_template.jf";
	private static final String controllerCommonTemplate = "/gentpl/controller_common_template.jf";
	private static final String serviceCommonTemplate = "/gentpl/service_common_template.jf";
	private static final String serviceTemplate = "/gentpl/service_template.jf";
	private static final String indexHtmlTemplate = "/gentpl/index_html_template.jf";
	private static final String addHtmlTemplate = "/gentpl/add_html_template.jf";
	private static final String editHtmlTemplate = "/gentpl/edit_html_template.jf";
	private static final String formHtmlTemplate = "/gentpl/form_html_template.jf";
	private Map<Class<?>, JBoltMainLogicBean> modelPathMap;
	private Engine engine;
	
	private JBoltMainLogicGenerator() {
		JBoltConsoleUtil.printMessage("-------------------------JFinal Main Logic Generator-------------------------");
		initModelPathMap();
		initEngine();
	}
	/**
	 * 初始化需要 生成的逻辑的model
	 */
	private void initModelPathMap() {
		JBoltConsoleUtil.printMessageWithDate("初始化需要生成的Model-JavaPackage-viewFolder对应关系 ...");
		modelPathMap=new HashMap<Class<?>, JBoltMainLogicBean>();
		modelPathMap.put(Demotable.class,new JBoltMainLogicBean(projectPath, "cn.jbolt.demotable","/demotable", "_admin/demo/demotable","demoTable管理","DemoTable数据",true,"breif_info"));
	}
	
	private void initEngine() {
		JBoltConsoleUtil.printMessageWithDate("初始化模板引擎 ...");
		engine = new Engine();
		engine.setToClassPathSourceFactory();	// 从 class path 内读模板文件
		engine.addSharedMethod(new StrKit());
		engine.addSharedFunction(controllerCommonTemplate);
		engine.addSharedFunction(serviceCommonTemplate);
	}
	/**
	 * 执行生成任务
	 */
	public void generate() {
		JBoltConsoleUtil.printMessageWithDate("开始执行生成 ...");
		Set<Entry<Class<?>, JBoltMainLogicBean>> entries=modelPathMap.entrySet();
 		for(Entry<Class<?>, JBoltMainLogicBean> entry:entries) {
 			generateOne(entry.getKey(),entry.getValue());
 		}
 		JBoltConsoleUtil.printMessageWithDate("全部生成 结束 ...");
 		JBoltConsoleUtil.printMessageWithDate("==请刷新项目目录，检查生成结果==");
	}
	/**
	 * 针对一个Modelclass进行生成
	 * @param clazz
	 * @param jBoltMainLogicBean
	 */
	public void generateOne(Class<?> clazz,JBoltMainLogicBean jBoltMainLogicBean) {
		JBoltConsoleUtil.printMessageWithDate(String.format("正在生成:%s...",clazz.getName()));
		//生成Controller
		genController(clazz,jBoltMainLogicBean);
		//生成Service
		genService(clazz,jBoltMainLogicBean);
		
		//生成add.html
		genAddHtml(clazz,jBoltMainLogicBean);
		//生成edit.html
		genEditHtml(clazz,jBoltMainLogicBean);
		//生成_form.html
		genFormHtml(clazz,jBoltMainLogicBean);
		//生成index.html
		genIndexHtml(clazz,jBoltMainLogicBean);
	}
	/**
	 * 生成Index.htlm
	 * @param clazz
	 * @param viewFolder
	 */
	private void genIndexHtml(Class<?> clazz, JBoltMainLogicBean mainLogicBean) {
		//model名
		String modelName=clazz.getSimpleName();
		JBoltConsoleUtil.printMessageWithDate("正在生成index.html...");
		//view相对路径
		String viewFolder=mainLogicBean.getViewFolder();
		//view物理路径
		String targetOutputDir=getDirFromViewForlder(viewFolder);
		JBoltConsoleUtil.printMessageWithDate(String.format("index.html生成路径:%s...",targetOutputDir));
		//如果存在 忽略
		if(FileUtil.exist(targetOutputDir+ File.separator+"index.html")) {
			JBoltConsoleUtil.printMessageWithDate("index.html文件[%s]已存在,忽略生成！");
			return;
		}
		//模板数据
		Kv datas=Kv.by("modelName",modelName).set("mainLogicBean",mainLogicBean);
		//处理针对一个ModelClass在Controller层要生成的方法
		processIndexHtmlJboltField(clazz,datas);
		//执行渲染模板得到代码文本
		String content=engine.getTemplate(indexHtmlTemplate).renderToString(datas);
		//执行文件生成
		writeToFile(targetOutputDir, "index.html", content);
	
	}
	
	/**
	 * 生成_form.html
	 * @param clazz
	 * @param viewFolder
	 */
	private void genFormHtml(Class<?> clazz, JBoltMainLogicBean mainLogicBean) {
		JBoltConsoleUtil.printMessageWithDate("正在生成form.html...");
		String viewFolder=mainLogicBean.getViewFolder();
		String targetOutputDir=getDirFromViewForlder(viewFolder);
		JBoltConsoleUtil.printMessageWithDate(String.format("form.html生成路径:%s...",targetOutputDir));
		if(FileUtil.exist(targetOutputDir+ File.separator+"form.html")) {
			JBoltConsoleUtil.printMessageWithDate("form.html文件[%s]已存在,忽略生成！");
			return;
		}
		//执行渲染模板得到代码文本
		String content=engine.getTemplate(formHtmlTemplate).renderToString(Kv.create());
		//执行文件生成
		writeToFile(targetOutputDir, "_form.html", content);
		
	}

	/**
	 * 生成Edit.html
	 * @param clazz
	 * @param viewFolder
	 */
	private void genEditHtml(Class<?> clazz, JBoltMainLogicBean mainLogicBean) {
		JBoltConsoleUtil.printMessageWithDate("正在生成edit.html...");
		String viewFolder=mainLogicBean.getViewFolder();
		String targetOutputDir=getDirFromViewForlder(viewFolder);
		JBoltConsoleUtil.printMessageWithDate(String.format("edit.html生成路径:%s...",targetOutputDir));
		if(FileUtil.exist(targetOutputDir+ File.separator+"edit.html")) {
			JBoltConsoleUtil.printMessageWithDate("edit.html文件[%s]已存在,忽略生成！");
			return;
		}
		//执行渲染模板得到代码文本
		String content=engine.getTemplate(editHtmlTemplate).renderToString(Kv.by("action", mainLogicBean.getRealControllerKey()+"/update"));
		//执行文件生成
		writeToFile(targetOutputDir, "edit.html", content);
		
	}

	/**
	 * 生成add.html
	 * @param clazz
	 * @param viewFolder
	 */
	private void genAddHtml(Class<?> clazz,JBoltMainLogicBean mainLogicBean) {
		JBoltConsoleUtil.printMessageWithDate("正在生成add.html...");
		String viewFolder=mainLogicBean.getViewFolder();
		String targetOutputDir=getDirFromViewForlder(viewFolder);
		JBoltConsoleUtil.printMessageWithDate(String.format("add.html生成路径:%s...",targetOutputDir));
		if(FileUtil.exist(targetOutputDir+ File.separator+"add.html")) {
			JBoltConsoleUtil.printMessageWithDate("add.html文件[%s]已存在,忽略生成！");
			return;
		}
		//执行渲染模板得到代码文本
		String content=engine.getTemplate(addHtmlTemplate).renderToString(Kv.by("action", mainLogicBean.getRealControllerKey()+"/save"));
		//执行文件生成
		writeToFile(targetOutputDir, "add.html", content);
	}
	/**
	 * 通用controller模板
	 * @return
	 */
	private List<String> getCommonControllerMethods(){
		List<String> genMehtods=new ArrayList<String>();
		genMehtods.add("index");
		genMehtods.add("add");
		genMehtods.add("edit");
		genMehtods.add("save");
		genMehtods.add("update");
		genMehtods.add("delete");
		return genMehtods;
	}
	private List<JBoltGenMethod> getCommonServiceMethods(boolean needPaginate){
		List<JBoltGenMethod> genMehtods=new ArrayList<JBoltGenMethod>();
		if(needPaginate) {
			genMehtods.add(new JBoltGenMethod("paginateAdminList"));
		}else {
			genMehtods.add(new JBoltGenMethod("getAdminList"));
		}
		genMehtods.add(new JBoltGenMethod("save"));
		genMehtods.add(new JBoltGenMethod("update"));
		genMehtods.add(new JBoltGenMethod("submit"));
		genMehtods.add(new JBoltGenMethod("delete"));
		return genMehtods;
	}
	/**
	 * 生成Service
	 * @param clazz
	 * @param targetPackageName
	 */
	private void genService(Class<?> clazz, JBoltMainLogicBean mainLogicBean) {
		//model名
		String modelName=clazz.getSimpleName();
		//service名
		String serviceName=modelName+"Service";
		//service全名
		String serviceFullName=serviceName+".java";
		//目标package
		String targetPackageName=mainLogicBean.getJavaPackage();
		JBoltConsoleUtil.printMessageWithDate(String.format("正在生成Service:%s...",serviceFullName));
		//生成到指定目录
		String targetOutputDir=getDirFromPackage(targetPackageName);
		JBoltConsoleUtil.printMessageWithDate(String.format("Service生成路径:%s...",targetOutputDir));
		//如果已经存在就忽略
		if(FileUtil.exist(targetOutputDir+ File.separator+serviceFullName)) {
			JBoltConsoleUtil.printMessageWithDate(String.format("Service文件[%s]已存在,忽略生成！",serviceFullName));
			return;
		}
		//模板数据
		Kv data=Kv.by("author", author).set("targetPackageName", targetPackageName).set("modelName", modelName).set("serviceName",serviceName).set("modelImport",clazz.getPackage().getName()+"."+modelName);
		//所需生成的方法名
		List<JBoltGenMethod> genMehtods=processServiceGenMethods(clazz,mainLogicBean.getNeedPaginate());
		data.set("methods",genMehtods);
		data.set("mainLogicBean",mainLogicBean);
		//执行渲染模板得到代码文本
		String content=engine.getTemplate(serviceTemplate).renderToString(data);
		//执行文件生成
		writeToFile(targetOutputDir, serviceFullName, content);
	}
	/**
	 * 生成Controller
	 * @param clazz
	 * @param targetPackageName
	 * @param needPaginate 
	 */
	private void genController(Class<?> clazz,JBoltMainLogicBean mainLogicBean) {
		//model名字
		String modelName=clazz.getSimpleName();
		//Controller名字
		String controllerName=modelName+"AdminController";
		//Controller全名
		String controllerFullName=controllerName+".java";
		//目标package
		String targetPackageName=mainLogicBean.getJavaPackage();
		JBoltConsoleUtil.printMessageWithDate(String.format("正在生成Controller:%s...",controllerFullName));
		//输出目录
		String targetOutputDir=getDirFromPackage(targetPackageName);
		JBoltConsoleUtil.printMessageWithDate(String.format("Controller生成路径:%s...",targetOutputDir));
		//如果文件已经存在 忽略生成
		if(FileUtil.exist(targetOutputDir+ File.separator+controllerFullName)) {
			JBoltConsoleUtil.printMessageWithDate(String.format("Controller文件[%s]已存在,忽略生成！",controllerFullName));
			return;
		}
		//service名字
		String serviceName=modelName+"Service";
		//准备模板数据
		Kv data=Kv.by("author", author).set("targetPackageName", targetPackageName).set("modelName", modelName).set("controllerName",controllerName).set("serviceName",serviceName).set("modelImport",clazz.getPackage().getName()+"."+modelName);
		data.set("needPaginate",mainLogicBean.getNeedPaginate());
		//处理所需生成的方法名
		List<String> genMehtods=processContrllerGenMethods(clazz);
		data.set("methods",genMehtods);
		data.set("needPaginate",mainLogicBean.getNeedPaginate());
		//执行渲染模板得到代码文本
		String content=engine.getTemplate(controllerTemplate).renderToString(data);
		//执行文件生成 写到文件中
		writeToFile(targetOutputDir, controllerFullName, content);
	}
	/**
	 * 得到package物理路径
	 * @param targetPackageName
	 * @return
	 */
	private String getDirFromPackage(String targetPackageName) {
		return projectPath+"/src/main/java/"+targetPackageName.replace(".", "/");
	}
	/**
	 * 得到view物理路径
	 * @param viewFolder
	 * @return
	 */
	private String getDirFromViewForlder(String viewFolder) {
		return projectPath+"/src/main/webapp/_view/"+viewFolder;
	}
	private Filter<Method> commonGetMethodFilter=new Filter<Method>() {
		
		@Override
		public boolean accept(Method method) {
			String name=method.getName();
			boolean isBoolean=method.getReturnType()==Boolean.class;
			boolean isSortRank=method.getReturnType()==Integer.class&&method.getName().equalsIgnoreCase("getsortrank");
			boolean isPid=method.getReturnType()==Integer.class&&method.getName().equalsIgnoreCase("getpid");
			return name.startsWith("get")&&name.equalsIgnoreCase("getboolean")==false&&(isBoolean||isSortRank||isPid);
		}
	};
	/**
	 * 处理针对一个ModelClass在Service层要生成的方法
	 * @param clazz
	 * @param needPaginate 
	 * @return
	 */
	private List<JBoltGenMethod> processServiceGenMethods(Class<?> clazz, boolean needPaginate) {
		//先得到通用的，然后判断有不需要的就删掉，有特殊的就新增
		List<JBoltGenMethod> genMehtods=getCommonServiceMethods(needPaginate);
		List<Method> getMethods=ClassUtil.getPublicMethods(clazz.getSuperclass(), commonGetMethodFilter);
		if(getMethods!=null&&getMethods.size()>0) {
			for(Method method:getMethods) {
				//返回值是boolean的 生成toogleXXX
				boolean isBoolean=method.getReturnType()==Boolean.class;
				if(isBoolean) {
					genMehtods.add(new JBoltGenMethod(method.getName().replace("get", "toggle"),method.getAnnotation(JBoltField.class)));
					continue;
				}
				//getSortRank有的话 需要生成对应的上下 move 和初始化
				boolean isSortRank=method.getReturnType()==Integer.class&&method.getName().equalsIgnoreCase("getsortrank");
				if(isSortRank) {
					genMehtods.add(new JBoltGenMethod("up"));
					genMehtods.add(new JBoltGenMethod("down"));
					genMehtods.add(new JBoltGenMethod("move"));
					genMehtods.add(new JBoltGenMethod("initRank"));
					continue;
				}
			}
		}
		return genMehtods;
	}
	
	private Filter<Method> commonIndexHtmlGetMethodFilter=new Filter<Method>() {
		
		@Override
		public boolean accept(Method method) {
			String name=method.getName();
			boolean isPid=method.getReturnType()==Integer.class&&method.getName().equalsIgnoreCase("getpid");
			boolean isId=method.getReturnType()==Integer.class&&method.getName().equalsIgnoreCase("getid");
			boolean isPassword=method.getReturnType()==String.class&&(method.getName().equalsIgnoreCase("getpassword")||(method.getName().startsWith("get")&&method.getName().toLowerCase().endsWith("password")));
			return name.startsWith("get")&&!isId&&!isPassword&&!isPid&&name.equalsIgnoreCase("getboolean")==false;
		}
	};
	/**
	 * 处理针对一个ModelClass在Controller层要生成的方法
	 * @param clazz
	 * @param datas 
	 * @return
	 */
	private List<JBoltFieldBean> processIndexHtmlJboltField(Class<?> clazz, Kv datas) {
		List<JBoltFieldBean> jboltFieldBeans=new ArrayList<JBoltFieldBean>();
		List<Method> getMethods=ClassUtil.getPublicMethods(clazz.getSuperclass(), commonIndexHtmlGetMethodFilter);
		boolean needSort=false;
		if(getMethods!=null&&getMethods.size()>0) {
			JBoltField field;
			for(Method method:getMethods) {
				field=method.getAnnotation(JBoltField.class);
				if(field==null) {
					continue;
				}
				if(field.name().equalsIgnoreCase("sortrank")) {
					needSort=true;
					continue;
				}
				jboltFieldBeans.add(new JBoltFieldBean(field));
			}
		}
		datas.set("needSort",needSort);
		datas.set("ths",jboltFieldBeans);
		return jboltFieldBeans;
	}
	/**
	 * 处理针对一个ModelClass在Controller层要生成的方法
	 * @param clazz
	 * @return
	 */
	private List<String> processContrllerGenMethods(Class<?> clazz) {
		//先得到通用的，然后判断有不需要的就删掉，有特殊的就新增
		List<String> genMehtods=getCommonControllerMethods();
		//得到model所有public getter method
		List<Method> getMethods=ClassUtil.getPublicMethods(clazz.getSuperclass(), commonGetMethodFilter);
		if(getMethods!=null&&getMethods.size()>0) {
			//每个getter 循环处理
			for(Method method:getMethods) {
				//boolean类型特殊处理 需要提供toggleXXX方法
				boolean isBoolean=method.getReturnType()==Boolean.class;
				if(isBoolean) {
					genMehtods.add(method.getName().replace("get", "toggle"));
					continue;
				}
				//如果是存在sort_rank字段的getSortRank方法 那就需要加排序了
				boolean isSortRank=method.getReturnType()==Integer.class&&method.getName().equalsIgnoreCase("getsortrank");
				if(isSortRank) {
					//排序三兄弟 上下和初始化 后面还得加动态move
					genMehtods.add("up");
					genMehtods.add("down");
					genMehtods.add("move");
					genMehtods.add("initRank");
					continue;
				}
				//如果有pid字段的getPid 说明表结构是父子tree关系结构
				boolean isPid=method.getReturnType()==Integer.class&&method.getName().equalsIgnoreCase("getpid");
				if(isPid) {
					genMehtods.add("tree");
					continue;
				}
			}
		}
		return genMehtods;
	}

	/**
	  *写入文件 如果存在 不进行任何操作 不覆盖
	 * @param targetOutputDir
	 * @param fileName
	 * @param content
	 * @throws IOException
	 */
	private void writeToFile(String targetOutputDir,String fileName,String content){
		if(FileUtil.exist(targetOutputDir)==false) {
			FileUtil.mkdir(targetOutputDir);
		}
		
		String target = targetOutputDir + File.separator +fileName;
		if(FileUtil.exist(target)==false) {
			FileUtil.writeUtf8String(content, target);
		}
		
	}
	
	public static void main(String[] args) {
		JBoltMainLogicGenerator.me.generate();
	}
	

}






