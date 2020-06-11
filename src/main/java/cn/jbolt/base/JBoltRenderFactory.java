package cn.jbolt.base;

import com.jfinal.render.Render;
import com.jfinal.render.RenderFactory;
/**
 * JBolt自定义RenderFactory
 * @ClassName:  JBoltRenderFactory   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年5月27日   
 */
public class JBoltRenderFactory extends RenderFactory {
	public Render getRedirectRender(String url) {
		return new JBoltRedirectRender(url);
	}
	public Render getRedirectRender(String url, boolean b) {
		return new JBoltRedirectRender(url, b);
	}
}
