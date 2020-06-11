package cn.jbolt.common.poi.excel;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.kit.Kv;
import com.jfinal.plugin.activerecord.CPI;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
/**
 * JBolt Excel 数据
 * @ClassName:  JBoltExcelData   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月10日   
 */
@SuppressWarnings("serial")
public class JBoltExcelData extends HashMap<String, Object>{
	public JBoltExcelData(Map<String, Object> datas) {
		this.putAll(datas);
	}
	public static JBoltExcelData fromModel(Model<?> model) {
		return new JBoltExcelData(CPI.getAttrs(model));
	}
	public static JBoltExcelData fromRecord(Record record) {
		return new JBoltExcelData(record.getColumns());
	}
	public <T> T getAs(Object key) {
		return (T)get(key);
	}
	
	public String getStr(Object key) {
		Object s = get(key);
		return s != null ? s.toString() : null;
	}
	
	public Integer getInt(Object key) {
		Number n = (Number)get(key);
		return n != null ? n.intValue() : null;
	}
	
	public Long getLong(Object key) {
		Number n = (Number)get(key);
		return n != null ? n.longValue() : null;
	}
	
	public Number getNumber(Object key) {
		return (Number)get(key);
	}
	
	public Boolean getBoolean(Object key) {
		return (Boolean)get(key);
	}
	
	/**
	 * key 存在，并且 value 不为 null
	 */
	public boolean notNull(Object key) {
		return get(key) != null;
	}
	
	/**
	 * key 不存在，或者 key 存在但 value 为null
	 */
	public boolean isNull(Object key) {
		return get(key) == null;
	}
	
	/**
	 * key 存在，并且 value 为 true，则返回 true
	 */
	public boolean isTrue(Object key) {
		Object value = get(key);
		return (value instanceof Boolean && ((Boolean)value == true));
	}
	
	/**
	 * key 存在，并且 value 为 false，则返回 true
	 */
	public boolean isFalse(Object key) {
		Object value = get(key);
		return (value instanceof Boolean && ((Boolean)value == false));
	}
	/**
	 * 改变数据
	 * @param key
	 * @param value
	 */
	public void change(String key, Object value) {
		put(key, value);
	}
	/**
	 * 替换boolean数据 转为其他字符串
	 * @param key
	 * @param trueStr
	 * @param falseStr
	 */
	public void changeBooleanToStr(String key, String trueStr, String falseStr) {
		if(isNull(key)) {
			change(key, falseStr);
		}else {
			if(isTrue(key)) {
				change(key, trueStr);
			}else if(isFalse(key)) {
				change(key, falseStr);
			}
		}
	}
	/**
	 * 转换string to bool
	 * @param string
	 * @param kv
	 */
	public void changeStrToBoolean(String key, Kv kv) {
		String value=getStr(key);
		change(key, value==null?false:kv.getBoolean(value));
	}
	/**
	 * 转换string to bool
	 * @param string
	 * @param trueStr
	 */
	public void changeStrToBoolean(String key, String trueStr) {
		String value=getStr(key);
		change(key, value==null?false:(trueStr.equalsIgnoreCase(value)));
	}
	/**
	 * 连带KEY一并change
	 * @param oldKey
	 * @param newKey
	 * @param newValue
	 */
	public void changeWithKey(String oldKey, String newKey, Object newValue) {
		remove(oldKey);
		put(newKey, newValue);
	}
	

}
