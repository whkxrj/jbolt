package cn.jbolt._admin.interceptor;

import java.lang.reflect.Method;
import java.util.Set;

import com.jfinal.core.Controller;
import com.jfinal.kit.StrKit;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.UnCheck;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.common.model.Permission;
import cn.jbolt.common.util.ArrayUtil;
import cn.jbolt.common.util.CACHE;

/**
 * 权限检查
 * 
 * @author 小木
 * 
 */
public class JBoltSecurityCheck {
    /**
     * 判断有无注解
     * @param method
     * @return
     */
    public static boolean isNoAnnotation(Method method){
        return ArrayUtil.isEmpty(method.getAnnotations());
    }
    /**
     * 判断是不是Uncheck
     * @param method
     * @return
     */
    public static boolean isUncheck(Method method){
    	return method.isAnnotationPresent(UnCheck.class);
    }
    /**
           * 判断整个Controller是不是Uncheck
     * @param method
     * @return
     */
    public static boolean isUncheck(Controller controller){
        return controller.getClass().isAnnotationPresent(UnCheck.class);
    }
    /**
          * 判断Method是否需要check校验权限
     * @param method
     * @return
     */
    public static boolean isPermissionCheck(Method method){
    	return method.isAnnotationPresent(CheckPermission.class);
    }
    /**
     * 判断整个controller是否需要校验权限
     * @param controller
     * @return
     */
    public static boolean isPermissionCheck(Controller controller){
        return controller.getClass().isAnnotationPresent(CheckPermission.class);
    }
    /**
     * 判断controller或者method上是否设置了超管忽略
     * @param controller
     * @param method
     * @return
     */
	public static boolean isUncheckIfSystemAdmin(Controller controller, Method method) {
		return controller.getClass().isAnnotationPresent(UnCheckIfSystemAdmin.class)||method.isAnnotationPresent(UnCheckIfSystemAdmin.class);
	}
	
	/**
	 * 检测keys是否在用户携带权限里存在
	 * @param checkAll
	 * @param roleIds
	 * @param keys
	 * @return
	 */
	public static boolean checkHasPermission(boolean checkAll,String roleIds,String... permissionKeys) {
		if(StrKit.isBlank(roleIds)||permissionKeys==null||permissionKeys.length==0) {return false;}
		return checkHasPermission(checkAll,CACHE.me.getRolePermissionKeySet(roleIds), permissionKeys);
	}
	/**
	 * 检测keys是否在用户携带权限里存在
	 * @param checkAll
	 * @param permissionKeyset
	 * @param keys
	 * @return
	 */
	public static boolean checkHasPermission(boolean checkAll,Set<String> permissionKeyset,String... permissionKeys) {
		if(permissionKeyset==null||permissionKeyset.isEmpty()||permissionKeys==null||permissionKeys.length==0) {return false;}
		if(checkAll) {
			//检测所有 就是只要有一个不行就都不行
			for (String permissionKey : permissionKeys) {
				if (permissionKeyset.contains(permissionKey)==false) {
					return false;
				}
			}
			return true;
		}
		
		//只要有一个存在就可以
		for (String permissionKey : permissionKeys) {
			if (permissionKeyset.contains(permissionKey)) {
				return true;
			}
		}
		
		return false;
	}
	
	/**
	 * 检测是否是超管默认权限
	 * @param checkAll 
	 * @param permissionKeys
	 * @return
	 */
	public static boolean checkIsSystemAdminDefaultPermission(boolean checkAll,String... permissionKeys) {
		if(ArrayUtil.isEmpty(permissionKeys)) {return false;}
		
		int count=permissionKeys.length;
		if(count==1) {
			//当只传了一个 就判断这个是不是超管默认 是就返回true
			Permission permission=CACHE.me.getPermissionByKey(permissionKeys[0]);
			return (permission!=null&&permission.getIsSystemAdminDefault());
		}
		//多个的时候就得判断checkAll
		Permission permission;
		if(checkAll) {
			for(String permissionKey:permissionKeys) {
				permission=CACHE.me.getPermissionByKey(permissionKey);
				//检测all 但是只要有一个不是的 就返回false
				if(permission==null||permission.getIsSystemAdminDefault()==false) {
					return false;
				}
			}
			return true;
		}
		
		//检测只要一个符合条件就是true
		for(String permissionKey:permissionKeys) {
			permission=CACHE.me.getPermissionByKey(permissionKey);
			if(permission!=null&&permission.getIsSystemAdminDefault()) {
				return true;
			}
		}
		
		return false;
	}
   
    

}
