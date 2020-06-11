package cn.jbolt.base.api;

import com.jfinal.kit.Ret;

import cn.jbolt.common.model.Application;

/**
 * JBolt Api应用开发中心 调用返回值
 * @ClassName:  ApiMsg   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月15日   
 */
@SuppressWarnings("serial")
public class JBoltApiRet extends Ret{
	/**
	 * 返回请求Header中未设置jbolt_appId
	 * code:4001
	 */
	public static final JBoltApiRet NO_JBOLT_APPID=JBoltApiRet.fail(4001,"请在Request的Header未设置[jboltappid]");
	/**
	 * appId校验参数异常
	 * code:4002
	 */
	public static final JBoltApiRet APPID_CHECK_ERROR=JBoltApiRet.fail(4002,"appId校验参数异常");
	/**
	 * jwt signature校验失败
	 * @param application
	 * code:4003
	 */
	public static JBoltApiRet SIGNATURE_CHECK_FAILED(Application application) {
		return JBoltApiRet.fail(4003,String.format("jwt signature校验失败:[%s(%s)]",application.getName(),application.getId()));
	}
	/**
	 * jwt为空
	 * code：4004
	 */
	public static final JBoltApiRet NO_JBOLT_JWT = JBoltApiRet.fail(4004,"jwt为空");
	/**
	 * jwt 过期
	 * code：4005
	 */
	public static final JBoltApiRet JWT_IS_EXPIRED = JBoltApiRet.fail(4005,"jwt已过期");
	/**
	 * 跨域options请求成功处理返回值
	 */
	public static final Ret OPTIONS=JBoltApiRet.ok("OPTIONS", 1);
	/**
	 * 返回请求Application不存在信息
	 * code:4006
	 * @param appId
	 * @return
	 */
	public static JBoltApiRet APPLICATION_NOT_EXIST(String appId) {
		return JBoltApiRet.fail(4006,String.format("请求的Application不存在:[%s]",appId));
	}
	/**
	 * 返回application未开放信息
	 * code:4007
	 * @param appId
	 * @param name
	 * @return
	 */
	public static JBoltApiRet APPLICATION_NOT_ENABLE(Application application) {
		return JBoltApiRet.fail(4007,String.format("请求的Application未开放:[%s(%s)]", application.getName(),application.getId()));
	}
	
	/**
	 * 解析JWT 失败
	 * code:4008
	 * @param location
	 * @param application
	 * @param msg
	 * @return
	 */
	public static JBoltApiRet JWT_PARSE_FAIL(int location,Application application,String msg) {
		return JBoltApiRet.fail(4008,String.format("解析JWT失败-%d:[%s(%s)] %s", location,application.getName(),application.getAppId(),msg==null?"":msg));
	}
	
	/**
	 * 解析JWT 失败
	 * code：4008
	 * @param location
	 * @param application
	 * @return
	 */
	public static JBoltApiRet JWT_PARSE_FAIL(int location,Application application) {
		return JWT_PARSE_FAIL(location, application, null);
	}
	
	/**
	 * HTTP请求的Method不合法
	 * code:4009
	 */
	public static final JBoltApiRet HTTP_METHOD_ERROR=JBoltApiRet.fail(4009,"HTTP请求的Method不合法");
	
	
	
	/**
	 * 应用尚未关联任何微信小程序
	 * code：4010
	 * @param application
	 * @return
	 */
	public static JBoltApiRet APP_NOT_LINK_WECHAT_XCX(Application application) {
		return JBoltApiRet.fail(4010,String.format("应用尚未关联任何微信小程序:[%s(%s)]",application.getName(),application.getId()));
	}
	/**
	 * 登录失败,code为空
	 * code：4011
	 * @param application
	 * @return
	 */
	public static JBoltApiRet WX_LOGIN_CODE_NULL(Application application) {
		return JBoltApiRet.fail(4011,String.format("wxLogin-code为空:[%s(%s)]",application.getName(),application.getId()));
	}
	/**
	 * 微信小程序状态已禁用
	 * code：4012
	 * @param application
	 * @return
	 */
	public static JBoltApiRet WECHAT_XCX_DISABLED(Application application) {
		return JBoltApiRet.fail(4012,String.format("微信小程序状态已禁用:[%s(%s)]",application.getName(),application.getId()));
	}
	/**
	 * 系统内微信小程序配置异常
	 * code：4013
	 * @param application
	 * @return
	 */
	public static JBoltApiRet WECHAT_XCX_CONFIG_ERROR(Application application) {
		return JBoltApiRet.fail(4013,String.format("系统内微信小程序配置异常:[%s(%s)]",application.getName(),application.getId()));
	}
	/**
	 * 无法创建微信小程序用户
	 * code：4014
	 * @param application
	 * @return
	 */
	public static JBoltApiRet WECHAT_XCX_USER_CREATE_FAIL(Application application) {
		return JBoltApiRet.fail(4014,String.format("无法创建微信小程序用户:[%s(%s)]",application.getName(),application.getId()));
	}
	/**
	 * 微信小程序用户授权获取信息失败
	 * code：4015
	 * @param application
	 * @return
	 */
	public static JBoltApiRet WECHAT_XCX_GETUSERINFO_FAIL(Application application) {
		return JBoltApiRet.fail(4015,String.format("微信小程序授权获取用户信息失败:[%s(%s)]",application.getName(),application.getId()));
	}
	/**
	 * 微信小程序校验用户授权信息-不完整
	 * code：4016
	 * @param application
	 * @return
	 */
	public static JBoltApiRet WECHAT_XCX_CHECK_USER_INFO_FAIL(Application application) {
		return JBoltApiRet.fail(4016,String.format("微信小程序校验用户授权信息-不完整:[%s(%s)]",application.getName(),application.getId()));
	}
	
