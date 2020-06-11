package cn.jbolt.base.api;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;

import cn.hutool.core.util.ArrayUtil;
import cn.jbolt.base.JBoltControllerKit;
import cn.jbolt.base.JBoltEnum;
import cn.jbolt.base.api.httpmethod.JBoltHttpConnect;
import cn.jbolt.base.api.httpmethod.JBoltHttpDelete;
import cn.jbolt.base.api.httpmethod.JBoltHttpGet;
import cn.jbolt.base.api.httpmethod.JBoltHttpHead;
import cn.jbolt.base.api.httpmethod.JBoltHttpMethod;
import cn.jbolt.base.api.httpmethod.JBoltHttpOptions;
import cn.jbolt.base.api.httpmethod.JBoltHttpPatch;
import cn.jbolt.base.api.httpmethod.JBoltHttpPost;
import cn.jbolt.base.api.httpmethod.JBoltHttpPut;
import cn.jbolt.base.api.httpmethod.JBoltHttpTrace;
import cn.jbolt.common.config.Msg;
import cn.jbolt.common.model.Application;
import cn.jbolt.common.util.CACHE;

/**
 * API接口专用拦截器，用于API Token校验鉴权等
 * @ClassName: ApiInterceptor
 * @author: JFinal学院-小木 QQ：909854136
 * @date: 2019年9月12日
 */
