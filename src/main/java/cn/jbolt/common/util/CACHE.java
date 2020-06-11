package cn.jbolt.common.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;

import com.jfinal.aop.Aop;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;
import com.jfinal.weixin.sdk.msg.out.OutMsg;

import cn.hutool.core.io.FileUtil;
import cn.jbolt._admin.dictionary.DictionaryService;
import cn.jbolt._admin.dictionary.DictionaryTypeService;
import cn.jbolt._admin.globalconfig.GlobalConfigService;
import cn.jbolt._admin.permission.PermissionService;
import cn.jbolt._admin.role.RoleService;
import cn.jbolt._admin.rolepermission.RolePermissionService;
import cn.jbolt._admin.user.UserService;
import cn.jbolt._admin.userconfig.UserConfigService;
import cn.jbolt.admin.appdevcenter.ApplicationService;
import cn.jbolt.admin.mall.goodscategory.back.GoodsBackCategoryService;
import cn.jbolt.admin.mall.goodstype.GoodsTypeService;
import cn.jbolt.admin.wechat.autoreply.WechatReplyContentService;
import cn.jbolt.admin.wechat.config.WechatConfigService;
import cn.jbolt.admin.wechat.mpinfo.WechatMpinfoService;
import cn.jbolt.admin.wechat.user.WechatUserService;
import cn.jbolt.common.config.GlobalConfigKey;
import cn.jbolt.common.model.Application;
import cn.jbolt.common.model.Dictionary;
import cn.jbolt.common.model.DictionaryType;
import cn.jbolt.common.model.GlobalConfig;
import cn.jbolt.common.model.GoodsBackCategory;
import cn.jbolt.common.model.GoodsType;
import cn.jbolt.common.model.Permission;
import cn.jbolt.common.model.Role;
import cn.jbolt.common.model.User;
import cn.jbolt.common.model.UserConfig;
import cn.jbolt.common.model.WechatMpinfo;
import cn.jbolt.common.model.WechatUser;

/**
 * 全局CACHE操作工具类
 * 
 * @ClassName: CACHE
 * @author: JFinal学院-小木 QQ：909854136
 * @date: 2019年11月13日
 */
public class CACHE extends CacheParaValidator {
	public static final CACHE me = new CACHE();
	public static final String JBOLT_CACHE_NAME = "jbolt_cache";
	public static final String JBOLT_CACHE_DEFAULT_PREFIX = "jbc_";
	public static final String JBOLT_WECAHT_KEYWORDS_CACHE_NAME = "jbolt_cache_wechat_keywords";
	private DictionaryService dictionaryService = Aop.get(DictionaryService.class);
	private DictionaryTypeService dictionaryTypeService = Aop.get(DictionaryTypeService.class);
	private RolePermissionService rolePermissionService = Aop.get(RolePermissionService.class);
	private UserService userService = Aop.get(UserService.class);
	private PermissionService permissionService = Aop.get(PermissionService.class);
	private GlobalConfigService globalConfigService = Aop.get(GlobalConfigService.class);
	private UserConfigService userConfigService = Aop.get(UserConfigService.class);
	private WechatUserService wechatUserService = Aop.get(WechatUserService.class);
	private ApplicationService applicationService = Aop.get(ApplicationService.class);
	private WechatConfigService wechatConfigService = Aop.get(WechatConfigService.class);
	private WechatMpinfoService wechatMpinfoService = Aop.get(WechatMpinfoService.class);
	private WechatReplyContentService wechatReplyContentService = Aop.get(WechatReplyContentService.class);
	private GoodsBackCategoryService goodsBackCategoryService = Aop.get(GoodsBackCategoryService.class);
	private RoleService roleService = Aop.get(RoleService.class);
	private GoodsTypeService goodsTypeService = Aop.get(GoodsTypeService.class);
	 
	private String buildCacheKey(String pre,Object value) {
		return JBOLT_CACHE_DEFAULT_PREFIX+pre+value.toString();
	}
	/**
	 * 缓存通过ID获得GoodsBackCategory数据
	 * 
	 * @param id
	 * @return
	 */
	public GoodsBackCategory getGoodsBackCategory(Object id) {
		return goodsBackCategoryService.findById(id);
	}

