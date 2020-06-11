package cn.jbolt.common.db.sql;

import java.io.Serializable;
/**
 * Sql处理表达式
 * @ClassName:  SqlExpress   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年9月5日   
 */
@SuppressWarnings("serial")
public class SqlExpress implements Serializable,Cloneable{
	private Serializable value;
	public SqlExpress(Serializable value){
		this.value=value;
	}
	public Serializable getValue() {
		return value;
	}
	public void setValue(Serializable value) {
		this.value = value;
	}
	public String toString(){
		return value.toString();
	}
}
