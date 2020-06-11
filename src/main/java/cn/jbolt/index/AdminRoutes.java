package cn.jbolt.index;

import com.jfinal.config.Routes;

import cn.jbolt._admin.dictionary.DictionaryAdminController;
import cn.jbolt._admin.dictionary.DictionaryTypeAdminController;
import cn.jbolt._admin.globalconfig.GlobalConfigAdminController;
import cn.jbolt._admin.interceptor.JBoltAdminAuthInterceptor;
import cn.jbolt._admin.loginlog.LoginLogAdminController;
import cn.jbolt._admin.monitor.ServerMonitorAdminController;
import cn.jbolt._admin.permission.PermissionAdminController;
import cn.jbolt._admin.role.RoleAdminCotroller;
import cn.jbolt._admin.rolepermission.RolePermissionAdminController;
import cn.jbolt._admin.systemlog.SystemLogAdminController;
import cn.jbolt._admin.updatemgr.DownloadLogAdminController;
import cn.jbolt._admin.updatemgr.JBoltVersionAdminController;
import cn.jbolt._admin.updatemgr.UpdateLibsAdminController;
import cn.jbolt._admin.user.UserAdminCotroller;
import cn.jbolt._admin.userconfig.UserConfigAdminController;
import cn.jbolt.common.controller.NeditorPreviewAdminController;
import cn.jbolt.common.controller.NeditorUploadAdminController;
import cn.jbolt.common.controller.SummernoteUploadAdminController;
import cn.jbolt.common.style.JBoltStyleAdminController;
/**
 * admin后台的路由配置
 * @ClassName:  AdminRoutes   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年3月26日 下午12:25:20   
 */
public class AdminRoutes extends Routes {

	@Override
	public void config() {
		this.setBaseViewPath("/_view/_admin");
		this.addInterceptor(new JBoltAdminAuthInterceptor());
		this.add("/admin", AdminIndexController.class,"/index");
		this.add("/admin/pjaxerror", PjaxErrorController.class);
		this.add("/admin/jboltstyle", JBoltStyleAdminController.class);
		this.add("/admin/user", UserAdminCotroller.class,"/user");
		this.add("/admin/role", RoleAdminCotroller.class,"/role");
		this.add("/admin/dictionarytype", DictionaryTypeAdminController.class,"/dictionary/type");
		this.add("/admin/dictionary", DictionaryAdminController.class,"/dictionary");
		this.add("/admin/permission", PermissionAdminController.class,"/permission");
		this.add("/admin/rolepermission", RolePermissionAdminController.class,"/rolepermission");
		this.add("/admin/systemlog", SystemLogAdminController.class,"/systemlog");
		this.add("/admin/loginlog", LoginLogAdminController.class,"/loginlog");
		this.add("/admin/globalconfig", GlobalConfigAdminController.class,"/globalconfig");
		this.add("/admin/jboltversion", JBoltVersionAdminController.class,"/jboltversion");
		this.add("/admin/updatelibs", UpdateLibsAdminController.class,"/updatelibs");
		this.add("/admin/downloadlog", DownloadLogAdminController.class,"/downloadlog");
		this.add("/admin/neditor/upload", NeditorUploadAdminController.class);
		this.add("/admin/neditor/preview", NeditorPreviewAdminController.class);
		this.add("/admin/summernote/upload", SummernoteUploadAdminController.class);
		this.add("/admin/userconfig", UserConfigAdminController.class,"/userconfig");
		this.add("/admin/servermonitor", ServerMonitorAdminController.class,"/servermonitor");
	}

}
