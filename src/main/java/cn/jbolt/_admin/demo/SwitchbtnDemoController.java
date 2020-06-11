package cn.jbolt._admin.demo;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
/**
 * Demo演示-SwitchBtn组件页面
 * @ClassName:  SwitchbtnDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月1日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class SwitchbtnDemoController extends JBoltBaseController {
	public void index() {
		set("enable", true);
		set("dataId", 1);
		render("switchbtn.html");
	}
	/**
	 * 最简单的调用
	 */
	public void toggleNormal() {
//		这里一般就是调用service方法 里 执行具体切换任务
//		renderJson(serviceui.toggleEnable(getInt(0)));
		//这里模拟执行成功
		renderJsonSuccess();
	}
	/**
	 * 最简单的调用 测试fail
	 */
	public void toggleNormalFail() {
//		这里一般就是调用service方法 里 执行具体切换任务
//		renderJson(serviceui.toggleEnable(getInt(0)));
		//这里模拟执行成功
		renderJsonFail("切换状态失败");
	}
}