	/**
	 * 微信小程序用户授权解密敏感信息失败
	 * code：4017
	 * @param application
	 * @return
	 */
	public static JBoltApiRet WECHAT_XCX_DECRYPTUSERINFO_FAIL(Application application) {
		return JBoltApiRet.fail(4017,String.format("微信小程序用户授权解密敏感信息失败:[%s(%s)]",application.getName(),application.getId()));
	}
	/**
	 * 微信小程序用户授权后信息更新失败
	 * code：4018
	 * @param application
	 * @return
	 */
	public static JBoltApiRet WECHAT_XCX_UPDATE_USERINFO_FAIL(Application application,String appendMsg) {
		return JBoltApiRet.fail(4018,String.format("微信小程序用户授权后信息更新失败:[%s(%s)]\n原因：%s",application.getName(),application.getId(),appendMsg==null?"未知":appendMsg));
	}
	/**
	 * 微信小程序绑定用户参数异常
	 * code：4019
	 * @param application
	 * @return
	 */
	public static JBoltApiRet WECHAT_XCX_BINDUSER_PARAM_ERROR(Application application) {
		return JBoltApiRet.fail(4019,String.format("微信小程序绑定用户参数异常:[%s(%s)]",application.getName(),application.getId()));
	}
	/**
	 * 微信小程序绑定用户失败
	 * code：4020
	 * @param application
	 * @return
	 */
	public static JBoltApiRet WECHAT_XCX_BINDUSER_ERROR(Application application) {
		return JBoltApiRet.fail(4020,String.format("微信小程序绑定用户失败:[%s(%s)]",application.getName(),application.getId()));
	}
	/**
	 * 微信小程序绑定用户失败
	 * code：4021
	 * @param application
	 * @param userType
	 * @return
	 */
	public static JBoltApiRet WECHAT_XCX_BINDUSER_NO_USER(Application application,String userType) {
		return JBoltApiRet.fail(4021,String.format("微信小程序绑定用户失败,原因：%s数据不存在！:[%s(%s)]",userType,application.getName(),application.getId()));
	}
	/**
	 * 微信小程序绑定用户失败 更新信息失败
	 * code：4022
	 * @param application
	 * @param userType
	 * @return
	 */
	public static JBoltApiRet WECHAT_XCX_BINDUSER_UPDATE_ERROR(Application application,String userType) {
		return JBoltApiRet.fail(4022,String.format("微信小程序绑定%s失败,原因：更新绑定信息发生异常！:[%s(%s)]",userType,application.getName(),application.getId()));
	}
	/**
	 * 微信小程序绑定用户失败  已经存在同类型
	 * code：4023
	 * @param application
	 * @param userType
	 * @return
	 */
	public static JBoltApiRet WECHAT_XCX_BINDUSER_SAMETYPE_EXIST(Application application,String userType) {
		return JBoltApiRet.fail(4023,String.format("微信小程序绑定%s失败,原因：已经存在同类型下的用户绑定！:[%s(%s)]",userType,application.getName(),application.getId()));
	}
	
	/**
	 * 微信小程序用户手机号授权获取信息失败
	 * code：4024
	 * @param application
	 * @return
	 */
	public static JBoltApiRet WECHAT_XCX_GETPHONENUMBER_FAIL(Application application) {
		return JBoltApiRet.fail(4024,String.format("微信小程序授权获取用户手机号失败:[%s(%s)]",application.getName(),application.getId()));
	}
	
