package cn.jbolt._admin.permission;

import com.jfinal.aop.Inject;

import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.model.Permission;
@CheckPermission(PermissionKey.PERMISSION)
@UnCheckIfSystemAdmin
public class PermissionAdminController extends JBoltBaseController {
	@Inject
	private PermissionService service;
	public void index(){
		render("index_ajax.html");
	}
	/**
	 * ajax数据接口
	 */
	public void datas() {
		renderJsonData(service.getAllPermissionsWithLevel());
	}
	/**
	 * ajax options数据接口
	 */
	public void options() {
		renderJsonData(service.getAllPermissionsOptionsWithLevel());
	}
	public void add(){
		set("pid", getInt(0,0));
		set("level", getInt(1,1));
		render("add.html");
	}
	 
	public void edit(){
		Permission permission=service.findById(getInt(0));
		if(permission==null){
			renderFormError("数据不存在或已被删除");
			return;
		}
		set("pid",permission.getPid());
		set("level", permission.getPermissionLevel());
		set("permission", permission);
		render("edit.html");
	}
	
	public void save(){
		renderJson(service.save(getSessionAdminUserId(),getModel(Permission.class,"permission")));
	}
	
	public void update(){
		renderJson(service.update(getSessionAdminUserId(),getModel(Permission.class,"permission")));
	}
	
	public void delete(){
		renderJson(service.delPermissionById(getSessionAdminUserId(),getInt(0),true));
	}
	
	public void up(){
		renderJson(service.doUp(getSessionAdminUserId(),getInt(0)));
	}
	
	public void down(){
		renderJson(service.doDown(getSessionAdminUserId(),getInt(0)));
	}
	
	public void initRank(){
		renderJson(service.doInitRank(getSessionAdminUserId()));
	}
	/**
	 * 切换是否是超管默认
	 */
	public void toggleSystemAdminDefault(){
		renderJson(service.toggleSystemAdminDefault(getSessionAdminUserId(),getInt(0),getInt(1),getInt(2)));
	}
	
}
