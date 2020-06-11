package cn.jbolt.common.map;
/**
 * 百度地图API 工具类
 * @ClassName:  BaiduMapApi   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年5月10日   
 */

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.kit.HashKit;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.LogKit;
import com.jfinal.kit.Okv;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;

/**
 * 百度地图API
 * 
 * @ClassName: BaiduMapApi
 * @author: 山东小木 - http://jbolt.cn
 * @date: 2020年5月10日
 */
public class BaiduMapApi {
	private final static String IP_TO_ADDRESS_URL = "http://api.map.baidu.com/location/ip";

	/**
	 * ip转address
	 * 
	 * @param ip
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static JSONObject ipToAddress(String ip) throws UnsupportedEncodingException {
		// 按照顺序处理参数
		Okv paras = Okv.by("ak", PropKit.get("baidu_map_ak")).set("ip", ip).set("coor", "bd09ll").set("sn", genSn(ip));

		// 调用接口
		String result = HttpKit.get(IP_TO_ADDRESS_URL, paras);
		if (StrKit.isBlank(result)) {
			return null;
		}

		// 转JSON
		JSONObject jsonObject = JSONObject.parseObject(result);
		if (jsonObject == null || jsonObject.containsKey("status") == false) {
			return null;
		}

		// 得到结果状态
		int status = jsonObject.getIntValue("status");
		if (status != 0) {

			if (jsonObject.containsKey("message")) {
				LogKit.error(jsonObject.getString("message"));
			} else {
				LogKit.error("调用ipToAddress 失败,IP={}", ip);
			}

			return null;
		}

		return jsonObject.getJSONObject("content");
	}

	/**
	 * 生成sn
	 * 
	 * @param ip
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	private static String genSn(String ip) throws UnsupportedEncodingException {
		Map<String, String> paramsMap = new LinkedHashMap<String, String>();
		paramsMap.put("ak", PropKit.get("baidu_map_ak"));
		paramsMap.put("ip", ip);
		paramsMap.put("coor", "bd09ll");
		String paramsStr = toQueryString(paramsMap);
		String wholeStr = new String("/location/ip?" + paramsStr + PropKit.get("baidu_map_sk"));
		String tempStr = URLEncoder.encode(wholeStr, "UTF-8");
		return HashKit.md5(tempStr);
	}

	/**
	  * 对Map内所有value作utf8编码，拼接返回结果
	 * @param data
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	private static String toQueryString(Map<?, ?> data) throws UnsupportedEncodingException {
		StringBuffer queryString = new StringBuffer();
		for (Entry<?, ?> pair : data.entrySet()) {
			queryString.append(pair.getKey() + "=");
			queryString.append(URLEncoder.encode((String) pair.getValue(), "UTF-8") + "&");
		}
		if (queryString.length() > 0) {
			queryString.deleteCharAt(queryString.length() - 1);
		}
		return queryString.toString();
	}
	
	
	public static void main(String[] args) {
		PropKit.use("config.properties");
		try {
			JSONObject resJsonObject = ipToAddress("27.202.44.97");
			System.out.println(resJsonObject.toJSONString());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

	}

}
