package cn.jbolt.base;
/**
 * 系统登录状态 枚举
 * @ClassName:  JBoltLoginState   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年5月2日   
 */
public enum JBoltLoginState{
	LOGIN_SUCCESS("登录成功",1),
	CAPTURE_ERROR("验证码输入错误",2),
	USERNAME_PWD_ERROR("用户名或密码输入错误",3),
	ENABLE_ERROR("用户已被禁用",4),
	NOT_ASSIGN_ROLE_ERROR("用户尚未分配任何角色权限",5),
	LOGIN_ERROR("未知异常",6);
	private String text;
	private int value;
	private JBoltLoginState(String text,int value) {
		this.text=text;
		this.value=value;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
}