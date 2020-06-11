package cn.jbolt._admin.userconfig;

import com.jfinal.aop.Inject;
import com.jfinal.kit.Ret;

import cn.jbolt._admin.permission.UnCheck;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.config.GlobalConfigKey;
import cn.jbolt.common.util.CACHE;
/**
 * 用户自己使用的配置
 * @ClassName:  UserConfigAdminController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年9月25日   
 */
public class UserConfigAdminController extends JBoltBaseController {
	@Inject
	private UserConfigService service;
	@UnCheck
	public void index() {
		set("userConfigs", service.getAdminList(getSessionAdminUserId()));
		render("index.html");
	}
	@UnCheck
	public void toggleBooleanConfig() {
		Integer userId=getSessionAdminUserId();
		Ret ret=service.toggleBooleanConfig(userId,getInt(0));
		if(ret.isOk()) {
			processUserConfigCookie(userId,ret.getAs("data"));
		}
		renderJson(ret);
	}
	/**
	 * 根据
	 * @param configKey
	 */
	private void processUserConfigCookie(Integer userId,String configKey) {
		switch (configKey) {
		case GlobalConfigKey.JBOLT_LOGIN_FORM_STYLE_GLASS:
			boolean glass=CACHE.me.getUserJBoltLoginFormStyleGlass(userId);
			setCookie("jbolt_login_glassStyle",glass+"" ,60*60*24*7*4);
			break;
		case GlobalConfigKey.JBOLT_LOGIN_BGIMG_BLUR:
			boolean blur=CACHE.me.getUserJBoltLoginBgimgBlur(userId);
			setCookie("jbolt_login_bgimgBlur",blur+"" ,60*60*24*7*4);
			break;
		case GlobalConfigKey.JBOLT_LOGIN_NEST:
			boolean nest=CACHE.me.getUserJBoltLoginNest(userId);
			setCookie("jbolt_login_nest",nest+"" ,60*60*24*7*4);
			break;
		}
	}
	/**
	 * 更新Value
	 */
	@UnCheck
	public void changeStringValue(){
		renderJson(service.changeStringValue(getSessionAdminUserId(),getInt("id"),get("value")));
	}
}
