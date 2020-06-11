package cn.jbolt.common.config;

import java.io.File;
import java.sql.Timestamp;
import java.time.Duration;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.jbolt.index.*;
import com.alibaba.druid.filter.logging.Slf4jLogFilter;
import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.wall.WallFilter;
import com.alibaba.fastjson.parser.ParserConfig;
import com.jfinal.aop.Aop;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.ActionReporter;
import com.jfinal.core.converter.TypeConverter;
import com.jfinal.core.paragetter.ParaProcessorBuilder;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.json.FastJsonFactory;
import com.jfinal.kit.FileKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.dialect.AnsiSqlDialect;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.activerecord.dialect.OracleDialect;
import com.jfinal.plugin.activerecord.dialect.PostgreSqlDialect;
import com.jfinal.plugin.activerecord.dialect.SqlServerDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.druid.IDruidStatViewAuth;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;
import com.jfinal.template.source.ClassPathSourceFactory;
import com.jfinal.upload.OreillyCos;
import com.jfinal.weixin.sdk.api.ApiConfigKit;
import com.jfinal.wxaapp.WxaConfigKit;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import cn.hutool.core.io.FileUtil;
import cn.jbolt._admin.globalconfig.GlobalConfigService;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.user.UserAuthKit;
import cn.jbolt.admin.appdevcenter.AppDevCenterAdminRoutes;
import cn.jbolt.admin.wechat.config.WechatConfigService;
import cn.jbolt.admin.wechat.mpinfo.WechatMpinfoType;
import cn.jbolt.apitest.ApiTestRoutes;
import cn.jbolt.base.JBoltBaseHandler;
import cn.jbolt.base.JBoltDruidStatViewHandler;
import cn.jbolt.base.JBoltEnum;
import cn.jbolt.base.JBoltRenderFactory;
import cn.jbolt.base.actionreport.JBoltActionReportLogWriter;
import cn.jbolt.base.actionreport.JBoltActionReportSystemOutWriter;
import cn.jbolt.base.para.JBoltPara;
import cn.jbolt.base.para.JBoltParaGetter;
import cn.jbolt.common.db.sql.DBType;
import cn.jbolt.common.db.sql.SqlUtil;
import cn.jbolt.common.directive.ActionDirective;
import cn.jbolt.common.directive.AjaxPortalDirective;
import cn.jbolt.common.directive.DateTimeDirective;
import cn.jbolt.common.directive.GlobalConfigDirective;
import cn.jbolt.common.directive.JBoltAdminLogoDirective;
import cn.jbolt.common.directive.LikeValueDirective;
import cn.jbolt.common.directive.PermissionDirective;
import cn.jbolt.common.directive.RealImageDirective;
import cn.jbolt.common.directive.RealUrlDirective;
import cn.jbolt.common.directive.RowNumberDirective;
import cn.jbolt.common.directive.SexDirective;
import cn.jbolt.common.directive.SqlValueDirective;
import cn.jbolt.common.model.User;
import cn.jbolt.common.model._MappingKit;
import cn.jbolt.common.safe.XssHandler;
import cn.jbolt.common.util.CACHE;
import cn.jbolt.common.util.DateUtil;
import cn.jbolt.common.util.RandomUtil;
import cn.jbolt.starter.JBoltStarter;
/**
 * JBolt极速开发平台主配置文件
 * @ClassName:  MainConfig   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年12月6日   
 */
public class MainConfig extends JFinalConfig {
	//当前application的项目运行环境是开发(dev) or 生产(pro)
	public static String PDEV = "dev";
	//定义项目部署环境是不是始终保持https
	public static boolean NEED_ALWAYS_HTTPS = false;
	//上传文件保存路径的前缀 默认为空 项目下存 线上 可能会存到项目之外的目录里
	public static String BASE_UPLOAD_PATH_PRE = null;
	//系统运行是否是Demo模式
	public static boolean DEMO_MODE = false;
	//否是开发模式
	public static boolean DEV_MODE = false;
	//默认数据库类型
	public static String DB_TYPE = DBType.MYSQL;
	//默认jfinal action report输出writer
	public static String ACTION_REPORT_WRITER = "sysout";
	//默认Jbolt auto cache debug log
	public static boolean JBOLT_AUTO_CACHE_LOG = false;
	//默认assets version
	public static String ASSETS_VERSION;
	//id生成模式
	public static String ID_GEN_MODE = "auto";
	//终端ID
	public static long WORKER_ID = 0;
	//数据中心ID
	public static long DATACENTER_ID = 0;
	//项目配置
	public static Prop prop;
	//插件配置
	public static Plugins plugins=null;
	/**
	 * 是否是生产环境
	 * @return
	 */
	public static boolean pdevIsPro() {
		return "pro".equalsIgnoreCase(PDEV);
	}
	
