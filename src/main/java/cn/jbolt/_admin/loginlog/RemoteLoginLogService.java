package cn.jbolt._admin.loginlog;

import java.util.Date;

import com.jfinal.kit.Kv;
import com.jfinal.kit.Ret;

import cn.jbolt.base.JBoltBaseService;
import cn.jbolt.common.model.LoginLog;
import cn.jbolt.common.model.RemoteLoginLog;
import cn.jbolt.common.model.User;
/**
 * 异地登录异常日志Service
 * @ClassName:  RemoteLoginLogService   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年5月12日   
 */
public class RemoteLoginLogService extends JBoltBaseService<RemoteLoginLog> {
	private RemoteLoginLog dao=new RemoteLoginLog().dao();
	@Override
	protected RemoteLoginLog dao() {
		return dao;
	}
	
	/**
	 * 得到上一次的日志
	 * @return
	 */
	public RemoteLoginLog getUserLastRemoteLog(Integer userId) {
		return findFirst(Kv.by("user_id", userId).set("is_new",TRUE()));
	}
	
	/**
	 * 创建异地异常登录日志
	 * @param user
	 * @param log
	 */
	public Ret createLog(User user, LoginLog loginLog) {
		//先把上次的处理掉
		processLastRemoteLogIsNewFlase(user.getId());
		//再新增本次的log
		RemoteLoginLog remoteLoginLog=new RemoteLoginLog();
		remoteLoginLog.setCreateTime(new Date());
		remoteLoginLog.setUserId(user.getId());
		remoteLoginLog.setUsername(user.getUsername());
		remoteLoginLog.setIsNew(true);
		remoteLoginLog.setLastLoginIp(user.getLoginIp());
		remoteLoginLog.setLastLoginProvince(user.getLoginProvince());
		remoteLoginLog.setLastLoginCity(user.getLoginCity());
		remoteLoginLog.setLastLoginTime(user.getLoginTime());
		
		remoteLoginLog.setLoginIp(loginLog.getLoginIp());
		remoteLoginLog.setLoginTime(loginLog.getLoginTime());
		remoteLoginLog.setLoginProvince(loginLog.getLoginProvince());;
		remoteLoginLog.setLoginCity(loginLog.getLoginCity());
		boolean success = remoteLoginLog.save();
		return ret(success);
	}
	
	/**
	 * 将用户的上次log的is_new设置为false
	 * @param userId
	 */
	private void processLastRemoteLogIsNewFlase(Integer userId) {
		RemoteLoginLog lastLog=getUserLastRemoteLog(userId);
		if(lastLog!=null) {
			lastLog.setIsNew(false);
			lastLog.update();
		}
	}

}
