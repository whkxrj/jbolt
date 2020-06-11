package cn.jbolt.common.directive;

import cn.jbolt.common.util.RealUrlUtil;

/**
 * 正确输出图片地址的指令
 * @ClassName:  RealImageDirective   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年4月14日 下午10:08:45   
 */
public class RealImageDirective extends RealUrlDirective {
	public RealImageDirective() {
		super("realImage");
	}
	@Override
	protected String getRealUrl(Object value,Object defaultValue) {
		return RealUrlUtil.getImage(value, defaultValue);
	}
}
