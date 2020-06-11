package cn.jbolt.common.gen;
/**
 * 生成Method
 * @ClassName:  GenMethod   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月13日   
 */
public class JBoltGenMethod {
	private String name;//名字
	private JBoltFieldBean jboltField;//
	public JBoltGenMethod(String name) {
		this.name=name;
	}
	public JBoltGenMethod(String name,JBoltField jboltField) {
		this.name=name;
		this.jboltField=new JBoltFieldBean(jboltField);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public JBoltFieldBean getJboltField() {
		return jboltField;
	}
	public void setjBoltField(JBoltFieldBean jboltField) {
		this.jboltField = jboltField;
	}
}
