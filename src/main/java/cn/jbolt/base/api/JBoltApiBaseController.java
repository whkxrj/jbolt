package cn.jbolt.base.api;

import java.util.List;

import com.jfinal.aop.Before;

import cn.jbolt.base.JBoltCommonController;
import cn.jbolt.base.JBoltControllerKit;
import cn.jbolt.common.model.Application;
/**
 * 所有写接口的Controller 统一继承APIBaseController
 * @ClassName:  ApiBaseController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年9月13日   
 */
@Before(JBoltApiInterceptor.class)
public class JBoltApiBaseController extends JBoltCommonController {
	/**
	 * 获得当前访问的application
	 * @return
	 */
	protected Application getApplication() {
		return JBoltApiKit.getApplication();
	}
	/**
	  * 获得当前访问的appId
	 * @return
	 */
	protected String getAppId() {
		return JBoltApiKit.getAppId();
	}
	/**
	 * 获得当前访问的userId
	 * @return
	 */
	protected Object getApiUserId() {
		return JBoltApiKit.getApiUserId();
	}
	/**
	 * 获得当前访问的apiUser绑定的其它用户表
	 * @return
	 */
	protected List<JBoltApiBindUserBean> getBindUsers() {
		return JBoltApiKit.getBindUsers();
	}
	/**
	 * 获得当前访问的ApiUser
	 * @return
	 */
	protected JBoltApiUser getApiUser() {
		return JBoltApiKit.getApiUser();
	}
	
	/**
	 * api响应返回 jboltApiRet
	 * @param ret
	 */
	protected void renderJBoltApiRet(JBoltApiRet ret) {
		JBoltControllerKit.renderJBoltApiRet(this, ret);
	}
	/**
	 * api响应SUCCESS 返回jboltApiRet 带着数据
	 * @param jBoltApiRet
	 */
	protected void renderJBoltApiSuccessWithData(Object data) {
		renderJBoltApiRet(JBoltApiRet.successWithData(data));
	}
	/**
	 * API响应 fail
	 * @param msg
	 */
	protected void renderJBoltApiFail(String msg) {
		renderJBoltApiRet(JBoltApiRet.API_FAIL(getApplication(),msg));
	}
	/**
	 * API响应 fail 带着错误信息和 数据
	 * @param msg
	 * @param data
	 */
	protected void renderJBoltApiFail(String msg,Object data) {
		renderJBoltApiRet(JBoltApiRet.API_FAIL(getApplication(),msg,data));
	}
	/**
	 * API响应 success
	 * @param msg
	 */
	protected void renderJBoltApiSuccess(String msg) {
		renderJBoltApiRet(JBoltApiRet.API_SUCCESS(msg));
	}
	/**
	 * API响应 success 带着信息和数据
	 * @param msg
	 * @param data
	 */
	protected void renderJBoltApiSuccess(String msg,Object data) {
		renderJBoltApiRet(JBoltApiRet.API_SUCCESS(msg,data));
	}
	
}
