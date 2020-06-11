package cn.jbolt._admin.demo;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
/**
 * Demo演示-Autocomplete组件页面
 * @ClassName:  AutocompleteDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月1日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class AutocompleteDemoController extends JBoltBaseController {
	public void index() {
		render("autocomplete.html");
	}
	
	public void submit() {
		keepPara();
		render("autocomplete.html");
	}
}
