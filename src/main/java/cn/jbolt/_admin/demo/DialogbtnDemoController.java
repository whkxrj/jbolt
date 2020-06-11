package cn.jbolt._admin.demo;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
/**
 * Demo演示-DialogBtn组件页面
 * @ClassName:  DialogbtnDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月1日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class DialogbtnDemoController extends JBoltBaseController {
	public void index() {
		render("dialogbtn.html");
	}
	
	public void temp() {
		renderHtml("<h2>这是Demo临时测试界面</h2>");
	}
	public void btn() {
		render("btn.html");
	}
	
	public void submit() {
		renderJsonSuccess();
	}
}
