package cn.jbolt.base.para;

import com.jfinal.core.Action;
import com.jfinal.core.Controller;
import com.jfinal.core.paragetter.ParaGetter;

import cn.jbolt.base.JBoltControllerKit;
/**
 * JBolt平台 参数获取器
 * JBolt官网 http://jbolt.cn
 * @ClassName:  JBoltParamGetter   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月18日   
 */
public class JBoltParaGetter extends ParaGetter<JBoltPara> {

	public JBoltParaGetter(String parameterName, String defaultValue) {
		super(parameterName, defaultValue);
	}
	
	@Override
	public JBoltPara get(Action action, Controller c) {
		return JBoltControllerKit.getJBoltPara(action, c);
	}


	@Override
	protected JBoltPara to(String v) {
		return new JBoltPara(v);
	}

}