	/**
	 * 加载配置文件
	 */
	public static void loadConfig() {
		if (prop == null) {
			prop=PropKit.use("application.properties");
			if(prop==null){
				throw new RuntimeException("application.properties not exist!");
			}
			//读取当前配置的部署环境类型 dev是开发环境 pro是生产环境
			PDEV=prop.get("pdev", "dev").trim();
			if(pdevIsPro()) {
				prop = PropKit.appendIfExists("config-pro.properties");
			}else {
				prop = PropKit.appendIfExists("config.properties");
			}
			if(prop!=null) {
				//设置当前数据库类型
				DB_TYPE=prop.get("db_type", DBType.MYSQL).trim();
				//是否启用HTTPS 这样可以让前端所有静态资源 统一https
				NEED_ALWAYS_HTTPS=prop.getBoolean("need_always_https",false);
				//设置上传路径前缀 用于存放上传文件到其他绝对路径 而不是项目根路径下
				BASE_UPLOAD_PATH_PRE=prop.get("base_upload_path_pre").trim();
				//当前项目是否是Demo 模式 demo模式很多数据不让删除
				DEMO_MODE=prop.getBoolean("demo_mode", false);
				//设置当前是否为开发模式
				DEV_MODE=prop.getBoolean("dev_mode",false);
				//设置ID主键生成模式 默认是int_auto
				ID_GEN_MODE=prop.get("id_gen_mode","auto").trim();
				//设置当前节点所在数据中心ID
				DATACENTER_ID=prop.getLong("datacenter_id",0L).longValue();
				//设置当前节点所在数据中心中的终端ID
				WORKER_ID=prop.getLong("woker_id",0L).longValue();
				//根据DB_TYPE 和配置部署环境 加载数据库相关配置文件 
				if(pdevIsPro()) {
					prop=PropKit.appendIfExists("dbconfig/"+DB_TYPE+"/config-pro.properties");
				}else {
					prop=PropKit.appendIfExists("dbconfig/"+DB_TYPE+"/config.properties");
				}
			}
		}
	}
	/**
	 * 配置JFinal常量
	 */
	@Override
	public void configConstant(Constants me) {
		//加载配置
		loadConfig();
		me.setDevMode(DEV_MODE);
		//设置默认上传文件保存路径 getFile等使用
		me.setBaseUploadPath(prop.get("base_upload_path").trim());
		//设置上传最大限制尺寸
		me.setMaxPostSize(1024*1024*20);
		//支持 Controller、Interceptor、Validator 之中使用 @Inject 注入业务层，并且自动实现 AOP
		//注入动作支持任意深度并自动处理循环注入
		me.setInjectDependency(true);
		//可以直接访问JSP
//		me.setDenyAccessJsp(false);
		//设置是否对超类进行注入
		me.setInjectSuperClass(true);
		//设置默认下载文件路径 renderFile使用
		me.setBaseDownloadPath(prop.get("base_download_path","download").trim());
		//设置默认视图类型
		me.setViewType(ViewType.JFINAL_TEMPLATE);
		//设置404渲染视图
		me.setError404View("/_view/_admin/common/msg/404.html");
		//设置500渲染视图
		me.setError500View("/_view/_admin/common/msg/500.html");
		// fastJson完全禁用 autoType，提升安全性
		ParserConfig.getGlobalInstance().setSafeMode(true);
		//设置json工厂
		me.setJsonFactory(FastJsonFactory.me());
		OreillyCos.setFileRenamePolicy(new FileRenamePolicy() {
			@Override
			public File rename(File file) {
				String path=file.getPath();
				String ext=FileKit.getFileExtension(path);
				String name=FileUtil.getName(path);
				if(StrKit.isBlank(ext)&&name.equals("blob")){
					ext="png";
				}
				return new File(file.getParent(), UUID.randomUUID()+"."+ext);
			}
		});
		
		//单独处理数据库内字段是datetime类型的时候 页面使用了Html5组件的时间选择组件 type="datetime-local"的
		TypeConverter.me().regist(Timestamp.class, new JBoltTimestampConverter());
		//JFinal设置使用Slf4j
		me.setToSlf4jLogFactory();
		//判断action report输出方式是jboltlog的话 就使用JBolt的日志输出到控制台和文件归档
		if(ACTION_REPORT_WRITER.equals("jboltlog")) {
			//设置actionReport输出
			ActionReporter.setWriter(new JBoltActionReportLogWriter());
		}
		//参数获取器注册
		ParaProcessorBuilder.me.regist(JBoltPara.class, JBoltParaGetter.class, null);
		//二开项目常量配置
		ExtendProjectConfig.configConstant(me);
		//加入自定义renderFactory主要解决nginx+undertow下 https和http共存 以及测试https使用其他端口的问题
		me.setRenderFactory(new JBoltRenderFactory());

	}
	
