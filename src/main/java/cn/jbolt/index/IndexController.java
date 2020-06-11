package cn.jbolt.index;

import com.jfinal.aop.Before;

import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.base.para.JBoltNoUrlPara;

/**
* @author 小木 qq:909854136
* @version 创建时间：2019年1月11日 上午2:39:20
*/
public class IndexController extends JBoltBaseController {
	@Before(JBoltNoUrlPara.class)
	public void index(){
		forwardAction("/admin");
	}
}