	/**
	 * cache中获取商品后台分类的名称
	 * 
	 * @param id
	 * @return
	 */
	public String getGoodsBackCategoryName(Object id) {
		GoodsBackCategory goodsBackCategory = getGoodsBackCategory(id);
		return goodsBackCategory == null ? "" : goodsBackCategory.getName();
	}

	/**
	 * cache中获取商品后台分类的唯一标识KEY
	 * 
	 * @param id
	 * @return
	 */
	public String getGoodsBackCategoryKey(Object id) {
		GoodsBackCategory goodsBackCategory = getGoodsBackCategory(id);
		return goodsBackCategory == null ? null : goodsBackCategory.getCategoryKey();
	}

	/**
	 * 
	 * @param id
	 * @return
	 */
	public String getGoodsBackCategoryFullName(Object id) {
		GoodsBackCategory goodsCategory = getGoodsBackCategory(id);
		if (goodsCategory == null) {
			return "";
		}
		String keys = goodsCategory.getCategoryKey();
		if (StrKit.isBlank(keys)) {
			return "";
		}
		if (keys.indexOf("_") == -1) {
			return goodsCategory.getName();
		}
		Integer[] ids = ArrayUtil.toInt(keys, "_");
		if (ids == null || ids.length == 0) {
			return "";
		}
		String fullName = "";
		for (int i = 0; i < ids.length; i++) {
			String name = getGoodsBackCategoryName(ids[i]);
			if (StrKit.notBlank(name)) {
				if (i == 0) {
					fullName = name;
				} else {
					fullName = fullName + " > " + name;
				}
			}
		}
		return fullName;
	}

	/**
	 * 缓存通过ID获得角色Role数据
	 * 
	 * @param id
	 * @return
	 */
	public Role getRole(Object id) {
		return roleService.findById(id);
	}

	/**
	 * 缓存通过ID获得数据的
	 * 
	 * @param id
	 * @return
	 */
	public String getRoleName(Object id) {
		Role role = getRole(id);
		return role == null ? "未分配" : role.getName();
	}

	/**
	 * 从缓存获取多个names
	 * 
	 * @param ids
	 * @return
	 */
	public List<Role> getRoles(String roles) {
		if (StrKit.isBlank(roles)) {
			return Collections.emptyList();
		}
		Integer[] roleIds = ArrayUtil.toDisInt(roles, ",");
		if (roleIds == null || roleIds.length == 0) {
			return Collections.emptyList();
		}
		List<Role> roleList = new ArrayList<Role>();
		Role role = null;
		for (Integer roleId : roleIds) {
			role = getRole(roleId);
			if (role != null) {
				roleList.add(role);
			}
		}

		return roleList;
	}

	/**
	 * 通过ID获得字典数据类型
	 * 
	 * @return
	 */
	public DictionaryType getDictionaryType(Object id) {
		return dictionaryTypeService.findById(id);
	}
	/**
	 * 通过typeKey获得字典数据类型
	 * 
	 * @return
	 */
	public DictionaryType getDictionaryTypeByKey(String typeKey) {
		return dictionaryTypeService.getCacheByKey(typeKey);
	}

	/**
	 * 获得字典数据类型的标识Key
	 * 
	 * @param id
	 * @return
	 */
	public String getDictionaryTypeName(Object id) {
		DictionaryType dictionaryType = getDictionaryType(id);
		return dictionaryType == null ? "" : dictionaryType.getName();
	}

	/**
	 * 获得字典数据类型的标识Key
	 * 
	 * @param id
	 * @return
	 */
	public String getDictionaryTypeKey(Object id) {
		DictionaryType dictionaryType = getDictionaryType(id);
		return dictionaryType == null ? "" : dictionaryType.getTypeKey();
	}

	/**
	 * 获得字典数据类型的ModelLevel 层级模式
	 * 
	 * @param id
	 * @return
	 */
	public int getDictionaryTypeModeLevel(Object id) {
		DictionaryType dictionaryType = getDictionaryType(id);
		return dictionaryType == null ? 0 : dictionaryType.getModeLevel();
	}

	/**
	 * 通过Sn获得字典数据
	 * @param typeKey
	 * @param sn
	 * @return
	 */
	public Dictionary getDictionaryBySn(String typeKey,String sn) {
		return dictionaryService.getCacheByKey(sn, typeKey);
	}
	/**
	 * 通过ID获得字典数据
	 * 
	 * @return
	 */
	public Dictionary getDictionary(Object id) {
		return dictionaryService.findById(id);
	}