	/**
	 * 创建一个Druid配置插件
	 * @return
	 */
	public static DruidPlugin createDruidPlugin() {
		loadConfig();
		DruidPlugin druidPlugin=new DruidPlugin(prop.get("jdbc_url"), prop.get("user"), prop.get("password"));
		//配置防火墙
		WallFilter wallFilter = new WallFilter(); // 加强数据库安全
		wallFilter.setDbType(DB_TYPE);
		druidPlugin.addFilter(wallFilter);
		//统计监控的过滤器
		StatFilter statFilter=new StatFilter();
		statFilter.setMergeSql(true);
		statFilter.setLogSlowSql(true);
		statFilter.setSlowSqlMillis(Duration.ofMillis(1000).toMillis());
		//添加 StatFilter 才会有统计数据
		druidPlugin.addFilter(statFilter);    
		
		
		// 2.日志插件
		   // 保存DruidDataSource的监控记录,设置打印日志周期,默认使用DruidDataSourceStatLoggerImpl
		   // DruidPlugin未暴露setTimeBetweenLogStatsMillis(),只能使用properties方法设置
		druidPlugin.setConnectionProperties("druid.timeBetweenLogStatsMillis="+ Duration.ofHours(24).toMillis());
	    Slf4jLogFilter slf4jLogFilter = new Slf4jLogFilter();
	    slf4jLogFilter.setConnectionLogEnabled(false);
	    slf4jLogFilter.setResultSetLogEnabled(false);
	    slf4jLogFilter.setStatementParameterSetLogEnabled(false);
	    slf4jLogFilter.setConnectionLogEnabled(false);
	    slf4jLogFilter.setResultSetCloseAfterLogEnabled(false);
	    slf4jLogFilter.setConnectionCloseAfterLogEnabled(false);
	    slf4jLogFilter.setStatementParameterClearLogEnable(false);
	    slf4jLogFilter.setStatementPrepareAfterLogEnabled(false);
	    slf4jLogFilter.setStatementPrepareCallAfterLogEnabled(false);
	    slf4jLogFilter.setStatementCreateAfterLogEnabled(false);
	    slf4jLogFilter.setStatementCloseAfterLogEnabled(false);
	    
	    //设置输出执行后的日志 带执行耗时等信息
	    slf4jLogFilter.setStatementExecuteAfterLogEnabled(false);
	    //设置批量操作执行后的日志 带执行耗时等信息
	    slf4jLogFilter.setStatementExecuteBatchAfterLogEnabled(false);
	    //设置查询操作执行后的日志 带执行耗时等信息
	    slf4jLogFilter.setStatementExecuteQueryAfterLogEnabled(false);
	    //设置更新 插入 删除 操作执行后的日志 带执行耗时等信息
	    slf4jLogFilter.setStatementExecuteUpdateAfterLogEnabled(false);
	    //输出完整的SQL 将值替换掉问号，这个仅在开发模式下有效
	    slf4jLogFilter.setStatementExecutableSqlLogEnable(DEV_MODE);
	    
	    druidPlugin.addFilter(slf4jLogFilter);
		 if(DB_TYPE.equals(DBType.MYSQL)) {
			//指定初始化 编码为utf8mb4 
			druidPlugin.setConnectionInitSql("set names utf8mb4");
		 }
		return druidPlugin;
	} 

