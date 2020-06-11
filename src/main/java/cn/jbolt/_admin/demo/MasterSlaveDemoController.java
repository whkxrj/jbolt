package cn.jbolt._admin.demo;

import com.jfinal.aop.Inject;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt._admin.updatemgr.ChangeLogService;
import cn.jbolt._admin.updatemgr.JBoltVersionService;
import cn.jbolt._admin.updatemgr.JboltVersionFileService;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.config.PageSize;
/**
 * 主从表管理案例
 * @ClassName:  MasterSlaveDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年9月10日   
 */
@CheckPermission(PermissionKey.DEMO_MASTERSLAVE)
@UnCheckIfSystemAdmin
public class MasterSlaveDemoController extends JBoltBaseController {
	@Inject
	private JBoltVersionService service;
	@Inject
	private ChangeLogService changeLogService;
	@Inject
	private JboltVersionFileService jboltVersionFileService;
	/**
	 * demo主页
	 */
	public void index() {
		set("pageData", service.paginate(getPageNumber(), getPageSize(PageSize.PAGESIZE_API_LIST_10)));
		render("index.html");
	}
	/**
	 * JBolttable版主页
	 */
	public void jbolttable() {
		render("jbolttable.html");
	}
	/**
	 * 主表数据源 分页
	 */
	public void masterDatas() {
		renderJsonData(service.paginate(getPageNumber(), getPageSize(PageSize.PAGESIZE_API_LIST_10)));
	}
	/**
	 * 主更新文件列表
	 */
	public void mainFilesDatas() {
		Integer jboltVersionId=getInt(0);
		if(notOk(jboltVersionId)) {
			renderJsonData(jboltVersionFileService.getEmptyPage());
			return;
		}
		renderJsonData(jboltVersionFileService.pageFilesByJboltVersionId(jboltVersionId,getPageNumber(),getPageSize()));
	}
	/**
	 * 主更新文件列表
	 */
	public void mainFiles() {
		Integer jboltVersionId=getInt(0);
		if(notOk(jboltVersionId)) {
			renderErrorPortal("暂无数据");
			return;
		}
		set("jboltVersionId", jboltVersionId);
		set("files", jboltVersionFileService.getFilesByJboltVersionId(jboltVersionId));
		render("files.html");
	}
	/**
	 * 读取changelog
	 */
	public void changelogPortal() {
		Integer jboltVersionId=getInt(0);
		if(notOk(jboltVersionId)) {
			renderErrorPortal("暂无数据");
			return;
		}
		set("jboltVersionId", jboltVersionId);
		set("changelog", changeLogService.findByJboltVersionId(jboltVersionId));
		render("changelog.html");
	}
	/**
	 * 读取changelog
	 */
	public void changelog() {
		Integer jboltVersionId=getInt(0);
		if(notOk(jboltVersionId)) {
			renderErrorPortal("暂无数据");
			return;
		}
		set("jboltVersionId", jboltVersionId);
		set("changelog", changeLogService.findByJboltVersionId(jboltVersionId));
		render("changelog.html");
	}
}
