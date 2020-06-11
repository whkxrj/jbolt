package cn.jbolt.admin.wechat.mpinfo;

import java.util.Date;
import java.util.List;

import com.jfinal.aop.Inject;
import com.jfinal.kit.Kv;
import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Page;

import cn.jbolt.admin.appdevcenter.ApplicationService;
import cn.jbolt.admin.appdevcenter.ApplicationType;
import cn.jbolt.admin.appdevcenter.JBoltAppLinkTarget;
import cn.jbolt.admin.wechat.autoreply.WechatAutoReplyService;
import cn.jbolt.admin.wechat.config.WechatConfigService;
import cn.jbolt.admin.wechat.media.WechatMediaService;
import cn.jbolt.admin.wechat.menu.WechatMenuService;
import cn.jbolt.admin.wechat.user.WechatUserService;
import cn.jbolt.base.JBoltBaseService;
import cn.jbolt.common.config.MainConfig;
import cn.jbolt.common.config.Msg;
import cn.jbolt.common.model.Application;
import cn.jbolt.common.model.SystemLog;
import cn.jbolt.common.model.WechatMpinfo;
import cn.jbolt.common.util.RealUrlUtil;

/**   
 * 微信公众平台管理
 * @ClassName:  WechatMpinfoService   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年5月7日 下午5:18:47   
 */
public class WechatMpinfoService extends JBoltBaseService<WechatMpinfo> {
	private WechatMpinfo dao = new WechatMpinfo().dao();
	@Inject
	private WechatConfigService wechatConfigService;
	@Inject
	private WechatMenuService wechatMenuService;
	@Inject
	private WechatAutoReplyService wechatAutoReplyService;
	@Inject
	private WechatMediaService wechatMediaService;
	@Inject
	private WechatUserService wechatUserService;
	@Inject
	private ApplicationService applicationService;

	@Override
	protected WechatMpinfo dao() {
		return dao;
	}
	/**
	 * 保存
	 * @param userId
	 * @param wechatMpinfo
	 * @return
	 */
	public Ret save(Integer userId, WechatMpinfo wechatMpinfo) {
		if(wechatMpinfo==null||isOk(wechatMpinfo.getId())||notOk(wechatMpinfo.getName())||notOk(wechatMpinfo.getType())){
			return fail(Msg.PARAM_ERROR);
		}
		String name=wechatMpinfo.getName().trim();
		if(existsName(name)){
			return fail(Msg.DATA_SAME_NAME_EXIST);
		}
		wechatMpinfo.setName(name);
		//添加的必须是false 因为启用这个是有操作的
		wechatMpinfo.setEnable(false);
		wechatMpinfo.setUserId(userId);
		wechatMpinfo.setCreateTime(new Date());
		wechatMpinfo.setUpdateUserId(userId);
		wechatMpinfo.setUpdateTime(new Date());
		boolean success=wechatMpinfo.save();
		if(success){
			//添加日志
			addSaveSystemLog(wechatMpinfo.getId(), userId,SystemLog.TARGETTYPE_WECHAT_MPINFO, wechatMpinfo.getName());
			//生成对应的关注微信用户表
			boolean createRet=wechatUserService.createTable(wechatMpinfo.getId());
			if(!createRet) {
				return success("公众平台创建成功，但是表生成失败！请检查后修改此公众平台，可再次生成。");
			}
		}
		return ret(success);
	}
	/**
	 * 更新
	 * @param userId
	 * @param wechatMpinfo
	 * @return
	 */
	public Ret update(Integer userId, WechatMpinfo wechatMpinfo) {
		if(wechatMpinfo==null||notOk(wechatMpinfo.getId())||notOk(wechatMpinfo.getName())||notOk(wechatMpinfo.getType())){
			return fail(Msg.PARAM_ERROR);
		}
		//不能轻易修改enable
		wechatMpinfo.remove("enable");
		String name=wechatMpinfo.getName().trim();
		if(existsName(name, wechatMpinfo.getId())){
			return fail(Msg.DATA_SAME_NAME_EXIST);
		}
		wechatMpinfo.setName(name);
		wechatMpinfo.setUpdateUserId(userId);
		wechatMpinfo.setUpdateTime(new Date());
		boolean success=wechatMpinfo.update();
		if(success){
			//添加日志
			addUpdateSystemLog(wechatMpinfo.getId(), userId,SystemLog.TARGETTYPE_WECHAT_MPINFO, wechatMpinfo.getName());
			//生成对应的关注微信用户表
			boolean createRet=wechatUserService.createTable(wechatMpinfo.getId());
			if(!createRet) {
				return success("公众平台更新成功，但是表生成失败！请检查后修改此公众平台，可再次生成。");
			}
		}
		return ret(success);
	}
	/**
	 * 删除
	 * @param userId
	 * @param id
	 * @return
	 */
	public Ret delete(Integer userId, Integer id) {
		Ret ret=deleteById(id, true);
		if(ret.isOk()){
			//添加日志
			WechatMpinfo wechatMpinfo=ret.getAs("data");
			addDeleteSystemLog(id, userId,SystemLog.TARGETTYPE_WECHAT_MPINFO, wechatMpinfo.getName());
		}
		return ret;
	}
	
