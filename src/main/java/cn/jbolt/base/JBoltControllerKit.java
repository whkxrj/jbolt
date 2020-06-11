package cn.jbolt.base;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletResponse;

import com.jfinal.core.Action;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.kit.Ret;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;

import cn.jbolt.base.api.JBoltApiJwtManger;
import cn.jbolt.base.api.JBoltApiKit;
import cn.jbolt.base.api.JBoltApiRet;
import cn.jbolt.base.crossorigin.CrossOrigin;
import cn.jbolt.base.para.JBoltPara;
import cn.jbolt.common.config.SessionKey;
/**
 * controller层公用工具类
 * @ClassName:  ControllerKit   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年9月17日   
 */
public class JBoltControllerKit {
	public static final Log JBOLT_API_LOG=Log.getLog("JBoltApiLog");
	/**
	 * 成功返回值 默认
	 */
	private static final Ret JSON_SUCCESS=Ret.ok();
	private static final String ADMIN_NO_LOGIN_INFO="尚未登录,请<a data-dialogbtn class='text-danger' data-title='请重新登录系统'  data-handler='refreshPjaxContainer' data-area='500,400' data-url='admin/relogin'>点此</a>重新登录";
	private static final String ADMIN_AJAXPORTAL_NO_LOGIN_INFO="尚未登录,请<a data-dialogbtn class='text-danger' data-title='请重新登录系统'  data-handler='refreshCurrentAjaxPortal' data-area='500,400' data-url='admin/relogin'>点此</a>重新登录";
	/**
	 * AjaxPortal请求返回错误信息
	 * @param controller
	 * @param msg
	 */
	public static void renderErrorPortal(Controller controller,String msg) {
		setMsg(controller,msg);
		controller.render("/_view/_admin/common/msg/errorportal.html");
	}
	/**
	 * 判断是否是Ajax请求
	 * @return
	 */
	public static boolean isAjax(Controller controller){
		return "isAjax".equals(controller.getAttr("_jb_rqtype_"));
	}
	/**
	 * 判断是否是normal请求
	 * @return
	 */
	public static boolean isNormal(Controller controller){
		return "isNormal".equals(controller.getAttr("_jb_rqtype_"));
	}
	/**
	 * 判断请求是否是Pjax请求
	 * @return
	 */
	public static boolean isPjax(Controller controller){
		return "isPjax".equals(controller.getAttr("_jb_rqtype_"));
	}
	 
	/**
	 * 判断请求是否是ajaxPortal请求
	 * @return
	 */
	public static boolean isAjaxPortal(Controller controller){
		return "isAjaxPortal".equals(controller.getAttr("_jb_rqtype_"));
	}
	/**
	 * 判断请求是否是Jbolt Api请求
	 * @return
	 */
	public static boolean isCallJBoltApi(Controller controller){
		return "isJBoltApi".equals(controller.getAttr("_jb_rqtype_"));
	}
	/**
	 * pjax请求返回错误信息片段
	 * @param controller
	 * @param msg
	 */
	public static void renderErrorPjax(Controller controller, String msg) {
		setMsg(controller,msg);
		controller.render("/_view/_admin/common/msg/errorpjax.html");
		
	}
	/**
	 * form提交跳转 表单跳转到错误信息显示
	 * @param controller
	 * @param msg
	 */
	public static void renderFormError(Controller controller, String msg) {
		setMsg(controller,msg);
		controller.render("/_view/_admin/common/msg/formerror.html");
	}
	/**
	  * 返回失败信息 json格式
	 * @param controller
	 * @param msg
	 */
	public static void renderJsonFail(Controller controller, String msg) {
		controller.renderJson(Ret.fail("msg", msg));
	}
	/**
	 * 拦截器层 根据request类型响应不同错误信息
	 * @param controller
	 * @param msg
	 */
	public static void renderInterceptorErrorInfo(Controller controller,String msg) {
		renderError(controller, msg);
	}
	/**
	 * 拦截器返回未登录错误信息
	 * @param controller
	 */
	public static void renderAdminInterceptorNotLoginInfo(Controller controller) {
		if (isCallJBoltApi(controller)) {
			renderJBoltApiRet(controller,JBoltApiRet.NOT_ADMIN_LOGIN(JBoltApiKit.getApplication()));
		}else if (isPjax(controller)) {
			renderErrorPjax(controller,ADMIN_NO_LOGIN_INFO);
		} else if (isAjaxPortal(controller)) {
			renderErrorPortal(controller,ADMIN_AJAXPORTAL_NO_LOGIN_INFO);
		} else if (isAjax(controller)) {
			renderJsonFail(controller,"jbolt_nologin");
		} else {
			// 判断如果没有登录 需要跳转到登录页面
			toAdminLogin(controller);
		}
		
	}
	
