package cn.jbolt.admin.appdevcenter;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Inject;
import com.jfinal.kit.Base64Kit;
import com.jfinal.kit.Kv;
import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Page;

import cn.jbolt.admin.wechat.mpinfo.WechatMpinfoService;
import cn.jbolt.admin.wechat.mpinfo.WechatMpinfoType;
import cn.jbolt.base.JBoltBaseService;
import cn.jbolt.base.JBoltEnum;
import cn.jbolt.common.config.Msg;
import cn.jbolt.common.model.Application;
import cn.jbolt.common.model.SystemLog;
import cn.jbolt.common.util.RandomUtil;
/**
 * Api应用中心管理Service
 * @ClassName:  ApplicationService   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年12月10日   
 *    
 *
 */
public class ApplicationService extends JBoltBaseService<Application> {
	private Application dao = new Application().dao();
	@Inject
	private WechatMpinfoService wechatMpinfoService;
	@Override
	protected Application dao() {
		return dao;
	}
	/**
	 * 通过AppId获取一个application
	 * @param appId
	 * @return
	 */
	public Application getByAppId(String appId) {
		return findFirst(Kv.by("app_id", appId));
	}
	/**
	 * 后台管理分页查询
	 * @param pageNumber
	 * @param pageSize
	 * @param keywords
	 * @param type
	 * @param enable 
	 * @return
	 */
	public Page<Application> paginateAdminList(Integer pageNumber, Integer pageSize, String keywords, Integer type, Boolean enable) {
		if(notOk(keywords)&&notOk(type)&&enable==null) {
			return paginate("id","desc",pageNumber, pageSize);
		}
		Kv otherParas=Kv.create();
		if(isOk(type)) {
			otherParas.set("type", type);
		}
		otherParas.setIfNotNull("enable", enable);
		
		if(notOk(keywords)) {
			return paginate(otherParas,"id","desc",pageNumber, pageSize);
		}
		return paginateByKeywords("id","desc",pageNumber, pageSize, keywords, "name,brief_info,app_id", otherParas);
	}
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public Ret deleteApplication(Integer userId,Integer id) {
		Ret ret=deleteById(id);
		if(ret.isOk()) {
			Application application=ret.getAs("data");
			//TODO 删除统计信息
			//TODO 关联信息等
			processLinkTarget(userId,application.getLinkTargetId(),application.getType());
			addDeleteSystemLog(id, userId, SystemLog.TARGETTYPE_APPLICATION, application.getName());
			return SUCCESS;
		}
		return FAIL;
	}
	
