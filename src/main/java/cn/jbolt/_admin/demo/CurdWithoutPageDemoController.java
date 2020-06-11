package cn.jbolt._admin.demo;

import com.jfinal.aop.Inject;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt._admin.updatemgr.JBoltVersionService;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.model.JboltVersion;
/**
 * Demo演示-CURD带分页页面
 * @ClassName:  CurdWithPageDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月1日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class CurdWithoutPageDemoController extends JBoltBaseController {
	@Inject
	private JBoltVersionService service;
	public void index() {
		set("datas", service.getCommonListByKeywords(getKeywords(),"id","desc","version"));
		keepPara();
		render("index.html");
	}
	public void add() {
		render("add.html");
	}

	public void edit() {
		set("jboltVersion", service.findById(getInt(0)));
		render("edit.html");
	}
	public void save() {
		renderJson(service.save(getSessionAdminUserId(), getModel(JboltVersion.class, "jboltVersion")));
	}

	public void update() {
		renderJson(service.update(getSessionAdminUserId(), getModel(JboltVersion.class, "jboltVersion")));
	}

	public void delete() {
		renderJson(service.delete(getSessionAdminUserId(), getInt(0)));
	}
}
