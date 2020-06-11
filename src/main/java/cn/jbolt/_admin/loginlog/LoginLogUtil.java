package cn.jbolt._admin.loginlog;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import cn.hutool.http.useragent.Browser;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import cn.jbolt.common.model.LoginLog;
import cn.jbolt.common.util.IpUtil;
/**
 * 登录日志工具类
 * @ClassName:  LoginLogUtil   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年5月12日   
 */
public class LoginLogUtil {
	/**
	 * 创建登录日志
	 * @return
	 */
	public static LoginLog createLoginLog(HttpServletRequest request) {
		LoginLog log=new LoginLog();
		Date now=new Date();
		log.setLoginTime(now);
		//获取IP地址
		String ip=IpUtil.getIp(request);
		log.setLoginIp(ip);
		log.setCreateTime(now);
		if("unknown".equals(ip) || "127.0.0.1".equals(ip)) {
			log.setLoginAddress("XXXX");
		}else {
			//通过百度地图API 拿到地址
			processLoginAddressByBaiduMapApi(log);
		}
		//处理登录日志中关于系统 平台 浏览器等信息的记录
		processLoginOsBrowserInfo(request,log);
		return log;
	}
	
	/**
	 * 处理登录日志中关于系统 平台 浏览器等信息的记录
	 * @param log
	 */
	private static void processLoginOsBrowserInfo(HttpServletRequest request,LoginLog log) {
		UserAgent userAgent=UserAgentUtil.parse(request.getHeader("User-Agent"));
		if(userAgent!=null) {
			log.setIsMobile(userAgent.isMobile());
			String osName=userAgent.getOs().getName();
			log.setOsName(osName);
			log.setOsPlatformName(userAgent.getPlatform().getName());
			Browser browser=userAgent.getBrowser();
			log.setIsBrowser(browser!=null);
			if(browser!=null) {
				log.setBrowserName(browser.getName());
				log.setBrowserVersion(userAgent.getVersion());
				log.setBrowserEngineName(userAgent.getEngine().getName());
				log.setBrowserEngineVersion(userAgent.getEngineVersion());
			}
		}
	}
	
	/**
	 * 通过百度地图API 拿到地址
	 * @param log
	 */
	private static void processLoginAddressByBaiduMapApi(LoginLog log) {
		//通过百度API 拿到address信息
		JSONObject addressJsonObject=IpUtil.toAddressByBaiduMapApi(log.getLoginIp());
		if(addressJsonObject == null) {
			log.setLoginAddress("XXXX");
		}else {
			log.setLoginAddress(addressJsonObject.getString("address"));
			JSONObject addressDetail=addressJsonObject.getJSONObject("address_detail");
			if(addressDetail != null) {
				log.setLoginProvince(addressDetail.getString("province"));
				log.setLoginCity(addressDetail.getString("city"));
				log.setLoginCityCode(addressDetail.getString("city_code"));
				JSONObject point=addressDetail.getJSONObject("point");
				if(point != null) {
					log.setLoginAddressLatitude(point.getString("x"));
					log.setLoginAddressLongitude(point.getString("y"));
				}
			}
		}
	}
}