	/**
	 * 获得字典数据名称
	 * 
	 * @param id
	 * @return
	 */
	public String getDictionaryName(Object id) {
		Dictionary dictionary = getDictionary(id);
		return dictionary == null ? "" : dictionary.getName();
	}
	/**
	 * 获得字典数据名称 根据类型key和编号sn查询cache
	 * @param typeKey
	 * @param sn
	 * @return
	 */
	public String getDictionaryNameBySn(String typeKey , String sn) {
		Dictionary dictionary = getDictionaryBySn(typeKey, sn);
		return dictionary == null ? "" : dictionary.getName();
	}

	/**
	 * 获得用户姓名
	 * 
	 * @param id
	 * @return
	 */
	public String getUserName(Object id) {
		User user = getUser(id);
		return user == null ? "" : user.getName();
	}
	/**
	 * 获得用户用户名
	 * 
	 * @param id
	 * @return
	 */
	public String getUserUsername(Object id) {
		User user = getUser(id);
		return user == null ? "" : user.getUsername();
	}

	/**
	 * 获得用户头像
	 * 
	 * @param id
	 * @return
	 */
	public String getUserAvatar(Object id) {
		User user = getUser(id);
		return user == null ? "" : user.getAvatar();
	}

	/**
	 * 获得用户头像
	 * 
	 * @param id
	 * @return
	 */
	public String getUserRealAvatar(Object id) {
		User user = getUser(id);
		return user == null ? "" : RealUrlUtil.getImage(user.getAvatar(), "assets/img/avatar.jpg");
	}

	/**
	 * 通过ID获得User
	 * 
	 * @return
	 */
	public User getUser(Object id) {
		return userService.findById(id);
	}

	/**
	 * 缓存通过ID获得角色Role的permissionsKeySet
	 * 
	 * @param roleIds
	 * @return
	 */
	public Set<String> getRolePermissionKeySet(String roleIds) {
		if (StrKit.isBlank(roleIds)) {
			return null;
		}
		return CacheKit.get(JBOLT_CACHE_NAME, buildCacheKey("roles_permission_keyset_" , roleIds), new IDataLoader() {
			@Override
			public Object load() {
				return rolePermissionService.getPermissionsKeySetByRoles(roleIds);
			}
		});
	}

	/**
	 * 缓存通过User ID获得角色Role的permissions
	 * 
	 * @param userId
	 * @return
	 */
	public List<Permission> getUserMenus(Integer userId) {
		User user = getUser(userId);
		if (user == null) {
			return Collections.emptyList();
		}
		if (user.getIsSystemAdmin()) {
			return getRoleMenusWithSystemAdminDefault(user.getRoles());
		}
		return getRoleMenus(user.getRoles());
	}

	public List<Permission> getRoleMenus(String roleIds) {
		if (StrKit.isBlank(roleIds)) {
			return null;
		}
		return CacheKit.get(JBOLT_CACHE_NAME, buildCacheKey("roles_menus_" , roleIds), new IDataLoader() {
			@Override
			public Object load() {
				return permissionService.getMenusByRoles(roleIds);
			}
		});

	}

	public List<Permission> getRoleMenusWithSystemAdminDefault(String roleIds) {
		return CacheKit.get(JBOLT_CACHE_NAME,
				buildCacheKey("roles_menus_with_sadmindefault_" , (StrKit.isBlank(roleIds) ? "null" : roleIds)),
				new IDataLoader() {
					@Override
					public Object load() {
						return permissionService.getMenusByRolesWithSystemAdminDefault(roleIds);
					}
				});

	}

	/**
	 * 通过ID获得Permissions
	 * 
	 * @return
	 */
	public Permission getPermission(Object id) {
		return permissionService.findById(id);
	}

	/**
	 * 通过permissionKey获得Permissions
	 * 
	 * @return
	 */
	public Permission getPermissionByKey(String permissionKey) {
		return permissionService.getCacheByKey(permissionKey);
	}

