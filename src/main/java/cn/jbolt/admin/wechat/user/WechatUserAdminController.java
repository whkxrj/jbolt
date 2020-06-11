package cn.jbolt.admin.wechat.user;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.aop.Inject;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheck;
import cn.jbolt.admin.wechat.mpinfo.WechatMpinfoService;
import cn.jbolt.admin.wechat.mpinfo.WechatMpinfoType;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.bean.Option;
import cn.jbolt.common.bean.OptionBean;
import cn.jbolt.common.config.PageSize;
import cn.jbolt.common.model.User;
import cn.jbolt.common.model.WechatMpinfo;
/**
 *   微信用户信息管理 公众号和小程序
 * @ClassName:  WechatUserAdminController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年7月20日   
 */
@CheckPermission(PermissionKey.WECHAT_USER)
public class WechatUserAdminController extends JBoltBaseController {
	@Inject
	private WechatUserService service;
	@Inject
	private WechatMpinfoService wechatMpinfoService;
	@Before(WechatUserMgrValidator.class)
	public void index() {
		Integer mpId=getInt(0);
		set("pageData", service.paginateAdminList(mpId,getPageNumber(), getPageSize(PageSize.PAGESIZE_ADMIN_LIST_20),getKeywords(),getInt("sex")));
		keepPara();
		set("mpId", mpId);
		WechatMpinfo mpinfo=getAttr("mpinfo");
		set("isNotWxa", mpinfo.getType().intValue()!=WechatMpinfoType.XCX.getValue());
		render("index.html");
	}
	@UnCheck
	public void sexOptions() {
		List<Option> options=new ArrayList<Option>();
		options.add(new OptionBean("未知",User.SEX_NONE));
		options.add(new OptionBean("男",User.SEX_MALE));
		options.add(new OptionBean("女",User.SEX_FEMALE));
		renderJsonData(options);
	}
	/**
	 * 执行微信用户数据同步
	 */
	@Before(WechatUserMgrValidator.class)
	public void sync() {
		Integer mpId=getInt(0);
		renderJson(service.sync(mpId));
	}
	/**
	 * 切换Enable状态
	 */
	@Before(WechatUserMgrValidator.class)
	public void toggleEnable() {
		Integer mpId=getInt(0);
		Integer id=getInt(1);
		renderJson(service.toggleEnable(getSessionAdminUserId(),mpId,id));
	}
	/**
	 * 同步个人信息
	 */
	@Before(WechatUserMgrValidator.class)
	public void syncUser() {
		Integer mpId=getInt(0);
		Integer id=getInt(1);
		renderJson(service.syncOneUserInfo(getSessionAdminUserId(),mpId,id));
	}
}
