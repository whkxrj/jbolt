package cn.jbolt.index;

import com.jfinal.config.Routes;

import cn.jbolt.wxa.api.JBoltWxaApiController;
/**
 * 微信公众平台前端配置
 * @ClassName:  WechatRoutes   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年5月8日15:03:24   
 */
public class WechatApiRoutes extends Routes {

	@Override
	public void config() {
		this.setMappingSuperClass(true);
		this.add("/api/wxa", JBoltWxaApiController.class);
	}

}