	public void removeMenusAndPermissionsByRoleGroups() {
		List<String> roleGroups = userService.getAllRoleGroups();
		if (roleGroups.size() > 0) {
			roleGroups.forEach(new Consumer<String>() {
				@Override
				public void accept(String roleIds) {
					removeRolesPermissionKeySet(roleIds);
					removeRolesMenus(roleIds);
					removeRolesMenusWithSystemAdminDefault(roleIds);
				}
			});
		}
	}

	
	/**
	 * 删除removeRolesPermissionKeySet
	 * 
	 * @param roleIds
	 */
	public void removeRolesPermissionKeySet(String roleIds) {
		if (StrKit.notBlank(roleIds)) {
			CacheKit.remove(JBOLT_CACHE_NAME, buildCacheKey("roles_permission_keyset_",roleIds));
		}
	}


	/**
	 * 删除removeRoleMenus
	 * 
	 * @param roleIds
	 */
	public void removeRolesMenus(String roleIds) {
		if (StrKit.notBlank(roleIds)) {
			CacheKit.remove(JBOLT_CACHE_NAME, buildCacheKey("roles_menus_" ,roleIds));
		}
	}

	/**
	 * 删除removeRolesMenusWithSystemAdminDefault
	 * 
	 * @param roleIds
	 */
	public void removeRolesMenusWithSystemAdminDefault(String roleIds) {
		CacheKit.remove(JBOLT_CACHE_NAME,
				buildCacheKey("roles_menus_with_sadmindefault_" , (StrKit.isBlank(roleIds) ? "null" : roleIds)));
	}

	/**
	 * put
	 * 
	 * @param key
	 * @param value
	 */
	public void put(String key, Object value) {
		CacheKit.put(JBOLT_CACHE_NAME, key, value);
	}
	/**
	 * 得到全局配置JFinalActionReport输出位置
	 * @return
	 */
	public String getJFinalActionReportWriter() {
		String value=getGlobalConfigValue(GlobalConfigKey.JBOLT_ACTION_REPORT_WRITER);
		return StrKit.isBlank(value)?"sysout":value;
	}
	/**
	 * 得到全局配置Jbolt auto cache log 是否启用
	 * @return
	 */
	public boolean getJBoltAutoCacheLog() {
		String value=getGlobalConfigValue(GlobalConfigKey.JBOLT_AUTO_CACHE_LOG);
		if(StrKit.isBlank(value)) {return false;}
		return Boolean.parseBoolean(value);
	}
	/**
	 * 得到全局配置assets version
	 * @return
	 */
	public String getAssetsVersion() {
		String value=getGlobalConfigValue(GlobalConfigKey.ASSETS_VERSION);
		if(StrKit.isBlank(value)) {
			globalConfigService.changeAssetsVersion();
			value=getGlobalConfigValue(GlobalConfigKey.ASSETS_VERSION);
		}
		return value;
	}
	/**
	 * 得到全局配置SYSTEM_ADMIN_H50
	 * @return
	 */
	public boolean getSystemAdminH50() {
		String value=getGlobalConfigValue(GlobalConfigKey.SYSTEM_ADMIN_H50);
		if(StrKit.isBlank(value)) {return false;}
		return Boolean.parseBoolean(value);
	}
	/**
	 * 得到全局配置SYSTEM_ADMIN_NAV_MENU_DEFAULT_ICON
	 * @return
	 */
	public String getSystemAdminNavMenuDefaultIcon() {
		String value=getGlobalConfigValue(GlobalConfigKey.SYSTEM_ADMIN_NAV_MENU_DEFAULT_ICON);
		return StrKit.isBlank(value)?"":value;
	}
	/**
	 * 得到全局配置SYSTEM_ADMIN_GLOBAL_SEARCH_SHOW
	 * @return
	 */
	public boolean getSystemAdminGlobalSearchShow() {
		String value=getGlobalConfigValue(GlobalConfigKey.SYSTEM_ADMIN_GLOBAL_SEARCH_SHOW);
		if(StrKit.isBlank(value)) {return false;}
		return Boolean.parseBoolean(value);
	}
	/**
	 * 缓存通过key获取全局配置
	 * 
	 * @param configKey
	 * @return
	 */
	public GlobalConfig getGlobalConfig(String configKey) {
		return globalConfigService.getCacheByKey(configKey);
	}

