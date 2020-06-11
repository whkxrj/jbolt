package cn.jbolt.base.api;

import java.util.List;

/**
 * Api中的User
 * @ClassName:  ApiUser   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年9月12日   
 */
public interface JBoltApiUser {
	public Object getUserId();//用户ID
	public String getUserName();//名
	public Object getAppId();//应用 application的id
	public String getSessionKey();// 小程序SessionKey
	public List<JBoltApiBindUserBean> getBindUsers();//关联其它用户表
}
