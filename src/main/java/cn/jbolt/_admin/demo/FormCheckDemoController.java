package cn.jbolt._admin.demo;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
/**
 * Demo演示-表单校验 页面
 * @ClassName:  FormCheckDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月1日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class FormCheckDemoController extends JBoltBaseController {
	public void index() {
		render("formcheck.html");
	}
	
	public void submit() {
		keepPara();
		render("formcheck.html");
	}
	public void ajaxCheckSuccess() {
		renderJsonSuccess();
	}
	public void ajaxCheckFail() {
		renderJsonFail("已经存在重名数据");
	}
	
}