	/**
	 * 缓存通过key获取配置的值
	 * 
	 * @param key
	 * @return
	 */
	public String getGlobalConfigValue(String configKey) {
		GlobalConfig globalConfig = getGlobalConfig(configKey);
		if(globalConfig==null) {
			int userId=1;
			User user=userService.getOneSystemAdmin();
			if(user!=null) {
				userId=user.getId();
			}
			globalConfigService.checkAndInitConfig(userId, configKey);
			globalConfig = getGlobalConfig(configKey);
		}
		return globalConfig == null ? "" : globalConfig.getConfigValue();
	}

	/**
	 * 获取微信公众号服务器配置根地址URL
	 * 
	 * @return
	 */
	public String getWechatMpServerDomainRootUrl() {
		return getGlobalConfigValue(GlobalConfigKey.WECHAT_MP_SERVER_DOMAIN);
	}

	/**
	 * 获取微信小程序服务器配置根地址URL
	 * 
	 * @return
	 */
	public String getWechatWxaServerDomainRootUrl() {
		return getGlobalConfigValue(GlobalConfigKey.WECHAT_WXA_SERVER_DOMAIN);
	}

	/**
	 * 获取登录是否启用验证码
	 * 
	 * @return
	 */
	public boolean isJBoltLoginUseCapture() {
		GlobalConfig config = getGlobalConfig(GlobalConfigKey.JBOLT_LOGIN_USE_CAPTURE);
		if (config == null) {
			return true;
		}
		return Boolean.parseBoolean(config.getConfigValue());
	}

	/**
	 * 通过id获得goodsType
	 * 
	 * @return
	 */
	public GoodsType getGoodsType(Object id) {
		return goodsTypeService.findById(id);
	}

	/**
	 * 缓存通过mpId获得微信公众平台WechatConfig AppId
	 * 
	 * @param mpId
	 * @return
	 */
	public String getWechatConfigAppId(Object mpId) {
		if (mpId == null ||StrKit.isBlank(mpId.toString()) || (mpId instanceof Integer&& Integer.parseInt(mpId.toString()) <= 0)) {
			return null;
		}
		return CacheKit.get(JBOLT_CACHE_NAME, buildCacheKey("mpId_AppId_" , mpId), new IDataLoader() {
			@Override
			public Object load() {
				return wechatConfigService.getWechatConfigAppId(mpId);
			}
		});
	}

	/**
	 * 删除微信公众平台的基础配置wechatConfig AppId
	 * 
	 * @param mpId
	 */
	public void removeWechatConfigAppId(Integer mpId) {
		if (mpId != null && mpId > 0) {
			CacheKit.remove(JBOLT_CACHE_NAME, buildCacheKey("mpId_AppId_" , mpId));
		}
	}

	/**
	 * 从cache获取到公众平台默认回复
	 * 
	 * @return
	 */
	public OutMsg getWechcatDefaultOutMsg(String appId, String openId) {
		if (StrKit.isBlank(appId)) {
			return null;
		}
		return CacheKit.get(JBOLT_CACHE_NAME, buildCacheKey("mpaureply_defaultmsg_" , appId), new IDataLoader() {
			@Override
			public Object load() {
				return wechatReplyContentService.getWechcatDefaultOutMsg(appId, openId);
			}
		});
	}


	/**
	 * 从cache获取到公众平台关注回复
	 * 
	 * @param appId
	 * @param openId
	 * @return
	 */
	public OutMsg getWechcatSubscribeOutMsg(String appId, String openId) {
		if (StrKit.isBlank(appId)) {
			return null;
		}
		return CacheKit.get(JBOLT_CACHE_NAME, buildCacheKey("mpaureply_subscribemsg_" , appId), new IDataLoader() {
			@Override
			public Object load() {
				return wechatReplyContentService.getWechcatSubscribeOutMsg(appId, openId);
			}
		});
	}

	/**
	 * 删除微信公众平台默认自动回复消息
	 * 
	 * @param mpId
	 */
	public void removeWechcatDefaultOutMsg(Integer mpId) {
		removeWechcatDefaultOutMsg(getWechatConfigAppId(mpId));
	}

	/**
	 * 删除微信公众平台关注自动回复消息
	 * 
	 * @param mpId
	 */
	public void removeWechcatSubscribeOutMsg(Integer mpId) {
		removeWechcatSubscribeOutMsg(getWechatConfigAppId(mpId));
	}

