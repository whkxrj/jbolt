package cn.jbolt._admin.interceptor;

import java.lang.reflect.Method;
import java.util.Set;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.base.JBoltControllerKit;
import cn.jbolt.common.util.ArrayUtil;
import cn.jbolt.common.util.CACHE;


/**
 * JBolt管理后台权限校验拦截器
 * @ClassName:  AdminAuthInterceptor   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年9月12日   
 */
public class JBoltAdminAuthInterceptor implements Interceptor {
	@Override
	public void intercept(Invocation inv) {
		Controller ctl =inv.getController();
		if (!(ctl instanceof JBoltBaseController)) {
			throw new RuntimeException("控制器需要继承 BaseController");
		}
		JBoltBaseController controller=(JBoltBaseController) ctl;
		boolean isAdminLogin = controller.isAdminLogin();//是否登录
		boolean isSystemAdmin = controller.isSystemAdmin();//是否是超管
		if (!isAdminLogin&&!isSystemAdmin) {
			JBoltControllerKit.renderAdminInterceptorNotLoginInfo(controller);
			return;
		}
		//判断锁屏
		if(controller.systemIsLocked()) {
			if(inv.getActionKey().equals("/admin/unLockSystem")) {
				inv.invoke();
				return;
			}else {
				//直接访问action
				if(JBoltControllerKit.isNormal(controller)) {
					JBoltControllerKit.renderSystemLockedPage(controller);
				}else {
					//ajax pjax ajaxPortal等访问
					JBoltControllerKit.renderAdminSystemLockedInfo(controller);
				}
				return;
			}
		}
		//uncheck是只校验上面的登录 不校验其它 如果controller上直接写了uncheck注解 只要登录了就直接过
		if(JBoltSecurityCheck.isUncheck(controller)){
			inv.invoke();
			return;
		}
		Method method=inv.getMethod();
		//uncheck是只校验上面的登录 不校验其它
		if(JBoltSecurityCheck.isUncheck(method)){
			inv.invoke();
			return;
		}
		//具体有哪些注解
		String[] permissionKeys=null;
		//如果是超管，判断是不是超管默认的，是的话就直接过
		if(isSystemAdmin) {
			//如果设置了是超级管理员可以直接访问的权限注解 不校验其它
			if(JBoltSecurityCheck.isUncheckIfSystemAdmin(controller,method)) {
				inv.invoke();
				return;
			}
			// 得到具体的可以校验的注解
			permissionKeys = getPermissionKeys(controller, method);
			if(ArrayUtil.isEmpty(permissionKeys)){
				// 如果没有权限 返回错误信息
				JBoltControllerKit.renderInterceptorErrorInfo(controller,"当前访问资源尚未设置可校验权限，无法访问");
				return;
			}
			//如果没设置 就得拿到当前访问的actionkey去找到对应权限定义 在判断是不是超管可以直接访问
			boolean isSystemAdminDefault=JBoltSecurityCheck.checkIsSystemAdminDefaultPermission(false,permissionKeys);
			if(isSystemAdminDefault) {
				inv.invoke();
				return;
			}
		}else {
			// 得到具体的可以校验的注解
			permissionKeys = getPermissionKeys(controller, method);
		}
		//上面都没满足 那么就乖乖按照规矩来 分配了角色权限才能过
		if(ArrayUtil.isEmpty(permissionKeys)){
			// 如果没有权限 返回错误信息
			JBoltControllerKit.renderInterceptorErrorInfo(controller,"当前访问资源尚未设置可校验权限，无法访问");
			return;
		}
		//拿到登录用户所分配的角色
		String roleIds = controller.getSessionAdminRoleIds();
		//从cache中找到这些角色对应的权限绑定集合
		Set<String> permissionKeySet = CACHE.me.getRolePermissionKeySet(roleIds);
		if (permissionKeySet == null || permissionKeySet.isEmpty()) {
			// 如果没有权限 返回错误信息
			JBoltControllerKit.renderInterceptorErrorInfo(controller,"当前用户所属角色下尚未分配任何权限");
			return;
		}
		
		//检测拦截到正在访问的controller+action上需要校验的权限资源 拿到后去跟缓存里当前用户所在的角色下的所有资源区对比
		boolean exist = JBoltSecurityCheck.checkHasPermission(false,permissionKeySet, permissionKeys);
		if (!exist) {
			// 如果没有权限 返回错误信息
			JBoltControllerKit.renderInterceptorErrorInfo(controller,"无权访问");
			return;
		}
		// 最后执行action
		inv.invoke();

	}

	


	/**
	 * 得到需要校验的permissionKey
	 * @param controller
	 * @param method
	 * @return
	 */
	private String[] getPermissionKeys(JBoltBaseController controller, Method method) {
		boolean mc=JBoltSecurityCheck.isPermissionCheck(method);
		boolean cc=JBoltSecurityCheck.isPermissionCheck(controller);
		if(!mc&&!cc){
			return null;
		}
		String[] temps=null;
		if(mc){
			CheckPermission per = method.getAnnotation(CheckPermission.class);
			String[] values = per.value();
			if (values == null || values.length == 0) {
				return null;
			}
			temps=values;
		}
		if(cc&&temps==null){
			CheckPermission per = controller.getClass().getAnnotation(CheckPermission.class);
			String[] values = per.value();
			if (values == null || values.length == 0) {
				return null;
			}
			temps=values;
		}
		
		return temps;
	}
}
