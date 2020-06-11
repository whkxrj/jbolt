package cn.jbolt._admin.systemlog;

import java.util.Date;

import com.jfinal.aop.Inject;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.config.PageSize;
import cn.jbolt.common.util.DateUtil;
@CheckPermission(PermissionKey.SYSTEMLOG)
@UnCheckIfSystemAdmin
public class SystemLogAdminController extends JBoltBaseController {
	@Inject
	private SystemLogService service;
	public void index() {
		Date startTime=getDate("startTime",DateUtil.getYesterDayDate());
		Date endTime=getDate("endTime",DateUtil.getNowDate());
		String keywords=getKeywords();
		set("pageData", service.paginateAdminList(getPageNumber(),getPageSize(PageSize.PAGESIZE_ADMIN_LIST_30),keywords,startTime,endTime));
		set("startTime", startTime);
		set("endTime", endTime);
		setKeywords(keywords);
		render("index.html");
	}
}