	/**
	 * 配置JFinal路由映射
	 */
	@Override
	public void configRoute(Routes me) {
		//后台管理 主模块路由配置
		me.add(new AdminRoutes());
		//后台管理 电商模块路由配置
		me.add(new MallAdminRoutes());
		//后台管理 微信模块路由配置
		me.add(new WechatAdminRoutes());
		//微信服务器与本服务通讯使用的前端路由
		me.add(new WechatRoutes());
		//网站前端访问 路由配置
		me.add(new WebRoutes());
		
		//后台管理 系统Api应用开发中心模块路由配置
		me.add(new AppDevCenterAdminRoutes());
		
		//后台管理 系统微信API路由配置
		me.add(new WechatApiRoutes());
		
		//demo使用 正式上线请删掉
		me.add(new DemoRoutes());
		//test专用的路由 正式上线请删掉
		me.add(new ApiTestRoutes());
		
		//二开专用扩展路由配置
		ExtendProjectConfig.configRoute(me);
		me.add(new Demo01Routes());
	}
	/**
	 * 配置JFinal插件
	 * 数据库连接池
	 * ORM
	 * 缓存等插件
	 * 自定义插件
	 */
	@Override
	public void configPlugin(Plugins me) {
		MainConfig.plugins=me;
		//配置数据库连接池等插件信息
		configJBoltMainDbPlugin(me);
		//配置Ehcache缓存
		me.add(new EhCachePlugin());
		//配置调度
		configCron4jPlugin(me);
		
		//二开配置扩展插件
		ExtendProjectConfig.configPlugin(me);
	}
	
	/**
	 * 配置自动调度插件
	 * @param me
	 */
	private void configCron4jPlugin(Plugins me) {
//	    Cron4jPlugin cron4jPlugin = new Cron4jPlugin();
//	    cron4jPlugin.addTask("0-59/1 * * * *", new WechatMediaDownloaTask());
//	    me.add(cron4jPlugin);
	}
	/**
	 * 配置数据库连接池等插件信息
	 * @param me
	 */
	private void configJBoltMainDbPlugin(Plugins me) {
		//配置数据库连接池插件
		DruidPlugin dbPlugin=createDruidPlugin();
		me.add(dbPlugin);
		//orm映射 配置ActiveRecord插件
		ActiveRecordPlugin arp=new ActiveRecordPlugin(dbPlugin);
		//arp.setShowSql(prop.getBoolean("dev_mode",false));
		
		//设置方言
		setDialect(arp);
		
		/********在此添加数据库 表-Model 映射*********/
		_MappingKit.mapping(arp);
		//设置加载位置
		Engine sqlEngine=arp.getEngine();
		sqlEngine.setSourceFactory(new ClassPathSourceFactory());
		sqlEngine.addDirective("sqlValue", SqlValueDirective.class);
		sqlEngine.addDirective("likeValue", LikeValueDirective.class);
		sqlEngine.addSharedObject("SqlUtil", new SqlUtil());
		//设置不区分大小写
		arp.setContainerFactory(new CaseInsensitiveContainerFactory(true));
		//配置加载Sql模板的具体路径
		arp.addSqlTemplate("/sql/"+DB_TYPE+"/all_sqls.sql");
		//配置模板热加载
		sqlEngine.setDevMode(prop.getBoolean("dbsql_engine_dev_mode", false));
		
		//处理二开配置扩展
		ExtendProjectConfig.configMainDbPlugin(dbPlugin,arp,sqlEngine);
		
		//添加到插件列表中
		me.add(dbPlugin);
		me.add(arp);
		
	}
	