	/**
	 * 删除微信公众平台关注自动回复消息
	 * 
	 * @param mpId
	 */
	public void removeWechcatSubscribeOutMsg(String appId) {
		if (StrKit.notBlank(appId)) {
			CacheKit.remove(JBOLT_CACHE_NAME, buildCacheKey("mpaureply_subscribemsg_" , appId));
		}
	}

	/**
	 * 删除微信公众平台默认自动回复消息
	 * 
	 * @param appId
	 */
	public void removeWechcatDefaultOutMsg(String appId) {
		if (StrKit.notBlank(appId)) {
			CacheKit.remove(JBOLT_CACHE_NAME, buildCacheKey("mpaureply_defaultmsg_" , appId));
		}
	}

	/**
	 * 获取Jbolt style的样式设置
	 * 
	 * @param userId
	 * @return
	 */
	public String getUserJboltStyle(Integer userId) {
		if(notOk(userId)) {
			return getJboltStyle();
		}
		String jboltStyle = getUserConfigValue(userId, GlobalConfigKey.JBOLT_ADMIN_STYLE);
		if (StrKit.isBlank(jboltStyle)) {
			return getJboltStyle();
		}
		return jboltStyle;
	}

	/**
	 * 获取Jbolt style的样式设置
	 * 
	 * @return
	 */
	public String getJboltStyle() {
		String jboltStyle = getGlobalConfigValue(GlobalConfigKey.JBOLT_ADMIN_STYLE);
		if (StrKit.isBlank(jboltStyle)) {
			jboltStyle = "default";
		}
		return jboltStyle;
	}
	
	/**
	 * 获取Jbolt 登录背景图配置
	 * 
	 * @return
	 */
	public String getJboltLoginBgimg() {
		String jboltLoginBgimg = getGlobalConfigValue(GlobalConfigKey.JBOLT_LOGIN_BGIMG);
		if (StrKit.isBlank(jboltLoginBgimg)) {
			jboltLoginBgimg = "assets/css/img/login_bg.jpg";
		}else if(jboltLoginBgimg.charAt(0)=='/'){
			jboltLoginBgimg=jboltLoginBgimg.substring(1);
		}
		return jboltLoginBgimg;
	}
	/**
	 * 获取Jbolt 登录背景类型
	 * 
	 * @return
	 */
	public String getJboltLoginBgType() {
		String jboltLoginBgimg = getGlobalConfigValue(GlobalConfigKey.JBOLT_LOGIN_BGIMG);
		if (StrKit.isBlank(jboltLoginBgimg)) {
			jboltLoginBgimg = "assets/css/img/login_bg.jpg";
		}else if(jboltLoginBgimg.charAt(0)=='/'){
			jboltLoginBgimg=jboltLoginBgimg.substring(1);
		}
		String extname=FileUtil.extName(jboltLoginBgimg);
		String type="img";
		switch (extname) {
			case "jpg":
				type="img";
				break;
			case "png":
				type="img";
				break;
			case "gif":
				type="img";
				break;
			case "webp":
				type="img";
				break;
			case "mp4":
				type="video";
				break;
			case "webm":
				type="video";
				break;
		}
		return type;
	}

	/**
	 * 获取Jbolt 登录线条特效配置
	 * 
	 * @return
	 */
	public boolean getJboltLoginNest() {
		String value = getGlobalConfigValue(GlobalConfigKey.JBOLT_LOGIN_NEST);
		return  StrKit.notBlank(value) && value.toLowerCase().trim().equals("true");
	}

	/**
	 * 根据AppId获得属于哪个MpId
	 * 
	 * @param appId
	 * @return
	 */
	public Integer getWechatMpidByAppId(String appId) {
		if (StrKit.isBlank(appId)) {
			return null;
		}
		return CacheKit.get(JBOLT_CACHE_NAME, buildCacheKey("mpid_by_appid_" , appId), new IDataLoader() {
			@Override
			public Object load() {
				return wechatConfigService.getWechatMpidByAppId(appId);
			}
		});
	}
	/**
	 * 通过ID获取wechatMpInfo
	 * @param id
	 * @return
	 */
	public WechatMpinfo getWechatMpInfo(Object id) {
		return wechatMpinfoService.findById(id);
	}

	/**
	 * 删除appId对应mpId的缓存数据
	 * 
	 * @param appId
	 */
	public void removeMpidByAppId(String appId) {
		if (StrKit.notBlank(appId)) {
			CacheKit.remove(JBOLT_CACHE_NAME, buildCacheKey("mpid_by_appid_" , appId));
		}
	}

