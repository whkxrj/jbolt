package cn.jbolt.index;

import javax.servlet.http.HttpSession;

import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.aop.Inject;

import cn.jbolt._admin.globalconfig.GlobalConfigService;
import cn.jbolt._admin.loginlog.LoginLogUtil;
import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.UnCheck;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt._admin.updatemgr.DownloadLogService;
import cn.jbolt._admin.user.UserService;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.base.JBoltBaseHandler;
import cn.jbolt.base.JBoltControllerKit;
import cn.jbolt.base.JBoltLoginState;
import cn.jbolt.base.para.JBoltNoUrlPara;
import cn.jbolt.common.config.GlobalConfigKey;
import cn.jbolt.common.config.SessionKey;
import cn.jbolt.common.model.LoginLog;
import cn.jbolt.common.model.User;
import cn.jbolt.common.util.CACHE;
/**
 * 系统后台主入口
 * @ClassName:  AdminIndexController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月8日   
 */
public class AdminIndexController extends JBoltBaseController {
	@Inject
	private UserService userService;
	@Inject
	private DownloadLogService downloadLogService;
	@Inject
	private GlobalConfigService globalConfigService;
	@UnCheck
	@Before(JBoltNoUrlPara.class)
	public void index(){
		render("index.html");
	}
	@UnCheck
	public void menu(){
		set("leftMenus", CACHE.me.getRoleMenus(getSessionAdminRoleIds()));
		render("menu.html");
	}
	@UnCheck
	public void lockSystem(){
		JBoltControllerKit.lockSystem(this);
	}
	@UnCheck
	public void unLockSystem(){
		String password=get("password");
		if(notOk(password)) {
			renderJsonFail("请输入登录密码");
		}else {
			boolean success=userService.checkPwd(getSessionAdminUserId(),password);
			if(success) {
				JBoltControllerKit.unLockSystem(this);
			}else {
				renderJsonFail("密码不正确");
			}
		}
		
	}
	
	@CheckPermission("dashboard")
	@UnCheckIfSystemAdmin
	public void dashboard(){
		render("dashboard.html");
	}
	
	@Clear
	public void relogin(){
		render("relogin.html");
	}
	@Clear
	public void logout(){
		HttpSession session=getSession();
		if(session!=null) {
			session.removeAttribute(SessionKey.ADMIN_USER_ID);
			session.removeAttribute(SessionKey.JBOLT_LOCK_SYSTEM);
			session.invalidate();
		}
		redirect(JBoltBaseHandler.processBasepath(getRequest()));
	}
	
	/**
	 * 登录
	 */
	@Clear
	public void login(){
		if(getRequest().getMethod().equalsIgnoreCase("get")) {
			render("login.html");
			return;
		}
		LoginLog log=LoginLogUtil.createLoginLog(getRequest());
		log.setUsername(get("username"));
		
		//根据全局配置判断是否需要验证码 默认需要
		boolean checkCaptcha=CACHE.me.isJBoltLoginUseCapture();
		if(checkCaptcha){
			boolean checkSuccess=validateCaptcha("captcha");
			if(!checkSuccess) {
				log.setLoginState(JBoltLoginState.CAPTURE_ERROR.getValue());
				log.save();
				renderJsonFail(JBoltLoginState.CAPTURE_ERROR.getText());
				return;
			}
		}
		
		User user=userService.getUser(get("username"),get("password"));
		//检测用户名密码是否正确输入并得到user
		if(user==null){
			log.setLoginState(JBoltLoginState.USERNAME_PWD_ERROR.getValue());
			log.save();
			renderJsonFail(JBoltLoginState.USERNAME_PWD_ERROR.getText());
			return;
		}
		
		log.setUserId(user.getId());
		//检测用户是否禁用
		if(user.getEnable()==null||user.getEnable()==false){
			log.setLoginState(JBoltLoginState.ENABLE_ERROR.getValue());
			log.save();
			renderJsonFail(JBoltLoginState.ENABLE_ERROR.getText());
			return;
		}
		
		//检测角色权限分配
		if(notOk(user.getRoles())&&(user.getIsSystemAdmin()==null||user.getIsSystemAdmin()==false)){
			log.setLoginState(JBoltLoginState.NOT_ASSIGN_ROLE_ERROR.getValue());
			log.save();
			renderJsonFail(JBoltLoginState.NOT_ASSIGN_ROLE_ERROR.getText());
			return;
		}
		
		log.setLoginState(JBoltLoginState.LOGIN_SUCCESS.getValue());
		log.save();
		
		//处理用户登录信息 异地登录异常信息
		boolean isRemoteLogin=userService.processUserRemoteLogin(user,log);
		userService.processUserLoginInfo(user,isRemoteLogin,log);
		
		//执行登录成功后的操作
		setSessionAdminUserId(user.getId());
		resetUserConfigCookie(user.getId());
		renderJsonSuccess();
	}
	/**
	 * 登录后重置登录页面用户设置cookie
	 * @param userId
	 */
	private void resetUserConfigCookie(Integer userId) {
		boolean glass=CACHE.me.getUserJBoltLoginFormStyleGlass(userId);
		setCookie("jbolt_login_glassStyle",glass+"",60*60*24*7);
		boolean blur=CACHE.me.getUserJBoltLoginBgimgBlur(userId);
		setCookie("jbolt_login_bgimgBlur",blur+"" ,60*60*24*7);
		boolean nest=CACHE.me.getUserJBoltLoginNest(userId);
		setCookie("jbolt_login_nest",nest+"" ,60*60*24*7);
	}
	
	/**
	 * 验证码
	 */
	@Clear
	public void captcha(){
		renderJBoltCaptcha(CACHE.me.getGlobalConfigValue(GlobalConfigKey.JBOLT_LOGIN_CAPTURE_TYPE));
	}
}
