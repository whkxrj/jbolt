package cn.jbolt.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jfinal.handler.Handler;
import com.jfinal.kit.HandlerKit;
import com.jfinal.kit.StrKit;

import cn.jbolt.common.config.MainConfig;
import cn.jbolt.common.util.ArrayUtil;
/**
 * JBolt开发平台全局handler
 * @ClassName:  BaseHandler   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年12月10日   
 */
public class JBoltBaseHandler extends Handler {
	private static final String HTTPS = "https";
	private static final String HTTP = "http";
	private static final String MHSP = "://";
	private static final String MH = ":";
	private static final String HTML = ".html";
	private static final String SLASH="/";
	private String[] unlimiteds;

	@Override
	public void handle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled) {
		String contextPath = request.getContextPath();
		request.setAttribute("ctx", contextPath);
		request.setAttribute("pmkey", (target.length()>=2&&target.charAt(0)=='/'&&target.charAt(1)!='/')?target.substring(1):target);
		request.setAttribute("need_always_https", MainConfig.NEED_ALWAYS_HTTPS);
		request.setAttribute("basepath", processBasepath(request));
//		request.setAttribute("jbolt_scheme", scheme);
		
		if (target.endsWith(HTML)&&checkNotInUnlimited(target)) {
			HandlerKit.renderError404(request, response, isHandled);
		} else {
			processJBoltRequest(target,request);
			next.handle(target, request, response, isHandled);
		}

	}
	/**
	 * 处理basePath 默认需要最后的斜杠
	 * @param request
	 * @return
	 */
	public static String processBasepath(HttpServletRequest request) {
		return processBasepath(request, true);
	}
	/**
	 * 处理basePath
	 * @param request
	 * @param needEndSlash 是否需要最后的斜杠
	 * @return
	 */
	public static String processBasepath(HttpServletRequest request,boolean needEndSlash) {
		return processBasepathStrBuilder(request, needEndSlash).toString();
	}
	/**
	 * 处理basePath 返回StringBUiler
	 * @param request
	 * @param needEndSlash 是否需要最后的斜杠
	 * @return
	 */
	public static StringBuilder processBasepathStrBuilder(HttpServletRequest request,boolean needEndSlash) {
		StringBuilder basePath=new StringBuilder();
		String scheme=request.getScheme();
		int port=request.getServerPort();
		if (MainConfig.NEED_ALWAYS_HTTPS) {
			scheme=HTTPS;
		} else {
			boolean isHttps=isHttps(request);
			if(isHttps) {
				scheme=HTTPS;
			}
		}
		basePath.append(scheme).append(MHSP).append(request.getServerName());
		if (port!= 80) {
			basePath.append(MH).append(port);
		}
		String contextPath=request.getContextPath();
		if(StrKit.isBlank(contextPath)){
			contextPath=SLASH;
		}else if(contextPath.endsWith(SLASH)==false){
			contextPath=contextPath+SLASH;
		}
		if(needEndSlash) {
			basePath.append(contextPath);
		}
		return basePath;
	}
	/**
	 * 检测是否https请求
	 * @param request
	 * @return
	 */
	public static boolean isHttps(HttpServletRequest request) {
        return HTTPS.equalsIgnoreCase(request.getHeader("X-Forwarded-Proto"))||HTTPS.equalsIgnoreCase(request.getScheme());
	}
	/**
	 * 处理请求类型
	 * @param target 
	 * @param request
	 */
	private void processJBoltRequest(String target, HttpServletRequest request) {
		if(target.endsWith(".js")||target.endsWith(".css")||target.endsWith(".ico")||target.endsWith(".jpg")||target.endsWith(".png")||target.endsWith(".webp")) {
//			System.out.println("忽略静态资源:"+target);
			return;
		}
		request.setAttribute("JBOLT_BASE_UPLOAD_PATH_PRE", MainConfig.BASE_UPLOAD_PATH_PRE);
		boolean isJBoltApi="true".equalsIgnoreCase(request.getHeader("JBOLTAPI")),isPjax=false,isAjaxPortal=false,isAjax=false;
		String type="isNormal";
		//判断是不是API SDK调用
		if(isJBoltApi) {
			type = "isJBoltApi";
		}else {
			isPjax="true".equalsIgnoreCase(request.getHeader("X-PJAX"));
			//判断是不是pjax
			if(isPjax) {
				type = "isPjax";
			}else {
				isAjaxPortal="true".equalsIgnoreCase(request.getHeader("AJAX-PORTAL"));
				//判断是不是ajaxPortal
				if(isAjaxPortal) {
					type = "isAjaxPortal";
				}else {
					String xrequestedwith = request.getHeader("X-Requested-With");
					isAjax=(xrequestedwith != null && xrequestedwith.equalsIgnoreCase("xmlhttprequest"));
					if(isAjax) {
						type = "isAjax";
					}
				}
			}
			
		}
		request.setAttribute("_jb_rqtype_",type);
//		System.out.println("请求地址:"+request.getRequestURL());
//		System.out.println("请求类型:"+type);
	}

	/**
	 * 检测是否属于忽略检测
	 * @param target
	 * @return
	 */
	private boolean checkNotInUnlimited(String target) {
		if(unlimiteds==null||unlimiteds.length==0) {
			return true;
		}
		boolean in=false;
		for(String l:unlimiteds) {
			if(target.equals(l)||target.indexOf(l)!=-1) {
				in=true;
				break;
			}
		}
		return !in;
	}
	/**
	 * 设置不检测的路径
	 * @param unlimiteds
	 * @return
	 */
	public JBoltBaseHandler unlimited(String... unlimiteds) {
		if(ArrayUtil.isEmpty(this.unlimiteds)) {
			this.unlimiteds=unlimiteds;
		}else {
			this.unlimiteds=ArrayUtil.merge(this.unlimiteds, unlimiteds);
		}
		return this;
	}
	

	 

}