	/**
	 * 得到Jbolt默认后台是不是多选项卡风格 全局配置
	 * 
	 * @return
	 */
	public boolean getJBoltAdminWithTabs() {
		String value = getGlobalConfigValue(GlobalConfigKey.JBOLT_ADMIN_WITH_TABS);
		return StrKit.notBlank(value) && value.toLowerCase().trim().equals("true");
	}

	/**
	 * 得到Jbolt默认后台是不是多选项卡风格 用户配置
	 * 
	 * @return
	 */
	public boolean getUserJBoltAdminWithTabs(Integer userId) {
		if(notOk(userId)) {
			return getJBoltAdminWithTabs();
		}
		String value = getUserConfigValue(userId, GlobalConfigKey.JBOLT_ADMIN_WITH_TABS);
		if (StrKit.isBlank(value)) {
			return getJBoltAdminWithTabs();
		}
		return value.toLowerCase().trim().equals("true");
	}

	/**
	 * 得到Jbolt登录页面是否启用透明玻璃风格 全局配置
	 * 
	 * @return
	 */
	public boolean getJBoltLoginFormStyleGlass() {
		String value = getGlobalConfigValue(GlobalConfigKey.JBOLT_LOGIN_FORM_STYLE_GLASS);
		return StrKit.notBlank(value) && value.toLowerCase().trim().equals("true");
	}

	/**
	 * 得到Jbolt登录页面是否启用透明玻璃风格 用户配置
	 * 
	 * @return
	 */
	public boolean getUserJBoltLoginFormStyleGlass(Integer userId) {
		if(notOk(userId)) {
			return getJBoltLoginFormStyleGlass();
		}
		String value = getUserConfigValue(userId, GlobalConfigKey.JBOLT_LOGIN_FORM_STYLE_GLASS);
		if (StrKit.isBlank(value)) {
			return getJBoltLoginFormStyleGlass();
		}
		return value.toLowerCase().trim().equals("true");
	}

	/**
	 * 得到Jbolt登录页面是否启用背景图模糊 全局配置
	 * 
	 * @return
	 */
	public boolean getJBoltLoginBgimgBlur() {
		String value = getGlobalConfigValue(GlobalConfigKey.JBOLT_LOGIN_BGIMG_BLUR);
		return StrKit.notBlank(value) && value.toLowerCase().trim().equals("true");
	}

	/**
	 * 得到Jbolt登录页面是否启用线条特效 用户配置
	 * 
	 * @return
	 */
	public boolean getUserJBoltLoginNest(Integer userId) {
		if(notOk(userId)) {
			return getJboltLoginNest();
		}
		String value = getUserConfigValue(userId, GlobalConfigKey.JBOLT_LOGIN_NEST);
		if (StrKit.isBlank(value)) {
			return getJboltLoginNest();
		}
		return value.toLowerCase().trim().equals("true");
	}
	
	/**
	 * 得到Jbolt登录页面是否启用背景图模糊 用户配置
	 * 
	 * @return
	 */
	public boolean getUserJBoltLoginBgimgBlur(Integer userId) {
		if(notOk(userId)) {
			return getJBoltLoginBgimgBlur();
		}
		String value = getUserConfigValue(userId, GlobalConfigKey.JBOLT_LOGIN_BGIMG_BLUR);
		if (StrKit.isBlank(value)) {
			return getJBoltLoginBgimgBlur();
		}
		return value.toLowerCase().trim().equals("true");
	}

	/**
	 * 通过AppId 获取Application
	 * 
	 * @param appId
	 * @return
	 */
	public Application getApplicationByAppId(String appId) {
		return applicationService.getCacheByKey(appId);
	}
	/**
	 * 通过AppId 获取Application调用接口的Application
	 * 有一定阉割 只需要部分字段的
	 * @param appId
	 * @return
	 */
	public Application getApiCallApplication(String appId) {
		if (StrKit.isBlank(appId)) {
			return null;
		}
		return CacheKit.get(JBOLT_CACHE_NAME, buildCacheKey("api_application_appid_" , appId), new IDataLoader() {
			@Override
			public Object load() {
				return applicationService.getApiApplicationByAppId(appId);
			}
		});
	}
	/**
	 * 根据APPID删除Api专用Application的换缓存
	 * @param appId
	 */
	public void removeApiCallApplication(String appId) {
		if (StrKit.notBlank(appId)) {
			CacheKit.remove(JBOLT_CACHE_NAME, buildCacheKey("api_application_appid_" , appId));
		}
	}
	