	@Override
	public String checkInUse(WechatMpinfo wechatMpinfo) {
		boolean wechatConfig=wechatConfigService.checkWechatMpinfoInUse(wechatMpinfo.getId());
		if(wechatConfig){return "此公众平台已经存在相关配置信息，不能删除！";}
		boolean wechatMenu=wechatMenuService.checkWechatMpinfoInUse(wechatMpinfo.getId());
		if(wechatMenu){return "此公众平台已经存在菜单配置，不能删除！";}
		boolean wechatAutoReply=wechatAutoReplyService.checkWechatMpinfoInUse(wechatMpinfo.getId());
		if(wechatAutoReply){return "此公众平台已经存在自动回复规则配置，不能删除！";}
		return null;
	}
	/**
	 * 切换启动/禁用状态
	 * @param userId
	 * @param id
	 * @return
	 */
	public Ret toggleEnable(Integer userId, Integer id) {
		Ret ret=toggleBoolean(id, "enable");
		if(ret.isOk()){
			//添加日志
			WechatMpinfo wechatMpinfo=ret.getAs("data");
			if(wechatMpinfo.getEnable()){
				Ret cRet=wechatConfigService.configOneMpinfo(wechatMpinfo);
				if(cRet.isFail()){
					wechatMpinfo.setEnable(false);
					wechatMpinfo.update();
					return cRet;
				}
			}else{
				wechatConfigService.removeOneEnableApiConfig(wechatMpinfo.getId());
			}
			//添加日志
			addUpdateSystemLog(id, userId,SystemLog.TARGETTYPE_WECHAT_MPINFO, wechatMpinfo.getName(),"的启用状态:"+wechatMpinfo.getEnable());
			return successWithData(wechatMpinfo.getEnable());
		}
		return ret;
	}
	 
	/**
	 * 切换认证状态
	 * @param userId
	 * @param id
	 * @return
	 */
	public Ret toggleAuthenticated(Integer userId, Integer id) {
		Ret ret=toggleBoolean(id, "is_authenticated");
		if(ret.isOk()){
			//添加日志
			WechatMpinfo wechatMpinfo=ret.getAs("data");
			addUpdateSystemLog(id, userId,SystemLog.TARGETTYPE_WECHAT_MPINFO, wechatMpinfo.getName(),"的认证状态:"+wechatMpinfo.getIsAuthenticated());
			return successWithData(wechatMpinfo.getIsAuthenticated());
		}
		return ret;
	}
	/**
	 * 后台管理分页读取
	 * @param pageNumber
	 * @param pageSize
	 * @param keywords
	 * @param enable
	 * @param type
	 * @param subjectType
	 * @param isAuthenticated
	 * @return
	 */
	public Page<WechatMpinfo> paginateAdminList(int pageNumber, int pageSize, String keywords, Boolean enable,
			Integer type, Integer subjectType, Boolean isAuthenticated) {
		Kv paras=Kv.create();
		paras.setIfNotBlank("keywords", keywords);
		paras.setIfNotNull("enable", enable);
		paras.setIfNotNull("isAuthenticated", isAuthenticated);
		paras.setIfNotNull("type", type);
		paras.set("table",table());
		paras.setIfNotNull("subjectType", subjectType);
		return daoTemplate("wechat.mpinfo.paginateAdminList", paras).paginate(pageNumber, pageSize);
	}

