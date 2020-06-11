package cn.jbolt.base;

import cn.jbolt.common.bean.Option;
/**
 * JBoltEnumBean 将enum数据转为javaBean
 * @ClassName:  JBoltEnumBean   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月17日   
 */
public class JBoltEnumBean implements Option{
	private String text;
	private Object value;
	public JBoltEnumBean(String text,Object value) {
		this.text=text;
		this.value=value;
	}
	@Override
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Override
	public Object getValue() {
		return value;
	}
	public <T> T getValueAs() {
		return (T) value;
	}
	public void setValue(Object value) {
		this.value = value;
	}
	
}