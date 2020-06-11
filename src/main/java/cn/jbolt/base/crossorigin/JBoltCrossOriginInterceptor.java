package cn.jbolt.base.crossorigin;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

import cn.jbolt.base.JBoltControllerKit;
/**
 * JBolt平台 跨域拦截器
 * @ClassName:  CrossOriginInterceptor   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月18日   
 */
public class JBoltCrossOriginInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation inv) {
		JBoltControllerKit.processCrossOrign(inv.getController(), inv.getMethod());
		inv.invoke();
	}
 
	

}
