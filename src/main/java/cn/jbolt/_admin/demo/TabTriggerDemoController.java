package cn.jbolt._admin.demo;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
/**
 * Demo演示-TabTrigger组件页面
 * @ClassName:  TabTriggerDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月1日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class TabTriggerDemoController extends JBoltBaseController {
	public void index() {
		render("tabtrigger.html");
	}
	public void content() {
		render("tabtriggercontent.html");
	}
	
}
