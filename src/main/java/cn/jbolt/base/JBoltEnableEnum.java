package cn.jbolt.base;
/**
 * 启用 未启用 状态枚举
 * @ClassName:  EnableEnum   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月17日   
 */
public enum JBoltEnableEnum {
	TRUE("已启用",true),
	FALSE("未启用",false);
	private String text;
	private Boolean value;
	private JBoltEnableEnum(String text,Boolean value) {
		this.text=text;
		this.value=value;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Boolean getValue() {
		return value;
	}
	public void setValue(Boolean value) {
		this.value = value;
	}
	//加入到JBolt Enum管理器
	static {
		JBoltEnum.addToTvBeanMap(JBoltEnableEnum.class);
	}
	
}