	/**
	 * 通过id 获取Application
	 * 
	 * @param id
	 * @return
	 */
	public Application getApplication(Object id) {
		return applicationService.findById(id);
	}
	
	/**
	 * 通过id 获取Application attr
	 * 
	 * @param id
	 * @return
	 */
	public <T> T getApplicationAttr(Object id,String attrName) {
		Application application=getApplication(id);
		return application==null?null:application.get(attrName);
	}
	
	/**
	 * 通过id 获取Application name
	 * @param id
	 * @return
	 */
	public String getApplicationName(Object id) {
		return getApplicationAttr(id, "name");
	}


	/**
	 * 缓存通过key获取用户配置
	 * 
	 * @param key
	 * @return
	 */
	public UserConfig getUserConfig(Integer userId, String configKey) {
		return userConfigService.getCacheByKey(configKey, userId);
	}

	
	/**
	 * 缓存通过key获取用户个性化配置的值
	 * 
	 * @param key
	 * @return
	 */
	public String getUserConfigValue(Integer userId, String configKey) {
		UserConfig userConfig = getUserConfig(userId, configKey);
		return userConfig == null ? "" : userConfig.getConfigValue();
	}
	
	/**
	 * 根据mpid和openId拿到wechat用户信息 api专用
	 * @param mpId
	 * @param openId
	 * @return
	 */
	public WechatUser getApiWechatUserByMpOpenId(Object mpId, String openId) {
		if (mpId==null||StrKit.isBlank(openId)) {
			return null;
		}
		return CacheKit.get(JBOLT_CACHE_NAME, buildCacheKey("api_wechat_user_openid_" ,mpId.toString()+"_"+openId), new IDataLoader() {
			@Override
			public Object load() {
				return wechatUserService.getApiWechatUserByOpenId(mpId,openId);
			}
		});
	}
	
	/**
	 * 根据mpid和openId删除wechat用户信息 api专用
	 * @param mpId
	 * @param appId
	 */
	public void removeApiWechatUserByMpOpenId(Object mpId, String openId) {
		if (mpId!=null&&StrKit.notBlank(openId)) {
			CacheKit.remove(JBOLT_CACHE_NAME, buildCacheKey("api_wechat_user_openid_" ,mpId.toString()+"_"+openId));
		}
	}
	
	/**
	 * 得到全局配置SYSTEM_NAME
	 * @return
	 */
	public String getSystemName(String defaultName) {
		String value=getGlobalConfigValue(GlobalConfigKey.SYSTEM_NAME);
		if(StrKit.isBlank(value)) {return StrKit.isBlank(defaultName)?"JBolt极速开发平台":defaultName;}
		if(value.indexOf(":")!=-1) {
			String[] nameArr=value.split(":");
			return (nameArr!=null&&nameArr.length==2)?nameArr[0]:"JBolt极速开发平台";
		}
		return value;
	}
	/**
	 * 得到全局配置SYSTEM_NAME的color值
	 * @return
	 */
	public String getSystemNameColor(String defaultColor) {
		String value=getGlobalConfigValue(GlobalConfigKey.SYSTEM_NAME);
		if(StrKit.isBlank(value)) {return StrKit.isBlank(defaultColor)?"#FFFFFF":defaultColor;}
		if(value.indexOf(":")!=-1) {
			String[] nameArr=value.split(":");
			return (nameArr!=null&&nameArr.length==2)?nameArr[1]:"#FFFFFF";
		}
		return "#FFFFFF";
	}
	/**
	 * 通过用户名 拿到用户信息
	 * @param username
	 * @return
	 */
	public User getUserByUsername(String username) {
		User user=userService.getCacheByKey(username);
		if(user!=null) {
			user.removeNullValueAttrs().remove("password");
		}
		return user;
	}
	/**
	 * 用过用户名拿到用户ID
	 * @param username
	 * @return
	 */
	public Object getUserIdByUsername(String username) {
		User user=getUserByUsername(username);
		return user==null?null:user.getId();
	}
	
}
