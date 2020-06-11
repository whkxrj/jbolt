/**
 * Copyright (c) 2011-2021, James Zhan 詹波 (jfinal@126.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package cn.jbolt.base;

import java.io.IOException;

import com.jfinal.core.JFinal;
import com.jfinal.render.Render;
import com.jfinal.render.RenderException;

/**
 * JBoltRedirectRender with status: 302 Found.
 */
public class JBoltRedirectRender extends Render {
	protected String url;
	protected boolean withQueryString;
	protected static final String contextPath = getContxtPath();
	
	static String getContxtPath() {
		String cp = JFinal.me().getContextPath();
		return ("".equals(cp) || "/".equals(cp)) ? null : cp;
	}
	
	public JBoltRedirectRender(String url) {
		this.url = url;
		this.withQueryString = false;
	}
	
	public JBoltRedirectRender(String url, boolean withQueryString) {
		this.url = url;
		this.withQueryString =  withQueryString;
	}
	
	public String buildFinalUrl() {
		String ret;
		// 如果一个url为/login/connect?goto=http://www.jfinal.com，则有错误
		// ^((https|http|ftp|rtsp|mms)?://)$   ==> indexOf 取值为 (3, 5)
		if (contextPath != null && (url.indexOf("://") == -1 || url.indexOf("://") > 5)) {
			ret = contextPath + url;
		} else {
			ret = url;
		}
		
		if (withQueryString) {
			String queryString = request.getQueryString();
			if (queryString != null) {
				if (ret.indexOf('?') == -1) {
					ret = ret + "?" + queryString;
				} else {
					ret = ret + "&" + queryString;
				}
			}
		}
		
		// 跳过 http/https 已指定过协议类型的 url，用于支持跨域名重定向
		if (ret.toLowerCase().startsWith("http")) {
			return ret;
		}
		
		if ("https".equalsIgnoreCase(request.getHeader("X-Forwarded-Proto"))) {
			String serverName = request.getServerName();
			
			Integer port = getPort();
			if (port != null) {
				serverName = serverName + ":" + port;
			}
			
			if (ret.charAt(0) != '/') {
				return "https://" + serverName + "/" + ret;
			} else {
				return "https://" + serverName + ret;
			}
		
		} else {
			return ret;
		}
	}
	
	private Integer getPort() {
		try {
			Integer port = Integer.parseInt(request.getHeader("X-Forwarded-Port"));
			return port != null && port != 0 ? port : null;
		} catch (Exception e) {
			return null;
		}
	}
	
	public void render() {
		String finalUrl = buildFinalUrl();
		
		try {
			response.sendRedirect(finalUrl);	// always 302
		} catch (IOException e) {
			throw new RenderException(e);
		}
	}
}