	/**
	 * 调用系统admin后端 API的应用返回结果
	 * @param controller
	 * @param ret
	 */
	public static void renderJBoltApiRet(Controller controller, JBoltApiRet ret) {
		if(ret.isFail()) {
			//单独处理错误日志
			JBOLT_API_LOG.error("[{}-[{}]-{}]",ret.getMsg(),ret.getCode(),JsonKit.toJson(ret.getData()));
		}
		controller.renderJson(ret);
	}
	
	/**
	 * 调用系统admin后端 API的应用返回结果 fail
	 * @param controller
	 * @param msg
	 */
	public static void renderJBoltApiFail(Controller controller, String msg) {
		renderJBoltApiRet(controller,JBoltApiRet.API_FAIL(JBoltApiKit.getApplication(),msg));
	}
	
	/**
	 * 调用系统admin后端 API的应用返回结果 success data
	 * @param controller
	 * @param data
	 */
	public static void renderJBoltApiSuccessWithData(Controller controller, Object data) {
		renderJBoltApiRet(controller,JBoltApiRet.successWithData(data));
	}
	/**
	 * 调用系统admin后端 API的应用返回结果 fail data
	 * @param controller
	 * @param data
	 */
	public static void renderJBoltApiFailWithData(Controller controller,String msg ,Object data) {
		renderJBoltApiRet(controller,JBoltApiRet.API_FAIL(JBoltApiKit.getApplication(), msg, data));
	}
	
	/**
	 * 调用系统admin后端 API的应用返回结果 success
	 * @param controller
	 */
	public static void renderJBoltApiSuccess(Controller controller) {
		renderJBoltApiRet(controller,JBoltApiRet.API_SUCCESS);
	}
	/**
	 * 跳转到登录页面
	 */
	public static void toAdminLogin(Controller controller) {
		controller.redirect("/admin/login");
	}
	/**
	 * 	返回Validator错误信息
	 * @param controller
	 */
	public static void renderValidatorError(Controller controller) {
		if(isCallJBoltApi(controller)) {
			renderJBoltApiFail(controller,controller.getAttr("msg"));
		}else if(isPjax(controller)) {
			renderErrorPjax(controller,controller.getAttr("msg"));
		}else if(isAjaxPortal(controller)) {
			renderErrorPortal(controller,controller.getAttr("msg"));
		}else if(isAjax(controller)) {
			renderJsonFail(controller,controller.getAttr("msg"));
		}else {
			renderDialogError(controller,controller.getAttr("msg"));
		}
	}
	/**
	 * 设置msg信息
	 * @param controller
	 * @param msg
	 */
	public static void setMsg(Controller controller,String msg) {
		controller.set("msg", msg);
	}
	/**
	 * 
	 * @param controller
	 * @param msg
	 */
	public static void renderDialogError(Controller controller, String msg) {
		setMsg(controller,msg);
		controller.render("/_view/_admin/common/msg/formerror.html");
	}
	/**
	 * 返回404错误信息
	 * @param controller
	 */
	public static void render404Error(Controller controller) {
		String msg="404,您访问的资源不存在!";
		renderError(controller, msg);
	}
	/**
	 * render 锁屏消息
	 * @param controller
	 */
	public static void renderAdminSystemLockedInfo(Controller controller) {
		String msg="jbolt_system_locked";
		renderError(controller, msg);
	}
	/**
	 * render 锁屏消息
	 * @param controller
	 */
	public static void renderSystemLockedPage(Controller controller) {
		controller.render("/_view/_admin/common/msg/systemlocked.html");
	}
	
	/**
	 * 设置锁屏
	 */
	public static void lockSystem(Controller controller) {
		controller.setSessionAttr(SessionKey.JBOLT_LOCK_SYSTEM, true);
		renderJsonSuccess(controller);
	}
	/**
	 * 设置屏幕解锁
	 */
	public static void unLockSystem(Controller controller) {
		controller.removeSessionAttr(SessionKey.JBOLT_LOCK_SYSTEM);
		renderJsonSuccess(controller);
	}
	
