package cn.jbolt.base.api;

import java.util.List;

import cn.jbolt.common.model.Application;
import cn.jbolt.common.model.User;
import cn.jbolt.common.util.CACHE;
/**
 * JBolt平台API使用的工具类 只要处理用户和jwt相关threadLocal
 * @ClassName:  JBoltApiKit   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年4月1日   
 */
public class JBoltApiKit {
	/**
	  * 针对JwtParseResut的ThreadLocal
	 */
    private static final ThreadLocal<JBoltJwtParseRet> jwtTL = new ThreadLocal<JBoltJwtParseRet>();
   
    public static void setJwtParseRet(JBoltJwtParseRet jwtParseRet) {
        jwtTL.set(jwtParseRet);
    }

    public static void removeJwtParseRet() {
        jwtTL.remove();
    }

    public static JBoltJwtParseRet getJwtParseRet() {
        return jwtTL.get();
    }
    
    /**
     * 针对Application的ThreadLocal
     */
    private static final ThreadLocal<Application> applicationTL = new ThreadLocal<Application>();
    
    public static void setApplication(Application application) {
    	applicationTL.set(application);
    }

    public static void removeApplication() {
    	applicationTL.remove();
    }

    public static Application getApplication() {
    	return applicationTL.get();
    }
    public static String getAppId() {
    	Application application=getApplication(); 
    	return application==null?null:application.getAppId();
    }
    
    
    /**
	 * 获得当前访问的userId
	 * @return
	 */
	public static Object getApiUserId() {
		JBoltJwtParseRet jwtParseRet=getJwtParseRet();
		return jwtParseRet==null?null:jwtParseRet.getUserId();
	}
	/**
	 * 获得当前访问的apiUser绑定的其它用户表
	 * @return
	 */
	public static List<JBoltApiBindUserBean> getBindUsers() {
		JBoltApiUser apiUser=getApiUser();
		return apiUser==null?null:apiUser.getBindUsers();
	}
	/**
	 * 获得当前访问的ApiUser
	 * @return
	 */
	public static JBoltApiUser getApiUser() {
		JBoltJwtParseRet jwtParseRet=getJwtParseRet();
		return jwtParseRet==null?null:jwtParseRet.getApiUser();
	}
	/**
	 * 得到绑定系统jb_user表的用户id
	 * @return
	 */
	public static Object getBindSystemUserId() {
		List<JBoltApiBindUserBean> bindUserBeans=getBindUsers();
		if(bindUserBeans==null||bindUserBeans.size()==0) {return null;}
		Object userId=null;
		for(JBoltApiBindUserBean bean:bindUserBeans) {
			if(bean.getType()==JBoltApiBindUserBean.TYPE_SYSTEM_USER) {
				userId=bean.getUserId();
				break;
			}
		}
		return userId;
	}
	/**
	 * 得到绑定的系统用户表 只有在调用接口的应用绑定的小程序等用户 绑定了系统表用户时才有效
	 * @return
	 */
	public static User getBindSystemUser() {
		Object userId=getBindSystemUserId();
		if(userId==null) {return null;}
		return CACHE.me.getUser(userId);
	}
	
	/**
	 * 清空threadLocal
	 */
	public static void clear() {
		removeJwtParseRet();
		removeApplication();
		removeApplyJwtUser();
	}

	  /**
	   	* 针对申请jwt的ApiUser的ThreadLocal
     */
    private static final ThreadLocal<JBoltApiUser> applyJwtUserTL = new ThreadLocal<JBoltApiUser>();
    
    public static void setApplyJwtUser(JBoltApiUser jBoltApiUser) {
    	applyJwtUserTL.set(jBoltApiUser);
    }

    public static void removeApplyJwtUser() {
    	applyJwtUserTL.remove();
    }

    public static JBoltApiUser getApplyJwtUser() {
    	return applyJwtUserTL.get();
    }

}