public class JBoltApiInterceptor implements Interceptor {
	private static final Log API_LOG=Log.getLog("JBoltApiLog");
	/**
	 * 第三方应用调用接口携带Header中的APPID的key
	 */
	private static final String APPID_KEY="jboltappid";
	@Override
	public void intercept(Invocation inv) {
		if (!(inv.getController() instanceof JBoltApiBaseController)) {
			throw new RuntimeException("控制器需要继承 ApiBaseController");
		}
		JBoltApiBaseController controller=(JBoltApiBaseController)inv.getController();
		Method actionMethod=inv.getMethod();
		//处理跨域实际请求
		JBoltControllerKit.processCrossOrign(controller,actionMethod);
		String reqMethod=controller.getRequest().getMethod();
		//处理预检请求
		if(JBoltControllerKit.isOptions(reqMethod)) {
			controller.renderJson(JBoltApiRet.OPTIONS);
			return;
		}
		//处理不合法请求 method
		boolean reqMethodOk=checkRequestMethod(reqMethod,actionMethod);
		if(!reqMethodOk) {
			controller.renderJBoltApiRet(JBoltApiRet.HTTP_METHOD_ERROR);
			return;
		}
		
		//必须在请求request的header中标明是JBOLTAPI="true";
		boolean isJboltApiRequest=JBoltControllerKit.isCallJBoltApi(controller);
		if(isJboltApiRequest==false) {
			API_LOG.error("访问接口Header中未带JBOLTAPI='true'调用标识，不予处理");
			controller.renderJsonFail(Msg.NOT_ALLOWED_JBOLT_API);
			return;
		}
		
		//判断Header里有没有设置JBOLT-APPID
		String appId=controller.getHeader(APPID_KEY);
		if(StrKit.isBlank(appId)) {
			controller.renderJBoltApiRet(JBoltApiRet.NO_JBOLT_APPID);
			return;
		}
		
		//如果cache里拿不到 数据库里也没有了 返回失败消息
		Application application=CACHE.me.getApiCallApplication(appId);
		if(application==null) {
    		controller.renderJBoltApiRet(JBoltApiRet.APPLICATION_NOT_EXIST(appId));
    		return;
    	}
		
		//如果application被禁用了 返回失败消息
    	if(application.getEnable()==false) {
    		controller.renderJBoltApiRet(JBoltApiRet.APPLICATION_NOT_ENABLE(application));
    		return;
    	}
    	
    	//app进入threadLocal
		JBoltApiKit.setApplication(application);
		try {
			//判断如果action上带着ApiOpen 说明是公开接口
			if(actionMethod.isAnnotationPresent(OpenAPi.class)) {
				inv.invoke();
				return;
		    }
			//判断如果action上带着ApplyApiToken
			if(actionMethod.isAnnotationPresent(JBoltApplyJWT.class)) {
				inv.invoke();
				JBoltApiJwtManger.me().createJBoltApiTokenToResponse(controller,application);
				return;
		    }
	
			//如果没有带着ApplyApiToken 说明这是一个需要接口鉴权JWT的请求
			JBoltJwtParseRet jwtParseRet = JBoltApiJwtManger.me().getJwtParseRet(controller);
			if (jwtParseRet.isOk()) {
				JBoltApiKit.setJwtParseRet(jwtParseRet);
				inv.invoke();
			}else {
				API_LOG.error("访问API:[{}:{}-{}]\n错误原因:{}",controller.getClass().getName(),actionMethod.getName(),inv.getActionKey(),jwtParseRet.getApiRet().getMsg());
				controller.renderJBoltApiRet(jwtParseRet.getApiRet());
			}
		} finally {
			//清空threadLocal 线程信息
			JBoltApiKit.clear();
		}

	}
	/**
	 * 检测method是否存在不按要求method请求的问题
	 * @param reqMethod
	 * @param actionMethod
	 * @return
	 */
	private boolean checkRequestMethod(String reqMethod, Method actionMethod) {
		Annotation[] annotations=actionMethod.getAnnotations();
		//如果没有注解 就不检测了
		if(ArrayUtil.isEmpty(annotations)) {return true;}
		//拿到枚举method 如果是空系统没有设置那就可以访问
		HttpMethod httpMethod=JBoltEnum.getEnumObjectByName(HttpMethod.class, reqMethod);
		if(httpMethod==null) {return true;}
		//优先判断@JBoltHttpMethod注解 其他的可以忽略
		if(actionMethod.isAnnotationPresent(JBoltHttpMethod.class)) {
			return checkRequestMethodByJBoltApiMethod(httpMethod, actionMethod.getAnnotation(JBoltHttpMethod.class));
		}
		boolean any=false;
		//有任何一个 就要继续判断 一个都没有就返回true
		for(Annotation annotation:annotations) {
			if(
					annotation instanceof JBoltHttpGet
					||
					annotation instanceof JBoltHttpPost
					||
					annotation instanceof JBoltHttpPut
					||
					annotation instanceof JBoltHttpDelete
					||
					annotation instanceof JBoltHttpOptions
					||
					annotation instanceof JBoltHttpHead
					||
					annotation instanceof JBoltHttpPatch
					||
					annotation instanceof JBoltHttpTrace
					) {
				any=true;
			}
		}
		if(!any) {
			return true;
		}
		
		
		//如果没有@JBoltHttpMethod注解 再去根据当前的Method找找有没有注解
		boolean flag=true;
		switch (httpMethod) {
			case GET:
				flag=actionMethod.isAnnotationPresent(JBoltHttpGet.class);
				break;
			case POST:
				flag=actionMethod.isAnnotationPresent(JBoltHttpPost.class);
				break;
			case DELETE:
				flag=actionMethod.isAnnotationPresent(JBoltHttpDelete.class);
				break;
			case PUT:
				flag=actionMethod.isAnnotationPresent(JBoltHttpPut.class);
				break;
			case HEAD:
				flag=actionMethod.isAnnotationPresent(JBoltHttpHead.class);
				break;
			case TRACE:
				flag=actionMethod.isAnnotationPresent(JBoltHttpTrace.class);
				break;
			case PATCH:
				flag=actionMethod.isAnnotationPresent(JBoltHttpPatch.class);
				break;
			case CONNECT:
				flag=actionMethod.isAnnotationPresent(JBoltHttpConnect.class);
				break;
			case OPTIONS:
				flag=actionMethod.isAnnotationPresent(JBoltHttpOptions.class);
				break;
		}
		return flag;
	}
	/**
	 * 判断是否符合限定JBoltHttpMethod
	 * @param reqMethod
	 * @param jBoltApiMethod
	 * @return
	 */
	private boolean checkRequestMethodByJBoltApiMethod(HttpMethod reqMethod, JBoltHttpMethod jBoltHttpMethod) {
		HttpMethod[] methods = jBoltHttpMethod.value();
		if (methods != null && methods.length >0) {
			for(HttpMethod m:methods) {
				if(reqMethod.equals(m)) {//只要有一个符合就过
					return true;
				}
			}
		}else {
			return true;
		}
		return false;
	}
}
