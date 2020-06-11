package cn.jbolt._admin.loginlog;

import java.util.Date;

import com.jfinal.kit.Kv;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;

import cn.jbolt.base.JBoltBaseService;
import cn.jbolt.common.model.LoginLog;
import cn.jbolt.common.util.DateUtil;
/**
 * 登录日志记录
 * @ClassName:  LoginLogService   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年5月12日   
 */
public class LoginLogService extends JBoltBaseService<LoginLog> {
	private LoginLog dao=new LoginLog().dao();
	@Override
	protected LoginLog dao() {
		return dao;
	}
	/**
	 * 更新登录日志是否是异常异地登录
	 * @param log
	 * @param isRemoteLogin
	 */
	public void updateIsRemoteLogin(LoginLog log, boolean isRemoteLogin) {
		log.setIsRemoteLogin(isRemoteLogin);
		log.update();
	}
	
	public Page<LoginLog> paginateAdminList(Integer pageNumber, Integer pageSize, String keywords, Date startTime,
			Date endTime) {
		Kv paras=Kv.create();
		if(StrKit.notBlank(keywords)){
			keywords=keywords.trim();
			paras.set("username",columnLike(keywords));
		}
		if(isOk(startTime)){
			paras.set("create_time >=",toDateTime(DateUtil.HHmmssTo000000Str(startTime)));
		}
		if(isOk(endTime)){
			paras.set("create_time <=",toDateTime(DateUtil.HHmmssTo235959Str(endTime)));
		}
		
		return paginate(paras, "id", "desc", pageNumber, pageSize, true);
	}

}
