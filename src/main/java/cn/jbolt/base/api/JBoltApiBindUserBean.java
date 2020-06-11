package cn.jbolt.base.api;
/**
 * APiUser绑定的其他表用户信息
 * @ClassName:  JBoltApiBindUserBean   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年4月1日   
 */
public class JBoltApiBindUserBean {
	public static final int TYPE_SYSTEM_USER=1;//jb_user 系统用户表
	private Object userId;//userId
	private int type;//绑定类型
	public JBoltApiBindUserBean(int type,Object userId) {
		this.userId=userId;
		this.type=type;
	}
	public Object getUserId() {
		return userId;
	}
	public void setUserId(Object userId) {
		this.userId = userId;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	} 
}