	/**
	 * 设置方言
	 * @param arp
	 */
	public static void setDialect(ActiveRecordPlugin arp) {
		switch (DB_TYPE) {
		case DBType.MYSQL:
			arp.setDialect(new MysqlDialect());
			break;
		case DBType.ORACLE:
			arp.setDialect(new OracleDialect());
			break;
		case DBType.SQLSERVER:
			arp.setDialect(new SqlServerDialect());
			break;
		case DBType.POSTGRESQL:
			arp.setDialect(new PostgreSqlDialect());
			break;
		default:
			arp.setDialect(new AnsiSqlDialect());
			break;
		}
	}
	/**
	 * 配置全局拦截器
	 */
	@Override
	public void configInterceptor(Interceptors me) {
		me.addGlobalActionInterceptor(new SessionInViewInterceptor());
	}
	/**
	 * 配置全局处理器
	 */
	@Override
	public void configHandler(Handlers me) {
		JBoltBaseHandler baseHandler=new JBoltBaseHandler();
		//配置baseHandler 处理页面basePath pmkey 静态资源html直接访问拦截等
		baseHandler.unlimited("/assets/plugins/","/admin/druid/monitor/","/neditor/");
		me.add(baseHandler);
		//配置druid监控 和 druid权限控制
		configDruidMonitor(me);
		
		//配置xss攻击 处理器
		me.add(new XssHandler());
		
		//二开配置扩展全局处理器
		ExtendProjectConfig.configHandler(me,baseHandler);
	}
	/**
	  * 配置druid监控 和 druid权限控制
	 * @param me
	 */
	private void configDruidMonitor(Handlers me) {
		
		JBoltDruidStatViewHandler dvh = new JBoltDruidStatViewHandler("/admin/druid/monitor",new IDruidStatViewAuth(){
			public boolean isPermitted(HttpServletRequest request) {
				HttpSession hs = request.getSession(false);
				if(hs==null) {return false;}
				//从session里拿到数据
				Object userId=hs.getAttribute(SessionKey.ADMIN_USER_ID);
				if(userId==null||userId.toString().equals("0")) {return false;}
				User user=CACHE.me.getUser(Integer.parseInt(userId.toString()));
				if(user==null) {
					return false;
				}
				if(user.getEnable()==false) {
					return false;
				}
				//超级管理可以直接看
				if(user.getIsSystemAdmin()) {
					return true;
				}
				boolean has=UserAuthKit.hasPermission(Integer.parseInt(userId.toString()), true, PermissionKey.DRUID_MONITOR);
				return has;
			}
		});
		me.add(dvh);
		
	}
	/**
	 * 配置模板引擎 
	 */
	@Override
	public void configEngine(Engine me) {
		//这里只有选择JFinal TPL的时候才用
		me.setDevMode(prop.getBoolean("engine_dev_mode",false));
		//配置自定义指令
		me.addDirective("ajaxPortal", AjaxPortalDirective.class);
		me.addDirective("realImage", RealImageDirective.class);
		me.addDirective("realUrl", RealUrlDirective.class);
		me.addDirective("datetime", DateTimeDirective.class);
		me.addDirective("permission", PermissionDirective.class);
		me.addDirective("globalConfig", GlobalConfigDirective.class);		
		me.addDirective("sex", SexDirective.class);		
		me.addDirective("rownum", RowNumberDirective.class);		
		me.addDirective("jboltAdminLogo", JBoltAdminLogoDirective.class);		
		me.addDirective("action", ActionDirective.class);		
		
		//配置共享对象
		me.addSharedObject("DateUtil", new DateUtil());
		//添加CACHE访问
		me.addSharedObject("CACHE", CACHE.me);
		//添加角色、权限 静态方法
		me.addSharedStaticMethod(UserAuthKit.class);
		//添加sessionKey的访问
		me.addSharedObject("SessionKey", new SessionKey());
		//添加GlobalConfig的访问
		me.addSharedObject("GlobalConfigKey", new GlobalConfigKey());
		//添加PermissionKey的访问
		me.addSharedObject("PermissionKey", new PermissionKey());
		//添加RandomUtil的访问
		me.addSharedObject("RandomUtil", new RandomUtil());
		
		//将枚举添加到模板里
		JBoltEnum.addEnjoyEngineShareObject(me, WechatMpinfoType.class);
		
		//配置layout共享
		//后台主pjax加载结构layout
		me.addSharedFunction("/_view/_admin/common/__admin_layout.html");
		//后台所有Dialog的页面 都是用这个layout
		me.addSharedFunction("/_view/_admin/common/__admin_dialog_layout.html");
		//后台所有Iframe的页面 都是用这个layout
		me.addSharedFunction("/_view/_admin/common/__admin_iframe_layout.html");
		//后台所有JBoltLayer组件加载的页面 都是用这个layout
		me.addSharedFunction("/_view/_admin/common/__admin_jboltlayer_layout.html");
		//常用前端组件
		me.addSharedFunction("/_view/_admin/common/__jboltassets.html");
		
		//二开扩展配置 模板引擎
		ExtendProjectConfig.configEngine(me);
	}
	
	
	public static void main(String[] args) {
		//统一使用JBoltStarter去启动 这里还保留是为了JBolt IDE插件兼容使用
		JBoltStarter.me.run();
	}

