package cn.jbolt.base.api;

import java.util.List;
/**
 * ApiUser实现 javaBean
 * @ClassName:  ApiUserBean   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月17日   
 */
public class JBoltApiUserBean implements JBoltApiUser {
	private Object userId;//具体调用API的客户端用户表ID
	private String userName;//客户端用户表username
	private Object appId;//application的id字段
	private String sessionKey;//小程序里sessionKey
	private List<JBoltApiBindUserBean> bindUsers;//关联其他用户表
	public JBoltApiUserBean() {}
	public JBoltApiUserBean(Object appId,Object userId,String userName) {
		this.appId=appId;
		this.userId=userId;
		this.userName=userName;
	}
	public JBoltApiUserBean(Object appId,Object userId,String userName,String sessionKey) {
		this.appId=appId;
		this.userId=userId;
		this.userName=userName;
		this.sessionKey=sessionKey;
	}

	/*
	 * public JBoltApiUserBean(Claims claims) { this.appId=claims.get("appId",
	 * Object.class); this.userId=claims.get("userId", Object.class);
	 * this.userName=claims.get("userName",String.class);
	 * this.sessionKey=claims.get("sessionKey",String.class); }
	 */	
	public JBoltApiUserBean setUserId(Object userId) {
		this.userId = userId;
		return this;
	}

	public JBoltApiUserBean setUserName(String userName) {
		this.userName = userName;
		return this;
	}

	@Override
	public Object getUserId() {
		return userId;
	}

	@Override
	public String getUserName() {
		return userName;
	}
	public Object getAppId() {
		return appId;
	}
	public JBoltApiUserBean setAppId(Object appId) {
		this.appId = appId;
		return this;
	}
	public String getSessionKey() {
		return sessionKey;
	}
	public JBoltApiUserBean setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
		return this;
	}
	public List<JBoltApiBindUserBean> getBindUsers() {
		return bindUsers;
	}
	public JBoltApiUserBean setBindUsers(List<JBoltApiBindUserBean> bindUsers) {
		this.bindUsers = bindUsers;
		return this;
	}
}