	/**
	 * 微信小程序用户手机号授权后信息更新失败
	 * code：4025
	 * @param application
	 * @return
	 */
	public static JBoltApiRet WECHAT_XCX_UPDATE_USER_PHONENUMBER_FAIL(Application application,String appendMsg) {
		return JBoltApiRet.fail(4025,String.format("微信小程序用户手机号授权后信息更新失败:[%s(%s)]\n原因：%s",application.getName(),application.getId(),appendMsg==null?"未知":appendMsg));
	}
	
	/**
	 * 后台接口 尚未登录 调用接口
	 * code：4026
	 * @param application
	 * @return
	 */
	public static JBoltApiRet NOT_ADMIN_LOGIN(Application application) {
		return JBoltApiRet.fail(4026,String.format("尚未登录:[%s(%s)]",application.getName(),application.getId()));
	}
	
	@Override
	public JBoltApiRet set(Object key, Object value) {
		super.set(key, value);
		return this;
	}
	public static JBoltApiRet success() {
		return new JBoltApiRet(0, null, null);
	}
	public static JBoltApiRet successWithData(Object data) {
		return new JBoltApiRet(0, null, data);
	}
	public static JBoltApiRet success(String msg) {
		return new JBoltApiRet(0, msg, null);
	}
	public static JBoltApiRet success(String msg,Object data) {
		return new JBoltApiRet(0, msg, data);
	}
	public static JBoltApiRet fail(int code,String msg) {
		return new JBoltApiRet(code, msg, null);
	}
	public static JBoltApiRet fail(int code,String msg,Object data) {
		return new JBoltApiRet(code, msg, data);
	}
	/**
	 * 返回API 结果
	 * @param code 错误码 0是正常 其它是错误
	 * @param msg API错误信息描述
	 * @param data 返回数据
	 */
	private JBoltApiRet(int code,String msg,Object data) {
		if(code==0) {
			setOk();
		}else {
			setFail();
		}
		set("code",code);
		setIfNotBlank("msg",msg);
		setIfNotNull("data",data);
	}
	public String getMsg() {
		return getStr("msg");
	}
	
	public JBoltApiRet setMsg(String msg) {
		setIfNotBlank("msg",msg);
		return this;
	}
	 
	public Integer getCode() {
		return getInt("code");
	}
	 
	public <T>T getData() {
		return getAs("data");
	}
	/**
	 * 调用API 返回失败消息
	 * @param msg
	 * @return
	 */
	public static JBoltApiRet API_FAIL(Application application,String msg) {
		return API_FAIL(application,msg,null);
	}
	/**
	 * 调用API 返回成功消息
	 * @param msg
	 * @return
	 */
	public static JBoltApiRet API_SUCCESS(String msg) {
		return API_SUCCESS(msg,null);
	}
	/**
	 * 调用API 返回成功消息
	 * @param msg
	 * @param data
	 * @return
	 */
	public static JBoltApiRet API_SUCCESS(String msg,Object data) {
		return JBoltApiRet.success(msg,data);
	}
	/**
	 * 调用API 返回成功消息
	 * @param msg
	 * @return
	 */
	public static final JBoltApiRet API_SUCCESS=JBoltApiRet.success();
	
	/**
	 * API失败消息
	 * code:4000
	 * @param location
	 * @param application
	 * @param msg
	 * @return
	 */
	public static JBoltApiRet API_FAIL(int location,Application application,String msg) {
		return API_FAIL(location, application, msg, null);
	}
	/**
	 * Api失败信息
	 * code:4000
	 * @param location
	 * @param application
	 * @param msg
	 * @return
	 */
	public static JBoltApiRet API_FAIL(int location,Application application,String msg,Object data) {
		return JBoltApiRet.fail(4000,String.format(location==0?"%s:[%s(%s)]":"%s-%d:[%s(%s)]", msg==null?"":msg,location,application.getName(),application.getAppId()),data);
	}
	/**
	 * Api失败信息
	 * code:4000
	 * @param application
	 * @param msg
	 * @param data
	 * @return
	 */
	public static JBoltApiRet API_FAIL(Application application,String msg,Object data) {
		return API_FAIL(0, application, msg, data);
	}
	/**
	 * 删除属性
	 * @param keys
	 */
	public void delete(String... keys) {
		if(keys!=null&&keys.length>0) {
			for (String key : keys) {
				delete(key);
			}
		}
	}
}
