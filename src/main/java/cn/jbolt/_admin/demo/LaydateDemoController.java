package cn.jbolt._admin.demo;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
/**
 * Demo演示-Laydate组件页面
 * @ClassName:  LaydateDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月1日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class LaydateDemoController extends JBoltBaseController {
	public void index() {
		render("laydate.html");
	}
	public void submit(){
		keepPara();
		render("laydate.html");
	}
	
}
