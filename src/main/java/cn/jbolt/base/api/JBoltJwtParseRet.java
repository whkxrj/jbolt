package cn.jbolt.base.api;

/**
 * JWT Parse result
 * @ClassName:  JwtParseRet   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年9月13日   
 */
public class JBoltJwtParseRet {
	private JBoltApiUser apiUser;
	private boolean expired;
	private boolean signCheckFailed;
	private JBoltApiRet apiRet;
	
	
	public boolean isSignCheckFailed() {
		return signCheckFailed;
	}

	public JBoltJwtParseRet setSignCheckFailed(boolean signCheckFailed) {
		this.signCheckFailed = signCheckFailed;
		return this;
	}

	public boolean isExpired() {
		return expired;
	}

	public JBoltJwtParseRet setExpired(boolean expired) {
		this.expired = expired;
		return this;
	}
	public Object getUserId() {
		if(isOk()) {
			return apiUser.getUserId();
		}
		return null;
	}
	public String getUserSessionKey() {
		if(isOk()) {
			return apiUser.getSessionKey();
		}
		return null;
	}
	public boolean isOk() {
		return apiUser!=null&&apiRet==null&&signCheckFailed==false;
	}
	 
 

	public JBoltApiUser getApiUser() {
		return apiUser;
	}
	public JBoltJwtParseRet setApiUser(JBoltApiUser apiUser) {
		this.apiUser = apiUser;
		return this;
	}

	public JBoltApiRet getApiRet() {
		return apiRet;
	}

	public JBoltJwtParseRet setApiRet(JBoltApiRet apiRet) {
		this.apiRet = apiRet;
		return this;
	}
}
