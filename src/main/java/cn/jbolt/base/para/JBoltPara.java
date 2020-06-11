package cn.jbolt.base.para;
import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.jfinal.kit.Kv;
import com.jfinal.kit.StrKit;
/**
 * JBolt平台封装的参数包装器
 * @ClassName:  JBoltParam   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月18日   
 */
@SuppressWarnings("serial")
public class JBoltPara extends Kv{
	private String rawData;
	public JBoltPara(String value) {
		if(StrKit.notBlank(value)) {
			this.rawData=value;
			super.set(JSON.parseObject(value, HashMap.class));
		}
	}
	
	public JBoltPara(Map<String, String[]> paraMap) {
		if(paraMap!=null && paraMap.isEmpty()==false) {
			for (Entry<String, String[]> entry : paraMap.entrySet()) {
				String[] values = entry.getValue();
				String value = (values != null && values.length > 0) ? values[0] : null;
				set(entry.getKey(), "".equals(value) ? null : value);
			}
		}
	}
	public JBoltPara(Kv kv) {
		if(kv != null && kv.isEmpty() == false) {
			super.set(kv);
		}
	}
	/**
	 * 得到原始rawdata
	 * @return
	 */
	public String getRawData() {
		if(StrKit.isBlank(rawData)&&isEmpty()==false) {
			this.rawData=toJson();
		}
		return this.rawData;
	}
}
