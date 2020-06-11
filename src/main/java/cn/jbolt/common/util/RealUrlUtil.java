package cn.jbolt.common.util;

import com.jfinal.kit.StrKit;

import cn.jbolt.common.config.GlobalConfigKey;
import cn.jbolt.common.config.MainConfig;

/** 
 * 获取真实访问地址  
 * @ClassName:  RealUrlUtil   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年4月14日 下午9:59:54   
 */
public class RealUrlUtil {
	private static final String DEFAULT_IMG="assets/img/uploadimg.png";
	public static String getImage(Object url){
		return getImage(url, null);
	}
	public static String getImage(Object url,Object defaultValue){
		if(defaultValue==null||StrKit.isBlank(defaultValue.toString())){
			defaultValue=DEFAULT_IMG;
		}
		return get(url, defaultValue);
	}
	
	public static String getWechatImage(String url){
		return getWechatImage(url, DEFAULT_IMG);
	}
	public static String getWechatImage(String url,String defaultValue){
		if(StrKit.isBlank(defaultValue)){
			defaultValue=DEFAULT_IMG;
		}
		String serverUrl=get(url, defaultValue);
		String domain=CACHE.me.getGlobalConfigValue(GlobalConfigKey.WECHAT_ASSETS_SERVER_DOMAIN);
		if(StrKit.isBlank(domain)) {
			System.out.println("全局配置表里 没有配置微信的资源根URL");
			return null;
		}
		return domain+((serverUrl.charAt(0)=='/')?serverUrl:("/"+serverUrl));
	}
	public static String get(Object url){
		return get(url, DEFAULT_IMG);
	}
	private static final String useDefault(Object defaultValue) {
		String result=(defaultValue==null?DEFAULT_IMG:defaultValue.toString().trim());
		if(StrKit.isBlank(result)) {
			return DEFAULT_IMG;
		}
		if(result.charAt(0)=='/'&&result.charAt(1)!='/') {
			result=result.substring(1);
		}
		return result;
	}
	public static String get(Object url,Object defaultValue){
		if((url==null||StrKit.isBlank(url.toString()))){
			return useDefault(defaultValue);
		}
		
		String urlValue=url.toString().trim();
		if(StrKit.notBlank(MainConfig.BASE_UPLOAD_PATH_PRE)){
			if(urlValue.indexOf(MainConfig.BASE_UPLOAD_PATH_PRE)!=-1){
				urlValue=urlValue.replace(MainConfig.BASE_UPLOAD_PATH_PRE, "");
			}
		}
		if(urlValue.charAt(0)=='/'&&urlValue.charAt(1)!='/') {
			urlValue=urlValue.substring(1);
		}
		return urlValue;
	}
	
	
 
}