	/**
	 * 获取所有启用的公众号
	 * @return
	 */
	public List<WechatMpinfo> getAllEnableList() {
		return getCommonList(Kv.by("enable", TRUE()));
	}
	/**
	 * 清空配置
	 * @param userId
	 * @param mpId
	 * @return
	 */
	public Ret clearAllConfigs(Integer userId, Integer mpId) {
		if(MainConfig.DEMO_MODE) {return fail(Msg.DEMO_MODE_CAN_NOT_DELETE);}
		//公众平台配置删除
		wechatConfigService.deleteByMpId(mpId);
		//删除菜单
		wechatMenuService.deleteByMpId(mpId);
		//删除自动回复设置
		wechatAutoReplyService.deleteByMpId(mpId);
		//素材库
		wechatMediaService.deleteByMpId(mpId);
		return SUCCESS;
	}
	/**
	 * 确定关联APP 操作
	 * @param userId
	 * @param mpId
	 * @param appId
	 * @return
	 */
	public Ret submitLinkApp(Integer userId, Integer mpId, Integer appId) {
		if(notOk(mpId)||notOk(appId)) {return fail(Msg.PARAM_ERROR);}
		WechatMpinfo wechatMpinfo=findById(mpId);
		if(wechatMpinfo==null) {return fail("公众平台"+Msg.DATA_NOT_EXIST);}
		Application application=applicationService.findById(appId);
		if(application==null) {return fail("关联应用"+Msg.DATA_NOT_EXIST);}
		if(isOk(application.getLinkTargetId())&&application.getLinkTargetId().intValue()!=mpId.intValue()) {
			return fail("应用["+application.getName()+"]已经被其它 "+application.getTypeName()+" 关联");
		}
		
		if(wechatMpinfo.getType().intValue()==WechatMpinfoType.XCX.getValue()) {
			if(application.getType().intValue()!=ApplicationType.WECHAT_XCX.getValue()) {
				return fail("应用["+application.getName()+"]类型不是微信小程序,请换个微信小程序应用绑定");
			}
		}else if(application.getType().intValue()!=ApplicationType.MP_H5.getValue()) {
				return fail("应用["+application.getName()+"]类型不是微信公众平台H5,请换个微信公众平台H5应用绑定");
			}
		
		if(isOk(application.getLinkTargetId())&&application.getLinkTargetId().intValue()==mpId.intValue()) {
			return SUCCESS;
		}
		wechatMpinfo.setLinkAppId(appId);
		application.setLinkTargetId(mpId);
		boolean success_wx=wechatMpinfo.update();
		boolean success_app=application.update();
		if(success_wx&&success_app) {
			addUpdateSystemLog(mpId, userId, SystemLog.TARGETTYPE_WECHAT_MPINFO, wechatMpinfo.getName(), "的关联应用为:["+application.getName()+"("+application.getTypeName()+")]");
		}
		return ret(success_wx&&success_app);
	}
	/**
	 * 解除关联的application
	 * @param userId
	 * @param mpId
	 * @return
	 */
	public Ret removeLinkApp(Integer userId, Integer mpId) {
		if(notOk(mpId)) {return fail(Msg.PARAM_ERROR);}
		WechatMpinfo wechatMpinfo=findById(mpId);
		if(wechatMpinfo==null) {return fail("公众平台"+Msg.DATA_NOT_EXIST);}
		Integer linkAppId=wechatMpinfo.getLinkAppId();
		if(notOk(linkAppId)) {
			return fail("公众平台尚未关联任何应用");
		}
		wechatMpinfo.setLinkAppId(null);
		boolean success=wechatMpinfo.update();
		if(success) {
			applicationService.removeLinkTarget(userId,linkAppId);
			addUpdateSystemLog(mpId, userId, SystemLog.TARGETTYPE_WECHAT_MPINFO, wechatMpinfo.getName(), " 与关联应用解除绑定");
		}
		return ret(success);
	}
	/**
	 * 获取APP关联对象信息
	 * @param id
	 * @return
	 */
	public JBoltAppLinkTarget getAppLinkTargetInfo(Integer id) {
		WechatMpinfo m=findById(id);
		if(m==null) {return null;}
		JBoltAppLinkTarget jBoltAppLinkTarget=new JBoltAppLinkTarget();
		jBoltAppLinkTarget.setName(m.getName());
		jBoltAppLinkTarget.setLogo(RealUrlUtil.getImage(m.getLogo()));
		jBoltAppLinkTarget.setId(id);
		jBoltAppLinkTarget.setTypeName(m.getTypeName());
		jBoltAppLinkTarget.setSubjectTypeName(m.getSubjectTypeName());
		return jBoltAppLinkTarget;
		
	}

}
