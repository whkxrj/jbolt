package cn.jbolt.base.api;

import com.jfinal.log.Log;

import cn.jbolt.base.JBoltCommonServiceAdapter;

/**
 * API接口调用Service基类
 * @ClassName:  ApiBaseService   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月16日   
 */
public abstract class JBoltApiBaseService extends JBoltCommonServiceAdapter{
	protected static final Log API_LOG=Log.getLog("JBoltApiLog");
}