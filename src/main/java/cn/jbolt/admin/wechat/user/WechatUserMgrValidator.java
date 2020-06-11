package cn.jbolt.admin.wechat.user;

import com.jfinal.aop.Inject;
import com.jfinal.core.Controller;

import cn.jbolt.admin.wechat.mpinfo.WechatMpinfoService;
import cn.jbolt.base.para.JBoltValidator;
import cn.jbolt.common.config.Msg;
import cn.jbolt.common.model.WechatMpinfo;

public class WechatUserMgrValidator extends JBoltValidator {
	@Inject
	private WechatUserService wechatUserService;
	@Inject
	private WechatMpinfoService wechatMpinfoService;
	@Override
	protected void validate(Controller c) {
		validateJBoltInteger(0, Msg.PARAM_ERROR);
		Integer mpId=c.getInt(0);
		if(mpId!=null&&mpId>0) {
			WechatMpinfo mpinfo=wechatMpinfoService.findById(mpId);
			if(mpinfo==null) {
				setErrorMsg("微信公众平台"+Msg.DATA_NOT_EXIST);
			}else {
				c.setAttr("mpinfo", mpinfo);
				boolean exist=wechatUserService.tableExist(mpId);
				if(exist==false) {
					setErrorMsg(Msg.TABLE_NOT_EXIST);
				}
			}
			
		}
	}
}
