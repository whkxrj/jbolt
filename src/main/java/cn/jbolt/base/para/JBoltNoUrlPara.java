package cn.jbolt.base.para;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

import cn.jbolt.base.JBoltControllerKit;
/**
 * Force action no urlPara, otherwise render error 404.
 * @ClassName:  JBoltNoUrlPara   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年9月17日   
 */
public class JBoltNoUrlPara implements Interceptor {
	@Override
	public void intercept(Invocation inv) {
		Controller controller =inv.getController();
		if (controller.getPara() == null) {
			inv.invoke();
		} else {
			JBoltControllerKit.render404Error(controller);
		}
	}
}