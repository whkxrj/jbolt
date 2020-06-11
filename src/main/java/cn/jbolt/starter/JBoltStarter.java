package cn.jbolt.starter;

import com.jfinal.server.undertow.UndertowServer;
import com.jfinal.server.undertow.WebBuilder;

import cn.jbolt.common.config.MainConfig;

/**
 * JBolt项目启动器
 * @ClassName:  JBoltStarter   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年11月9日   
 */
public class JBoltStarter {
	public static final JBoltStarter me=new JBoltStarter();
	/**
	 * 配置Filter
	 * @param builder
	 */
	public void configFilter(WebBuilder builder) {
		// 配置 Filter
		//builder.addFilter("myFilter", "com.abc.MyFilter");
		//builder.addFilterUrlMapping("myFilter", "/*");
		//builder.addFilterInitParam("myFilter", "key", "value");
	}
	/**
	 * 配置Servlet
	 * @param builder
	 */
	public void configServlet(WebBuilder builder) {
		// 配置 Servlet
		//builder.addServlet("myServlet", "com.abc.MyServlet");
		//builder.addServletMapping("myServlet", "*.do");
		//builder.addServletInitParam("myServlet", "key", "value");
	}
	/**
	 * 配置监听Listener
	 * @param builder
	 */
	public void configListener(WebBuilder builder) {
		// 配置 Listener
		//builder.addListener("com.abc.MyListener");
	}
	/**
	 * 配置webSocket
	 * @param builder
	 */
	public void configWebSocket(WebBuilder builder) {
		// 配置 WebSocket，MyWebSocket 需使用 ServerEndpoint 注解
		//builder.addWebSocketEndpoint("com.abc.MyWebSocket");
	}
	/**
	 * 配置JSP
	 * @param builder
	 */
	public void configJsp(WebBuilder builder) {
//		builder.getDeploymentInfo().addServlet(JspServletBuilder.createServlet("Default Jsp Servlet", "*.jsp"));
//	    HashMap tagLibraryInfo = new HashMap();
//	    JspServletBuilder.setupDeployment(builder.getDeploymentInfo(), new HashMap(),
//	    tagLibraryInfo, new HackInstanceManager());
	}
	/**
	 * 配置默认errorPage welcomePage等默认页面
	 * @param builder
	 */
	public void configDefaultPage(WebBuilder builder) {
		builder.add404ErrorPage("/_view/_admin/common/msg/undertow_404.html");
		builder.addErrorPage(500,"/_view/_admin/common/msg/undertow_500.html");
//		builder.addWelcomePage("/_view/_admin/common/msg/undertow_welcome.html");
	}
	/**
	 * 创建并启动
	 */
	public void run() {
		UndertowServer.create(MainConfig.class,"undertow.properties")
		  .configWeb(builder -> {
			  	//配置Filter
//			  	configFilter(builder);
			  	//配置Servlet
//			  	configServlet(builder);
			  	//配置监听Listener
//			  	configListener(builder);
			  	//配置webSocket
//			  	configWebSocket(builder);
			  	//配置Jsp支持
//			  	configJsp(builder);
			  	//配置一些Undertow默认页面 404 welcomepage等
			  	configDefaultPage(builder);
	       })
		  .start();
	}
	
	/**
	 * 启动器入口
	 * @param args
	 */
	public static void main(String[] args) {
		JBoltStarter.me.run();
	}
}
