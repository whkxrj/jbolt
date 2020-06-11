package cn.jbolt._admin.loginlog;

import java.util.Date;

import com.jfinal.aop.Inject;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.config.Msg;
import cn.jbolt.common.config.PageSize;
import cn.jbolt.common.model.LoginLog;
import cn.jbolt.common.util.DateUtil;
/**
 * 登录日志controller
 * @ClassName:  LoginLogAdminController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年5月12日   
 */
@CheckPermission(PermissionKey.JBOLT_LOGIN_LOG)
@UnCheckIfSystemAdmin
public class LoginLogAdminController extends JBoltBaseController {
	@Inject
	private LoginLogService service;
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
	/**
	 * 查看详情 
	 * Jboltlayer样式内容
	 */
	public void detail() {
		Integer id=getInt(0);
		if(notOk(id)){
			renderErrorPortal(Msg.PARAM_ERROR);
			return;
		}
		LoginLog log=service.findById(id);
		if(log == null) {
			renderErrorPortal(Msg.DATA_NOT_EXIST);
			return;
		}
		set("log", log);
		render("detail.html");
		
	}
}