	/**
	 * 删除关联数据
	 * @param userId
	 * @param linkTargetId
	 * @param type
	 */
	private void processLinkTarget(Integer userId,Integer linkTargetId, Integer type) {
		ApplicationType et=JBoltEnum.getEnumObjectByValue(ApplicationType.class, type);
		switch (et) {
		case WECHAT_XCX:
			wechatMpinfoService.removeLinkApp(userId, linkTargetId);
			break;
		case MP_H5:
			wechatMpinfoService.removeLinkApp(userId, linkTargetId);
			break;
		case ALIPAY_XCX:
			//TODO 待实现
			break;
		case BAIDU_XCX:
			//TODO 待实现
			break;
		case DOUYIN_XCX:
			//TODO 待实现
			break;
		case MOBILE_APP:
			//TODO 待实现
			break;
		case MOBILE_H5:
			//TODO 待实现
			break;
		case PC_DESKTOP:
			//TODO 待实现
			break;
		case PC_WEB:
			//TODO 待实现
			break;
		case QQ_XCX:
			//TODO 待实现
			break;
		case TOUTIAO_XCX:
			//TODO 待实现
			break;
		case OTHER:
			//TODO 待实现
			break;
		}
		
	}
	/**
	 * 切换状态
	 * @param userId
	 * @param id
	 * @return
	 */
	public Ret toggleEnable(Integer userId, Integer id) {
		Ret ret=toggleBoolean(id, "enable");
		if(ret.isOk()){
			Application application=ret.getAs("data");
			addUpdateSystemLog(id, userId, SystemLog.TARGETTYPE_APPLICATION, application.getName(), "的状态为["+(application.getEnable()?"启用]":"禁用]"));
			return successWithData(application.getEnable());
		}
		return ret;
	}
	/**
	 * 切换接口是否NeedCheckSign
	 * @param userId
	 * @param id
	 * @return
	 */
	public Ret toggleNeedCheckSign(Integer userId, Integer id) {
		Ret ret=toggleBoolean(id, "need_check_sign");
		if(ret.isOk()){
			Application application=ret.getAs("data");
			addUpdateSystemLog(id, userId, SystemLog.TARGETTYPE_APPLICATION, application.getName(), "的属性[是否开启接口校验Signature]为["+(application.getNeedCheckSign()?"开启]":"关闭]"));
			return successWithData(application.getNeedCheckSign());
		}
		return FAIL;
	}
	/**
	 * 变更AppSecret
	 * @param userId
	 * @param id
	 * @return
	 */
	public Ret changeAppSecret(Integer userId, Integer id) {
		if(notOk(id)) {return fail(Msg.PARAM_ERROR);}
		Application application=findById(id);
		if(application==null) {return fail(Msg.DATA_NOT_EXIST);}
		application.setAppSecret(genAppSecret());
		boolean success=application.update();
		if(success) {
			//cache
			addUpdateSystemLog(application.getId(), userId, SystemLog.TARGETTYPE_APPLICATION, application.getName(), "的AppSecret");
		}
		return ret(success);
	}
	/**
	 * 保存
	 * @param userId
	 * @param app
	 * @return
	 */
	public Ret save(Integer userId, Application app) {
		if(app==null||isOk(app.getId())||notOk(app.getName())||notOk(app.getType())) {
			return fail(Msg.PARAM_ERROR);
		}
		String name=app.getName().trim();
		if(existsName(name)) {
			return fail(Msg.DATA_SAME_NAME_EXIST);
		}
		app.setName(name);
		Date now=new Date();
		app.setCreateTime(now);
		app.setUserId(userId);
		app.setUpdateTime(now);
		app.setUpdateUserId(userId);
		app.setEnable(false);
		app.setAppId(genAppId());
		app.setAppSecret(genAppSecret());
		if(app.getNeedCheckSign()==null) {
			app.setNeedCheckSign(true);
		}
		boolean success=app.save();
		if(success) {
			//添加日志
			addSaveSystemLog(app.getId(), userId, SystemLog.TARGETTYPE_APPLICATION, app.getName());
		}
		return ret(success);
	}
	/**
	 * 生成32位appSecret
	 * @return
	 */
	private String genAppSecret() {
		return Base64Kit.encode(RandomUtil.randomLowWithNumber(32));
	}
	/**
	 * 生成一个appId
	 * @return
	 */
	private String genAppId() {
		String appId="jb"+RandomUtil.randomLowWithNumber(10)+"olt";
		if(exists("app_id", appId)) {
			return genAppId();
		}
		return appId;
	}
	
	
	/**
	 * 更新
	 * @param userId
	 * @param app
	 * @return
	 */
	public Ret update(Integer userId, Application app) {
		if(app==null||notOk(app.getId())||notOk(app.getName())||notOk(app.getType())) {
			return fail(Msg.PARAM_ERROR);
		}
		String name=app.getName().trim();
		if(existsName(name,app.getId())) {
			return fail(Msg.DATA_SAME_NAME_EXIST);
		}
		app.setName(name);
		app.setUpdateUserId(userId);
		boolean success=app.update();
		if(success) {
			//添加日志
			addUpdateSystemLog(app.getId(), userId, SystemLog.TARGETTYPE_APPLICATION, app.getName());
		}
		return ret(success);
	}
	/**
	 * 绑定微信公众平台
	 * @param userId
	 * @param application
	 * @param mpId
	 * @param mpinfoType
	 * @return
	 */
	public Ret submitLinkTargetByWechatMpinfo(Integer userId,Application application, Integer mpId, Integer mpinfoType) {
		if(notOk(mpinfoType)||application==null||notOk(mpId)) {return fail(Msg.PARAM_ERROR);}
		return null;
	}
	/**
	 * 根据微信公众平台类型 选择应用列表
	 * @param wechatMpinfoType
	 * @param keywords
	 * @param pageSize
	 * @return
	 */
	public List<Application> getAutocompleteListByWechatMpinfoType(Integer wechatMpinfoType, String keywords, Integer pageSize) {
		if(notOk(wechatMpinfoType)) {return Collections.emptyList();}
		int appType=0;
		if(wechatMpinfoType.intValue()==WechatMpinfoType.XCX.getValue()) {
			appType=ApplicationType.WECHAT_XCX.getValue();
		}else {
			appType=ApplicationType.MP_H5.getValue();
		}
		Page<Application> pageData=paginateByKeywords("id", "asc", 1, pageSize, keywords, "name,app_id",Kv.by("type", appType));
		return pageData.getList();
	}
	/**
	 * 得到API上专用的数据 去掉一些无用数据
	 * @param appId
	 * @return
	 */
	public Application getApiApplicationByAppId(String appId) {
		Application application=getByAppId(appId);
		if(application==null) {return null;}
		application.removeNullValueAttrs();
		application.remove("brief_info","create_time","update_time","user_id","update_user_id");
		return application;
	}
	/**
	 * 获取关联对象
	 * @param type
	 * @param linkTargetId
	 * @return
	 */
	public JBoltAppLinkTarget getLinkTarget(Integer type, Integer linkTargetId) {
		if(notOk(type)||notOk(linkTargetId)) {return null;}
		ApplicationType  typeEnum=JBoltEnum.getEnumObjectByValue(ApplicationType.class, type);
		JBoltAppLinkTarget jBoltAppLinkTarget=null;
		switch (typeEnum) {
		case WECHAT_XCX:
			jBoltAppLinkTarget=wechatMpinfoService.getAppLinkTargetInfo(linkTargetId);
			break;
		case MP_H5:
			jBoltAppLinkTarget=wechatMpinfoService.getAppLinkTargetInfo(linkTargetId);
			break;
		case ALIPAY_XCX:
			break;
		case BAIDU_XCX:
			break;
		case DOUYIN_XCX:
			break;
		case MOBILE_APP:
			break;
		case MOBILE_H5:
			break;
		case OTHER:
			break;
		case PC_DESKTOP:
			break;
		case PC_WEB:
			break;
		case QQ_XCX:
			break;
		case TOUTIAO_XCX:
			break;
		}
		return jBoltAppLinkTarget;
	}
	/**
	 * 清除关联对象 特殊情况使用 就是他关联的对象找不到了才会出
	 * @param userId
	 * @param linkAppId
	 */
	public Ret removeLinkTarget(Integer userId, Integer id) {
		Application application=findById(id);
		if(application==null) {return fail(Msg.PARAM_ERROR);}
		Integer linkTargetId=application.getLinkTargetId();
		if(notOk(linkTargetId)) {
			return fail("应用尚未关联任何对象");
		}
		application.setLinkTargetId(null);
		boolean success=application.update();
		if(success) {
			addUpdateSystemLog(id, userId, SystemLog.TARGETTYPE_APPLICATION, application.getName(), "，解除了关联的"+application.getTypeName()+"[id:"+linkTargetId+"]");
		}
		return ret(success);
	}
 

}