	/**
	 * render错误信息
	 * @param controller
	 * @param msg
	 */
	private static void renderError(Controller controller,String msg) {
		if (isCallJBoltApi(controller)) {
			renderJsonFail(controller,msg);
		}else if (isPjax(controller)) {
			renderErrorPjax(controller,msg);
		} else if (isAjaxPortal(controller)) {
			renderErrorPortal(controller,msg);
		} else if (isAjax(controller)) {
			renderJsonFail(controller,msg);
		} else {
			renderFormError(controller,msg);
		}
	}
	/**
	 * 返回正确json result
	 * @param controller
	 */
	public static void renderJsonSuccess(Controller controller) {
		controller.renderJson(JSON_SUCCESS);
	}
	/**
	 * 返回正确json result 以及Msg
	 * @param controller
	 * @param msg
	 */
	public static void renderJsonSuccess(Controller controller,String msg) {
		controller.renderJson(Ret.ok().set("msg",msg));
	}
	
	/**
	 * 返回正确json result 并带着特殊数据
	 * @param controller
	 * @param data
	 */
	public static void renderJsonData(Controller controller, Object data) {
		controller.renderJson(Ret.ok("data",data));
	}
	/**
	 * 处理跨域
	 * @param controller
	 * @param method
	 */
	public static void processCrossOrign(Controller controller, Method method) {
		if (checkNeedCrossOrign(controller, method)) {
			handlerCrossOrign(controller.getResponse());
		}
	}
	
	/**
	 * 检查是否跨域
	 * @param controller
	 * @param method
	 */
	public static boolean checkNeedCrossOrign(Controller controller, Method method) {
			return controller.getClass().isAnnotationPresent(CrossOrigin.class)
					||method.isAnnotationPresent(CrossOrigin.class);
	}
	/**
	 * response 设置跨域
	 * @param response
	 */
	private static void handlerCrossOrign(HttpServletResponse response) {
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("Access-Control-Allow-Methods", "POST,GET,PUT,DELETE,PATCH,OPTIONS,HEAD,TRACE");
			response.setHeader("Access-Control-Max-Age", "3600");
			response.setHeader("Access-Control-Allow-Headers",
					"Origin,Accept,Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With,AJAX-PORTAL,JBOLTAPI,jboltappid,jboltjwt,jboltsignature,jboltnonce,jbolttimestamp");
	}
	 
	
	/**
	 * 设置API响应header中的JWT
	 * @param controller
	 * @param jwt
	 */
	public static void setApiResponseJwt(Controller controller, String jwt) {
		// 设置到response里 jwt
		controller.getResponse().setHeader(JBoltApiJwtManger.JBOLT_API_TOKEN_KEY, jwt);
	}
	/**
	 * 从请求里获取JBoltPara
	 * @param controller
	 * @return
	 */
	public static JBoltPara getJBoltPara(Controller controller) {
		return getJBoltPara(null, controller);
	}
	/**
	 * 从请求里获取JBoltPara
	 * @param action
	 * @param controller
	 * @return
	 */
	public static JBoltPara getJBoltPara(Action action,Controller controller) {
		String reqMethod=controller.getRequest().getMethod();
		JBoltPara para=null;
		if(reqMethod.equalsIgnoreCase("get")) {
			para=new JBoltPara(controller.getParaMap());
		}else {
			String contentType=controller.getHeader("content-type");
			if(StrKit.notBlank(contentType)) {
				System.out.println(contentType);
				if(contentType.equalsIgnoreCase("application/json")) {
					para=new JBoltPara(controller.getRawData());
				}else if(contentType.toLowerCase().startsWith("multipart/form-data;")){
					para=new JBoltPara(controller.getParaMap());
				}else if(contentType.equalsIgnoreCase("application/x-www-form-urlencoded")){
					para=new JBoltPara(controller.getParaMap());
				}
			}
		}
		return para;
	}
	/**
	 * 判断是否为预检行为请求
	 * @param reqMethod
	 * @return
	 */
	public static boolean isOptions(String reqMethod) {
		return reqMethod.equalsIgnoreCase("OPTIONS");
	}
	
}
