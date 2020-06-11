package cn.jbolt.common.gen;

public class JBoltFieldBean {
	private String name;
	private String columnName;
	private String type;
	private String remark;
	public JBoltFieldBean(JBoltField jBoltField) {
		this(jBoltField.name(), jBoltField.columnName(), jBoltField.type(), jBoltField.remark());
	}
	public JBoltFieldBean(String name,String columnName,String type,String remark) {
		this.name=name;
		this.columnName=columnName;
		this.type=type;
		this.remark=remark;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