	@Override
	public void onStart() {
		//1、自动执行一些需要升级的操作
		JBoltAutoUpgrade.me.exe();
		//2、配置action report输出位置
		configActionReportWriter();
		//3、配置JBoltAutoCacheLog
		configJBoltAutoCacheLog();
		//4、配置assets version
		changeAssetsVersion();
		configAssetsVersion();
		//4、配置微信公众平台
		configWechat();
		
		//二开扩展配置服务器启动后处理
		ExtendProjectConfig.onStart();
	}

	/**
	 * 配置JBoltAutoCacheLog
	 */
	public static void configJBoltAutoCacheLog() {
		JBOLT_AUTO_CACHE_LOG=CACHE.me.getJBoltAutoCacheLog();
	}
	/**
	  * 配置assets version
	 */
	public static void configAssetsVersion() {
		ASSETS_VERSION=CACHE.me.getAssetsVersion();
	}
	/**
	 * 替换新的资源版本号
	 */
	private void changeAssetsVersion() {
		//每次重新启动系统需要重新换一个资源版本号 防止有静态资源缓存min.js和min.css
		GlobalConfigService globalConfigService=Aop.get(GlobalConfigService.class);
		globalConfigService.changeAssetsVersion();
	}
	/**
	 * 配置JFinal action Report输出位置
	 */
	public static void configActionReportWriter() {
		//判断action report输出方式是jboltlog的话 就使用JBolt的日志输出到控制台和文件归档
		ACTION_REPORT_WRITER=CACHE.me.getJFinalActionReportWriter();
		if(ACTION_REPORT_WRITER.equals("jboltlog")) {
			ActionReporter.setWriter(new JBoltActionReportLogWriter());
		}else {
			ActionReporter.setWriter(new JBoltActionReportSystemOutWriter());
		}
		
	}
	/**
	 * 配置微信公众平台
	 */
	private void configWechat() {
		ApiConfigKit.setDevMode(prop.getBoolean("wechat_dev_mode",false));
		WxaConfigKit.setDevMode(prop.getBoolean("wechat_dev_mode",false));
		WechatConfigService wechatConfigService=Aop.get(WechatConfigService.class);
		wechatConfigService.configAllEnable();
	}
	
	public static boolean isOracle() {
		return DBType.ORACLE.equalsIgnoreCase(DB_TYPE);
	}
	public static boolean isPostgresql() {
		return DBType.POSTGRESQL.equalsIgnoreCase(DB_TYPE);
	}
	public static boolean isMysql() {
		return DBType.MYSQL.equalsIgnoreCase(DB_TYPE);
	}
	public static boolean isSqlServer() {
		return DBType.SQLSERVER.equalsIgnoreCase(DB_TYPE);
	}
	/**
	 * id使用序列自增
	 * @return
	 */
	public static boolean isIdGenModeSequence() {
		return "sequence".equalsIgnoreCase(ID_GEN_MODE);
	}
	
	@Override
	public void onStop() {
		//二开扩展配置服务器关闭前处理
		ExtendProjectConfig.onStop();
	}
}
