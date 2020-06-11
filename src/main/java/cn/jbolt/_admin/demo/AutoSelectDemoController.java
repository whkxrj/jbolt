package cn.jbolt._admin.demo;

import java.util.Arrays;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
/**
 * Demo演示-AutoSelect组件页面
 * @ClassName:  AutoSelectDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月1日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class AutoSelectDemoController extends JBoltBaseController {
	public void index() {
		render("autoselect.html");
	}
	
	public void submit() {
		keepPara();
		Integer[] arrs=getParaValuesToInt("dic_select2_multiple");
		set("dic_select2_multiple", Arrays.toString(arrs));
		render("autoselect.html");
	}
	public void ajaxsubmit() {
		renderJsonSuccess();
	}
	public void indialog() {
		render("autoselect_indialog.html");
	}
	public void injboltlayer() {
		render("autoselect_injboltlayer.html");
	}
	
	public void submitInDialog() {
		keepPara();
		Integer[] arrs=getParaValuesToInt("dic_select2_multiple");
		set("dic_select2_multiple", Arrays.toString(arrs));
		render("autoselect_indialog.html");
	}
}
