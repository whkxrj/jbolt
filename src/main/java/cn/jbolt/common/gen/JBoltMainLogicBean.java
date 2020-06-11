package cn.jbolt.common.gen;

import com.jfinal.kit.StrKit;

/**
 * 主逻辑生成器使用的对应关系Bean
 * @ClassName:  JBoltMainLogicBean   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年12月20日   
 *    
 */
public class JBoltMainLogicBean {
	private String projectPath;//项目根路径
	private String javaPackage;//新模块对应的模块所在package
	private String pageTitle;//标题
	private String dataName;//model的名字 例如model是user 名字就是用户
	private String viewFolder;//模块对应view层文件夹路径
	private boolean needPaginate;//后台查询是否开启分页
	private String matchColumns;//关键词匹配字段
	private String orderColumn;//排序字段
	private String orderType;//排序方式
	private String controllerKey;//路由controllerKey
	public JBoltMainLogicBean(String projectPath,String javaPackage,String controllerKey,String viewFolder,String pageTitle,String dataName,boolean needPaginate,String matchColumns) {
		this.projectPath=projectPath;
		this.javaPackage=javaPackage;
		this.controllerKey=controllerKey;
		this.viewFolder=viewFolder;
		this.pageTitle=pageTitle;
		this.dataName=dataName;
		this.needPaginate=needPaginate;
		this.matchColumns=matchColumns;
		this.orderColumn="id";
		this.orderType="desc";
	}
	public JBoltMainLogicBean(String projectPath,String javaPackage,String controllerKey,String viewFolder,String pageTitle,String dataName,boolean needPaginate,String matchColumns,String orderColumn,String orderType) {
		this(projectPath, javaPackage,controllerKey, viewFolder, pageTitle, dataName, needPaginate, matchColumns);
		this.orderColumn=orderColumn;
		this.orderType=orderType;
	}

	public String getJavaPackage() {
		return javaPackage;
	}
	public void setJavaPackage(String javaPackage) {
		this.javaPackage = javaPackage;
	}
	public String getViewFolder() {
		return viewFolder;
	}
	public void setViewFolder(String viewFolder) {
		this.viewFolder = viewFolder;
	}

	public String getProjectPath() {
		return projectPath;
	}

	public void setProjectPath(String projectPath) {
		this.projectPath = projectPath;
	}

	public boolean getNeedPaginate() {
		return needPaginate;
	}

	public void setNeedPaginate(boolean needPaginate) {
		this.needPaginate = needPaginate;
	}

	public String getPageTitle() {
		return pageTitle;
	}

	public void setPageTitle(String pageTitle) {
		this.pageTitle = pageTitle;
	}

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public String getOrderColumn() {
		return orderColumn;
	}

	public void setOrderColumn(String orderColumn) {
		this.orderColumn = orderColumn;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getMatchColumns() {
		return matchColumns;
	}

	public void setMatchColumns(String matchColumns) {
		this.matchColumns = matchColumns;
	}
	public String getControllerKey() {
		return controllerKey;
	}
	public void setControllerKey(String controllerKey) {
		this.controllerKey = controllerKey;
	}
	
	public String getRealControllerKey() {
		if(StrKit.isBlank(controllerKey)) {return null;}
		if(controllerKey.startsWith("/")) {
			return controllerKey.substring(1);
		}
		return controllerKey;
	}

}
