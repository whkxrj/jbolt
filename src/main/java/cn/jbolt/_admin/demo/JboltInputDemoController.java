package cn.jbolt._admin.demo;

import com.jfinal.aop.Inject;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt._admin.user.UserService;
import cn.jbolt.admin.mall.goodscategory.back.GoodsBackCategoryService;
import cn.jbolt.base.JBoltBaseController;
/**
 * Demo演示-JBoltInput组件页面
 * @ClassName:  JboltInputDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月1日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class JboltInputDemoController extends JBoltBaseController {
	@Inject
	private GoodsBackCategoryService goodsBackCategoryService;
	@Inject
	private UserService userService;
	public void index() {
		render("index.html");
	}
	public void dialog() {
		render("dialog.html");
	}
	public void jboltlayer() {
		render("jboltlayer.html");
	}
	/**
	 * ajaxPortal加载的内容
	 */
	public void ajaxPortalTable() {
		set("users", userService.findAll());
		render("ajaxportal_table.html");
	}
	/**
	 * ajaxPortal加载的内容
	 */
	public void ajaxPortalTableMultiHidden() {
		set("users", userService.findAll());
		render("ajaxportal_table_multi_hidden.html");
	}
	/**
	 * 树形结构数据源
	 */
	public void treeDatas() {
		renderJsonData(goodsBackCategoryService.getEnableTree(getInt(0,0)));
	}
}
