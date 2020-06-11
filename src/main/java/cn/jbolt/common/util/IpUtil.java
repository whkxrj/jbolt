package cn.jbolt.common.util;
 
import java.io.UnsupportedEncodingException;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import cn.jbolt.common.map.BaiduMapApi;
 
/**
 * IP工具类
 */
public class IpUtil {

	/**
	 * 获取登录用户的IP地址
	 * 
	 * @param request
	 * @return
	 */
	public static String getIp(HttpServletRequest request) {
		if (request == null){return "unknown";}
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("X-Forwarded-For");
	    }
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("X-Real-IP");
	    }
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if (ip.equals("0:0:0:0:0:0:0:1")) {
			ip = "127.0.0.1";
		}
		if (ip.split(",").length > 1) {
			ip = ip.split(",")[0];
		}
		return ip;
	}
	/**
	 * 通过IP获取位置
	 * @param ip
	 * @return
	 */
	public static JSONObject toAddressByBaiduMapApi(String ip) {
		JSONObject object=null;
		try {
			object = BaiduMapApi.ipToAddress(ip);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return object;
	}
	/**
	 * 获取服务器主机外网IP
	 * @return
	 */
	public static String getServerIp() {
		try {
			Enumeration<NetworkInterface> networks = NetworkInterface.getNetworkInterfaces();
			Enumeration<InetAddress> addrs;
			InetAddress ip;
			while (networks.hasMoreElements()) {
				addrs = networks.nextElement().getInetAddresses();
				while (addrs.hasMoreElements()) {
					ip = addrs.nextElement();
					if (ip instanceof Inet4Address && !ip.isSiteLocalAddress() && !ip.isLoopbackAddress()) {
						// 从网卡获取外网IP
						return ip.getHostAddress();
					}
				}
			}
		} catch (SocketException e) {
			e.printStackTrace();
			return "127.0.0.1";
		}

		try {
			// 外网IP不存在，那么获取内网IP
			return InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
			return "127.0.0.1";
		}
	}

}