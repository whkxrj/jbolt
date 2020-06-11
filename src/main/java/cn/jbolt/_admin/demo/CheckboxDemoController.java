package cn.jbolt._admin.demo;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
/**
 * Demo演示-Radio组件页面
 * @ClassName:  RadioDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月1日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class CheckboxDemoController extends JBoltBaseController {
	public void index() {
		render("checkbox.html");
	}
	public void submit() {
		keepCheckbox("aihao");
		keepCheckbox("aihao1");
		keepCheckbox("filetypes");
		render("checkbox.html");
	}
}
