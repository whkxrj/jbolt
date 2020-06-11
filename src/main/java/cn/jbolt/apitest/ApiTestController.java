package cn.jbolt.apitest;

import com.jfinal.kit.JsonKit;
import com.jfinal.kit.Kv;
import com.jfinal.upload.UploadFile;

import cn.jbolt.base.api.JBoltApiBaseController;
import cn.jbolt.base.api.JBoltApiKit;
import cn.jbolt.base.api.JBoltApiUserBean;
import cn.jbolt.base.api.JBoltApplyJWT;
import cn.jbolt.base.api.OpenAPi;
import cn.jbolt.base.crossorigin.CrossOrigin;
import cn.jbolt.base.para.JBoltPara;
/**
 * 测试API
 * @ClassName:  ApiTestController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年9月12日   
 */
@CrossOrigin
public class ApiTestController extends JBoltApiBaseController {
	/**
	 * API测试
	 */
	public void go() {
		//进入这个方法 是需要拦截器校验request Header中的JWT信息的
		renderJBoltApiSuccess("卧槽！API 测试通过");
	}
	
	/**
	 * API测试
	 */
	public void floor() {
		renderJBoltApiSuccessWithData(Kv.by("id", 1).set("name","山东小木"));
	}
	/**
	 * API测试
	 */
	@OpenAPi
	public void upload(UploadFile file,JBoltPara para) {
		System.out.println(JsonKit.toJson(file));
		System.out.println(para);
		renderJBoltApiSuccessWithData(Kv.by("fileUrl", file.getUploadPath()+"/"+file.getFileName()));
	}
	
	/**
	 * API首次访问 签发JWT
	 */
	@JBoltApplyJWT
	public void login() {
		//用户存在的话 设置到threadLocal中拦截器得 这里需要开发者自行设置登录后的用户信息进去
		JBoltApiKit.setApplyJwtUser(new JBoltApiUserBean(1,1, "zhangsan"));
		//模拟用户信息 这里可能是微信授权登录
		renderJBoltApiSuccess("登录成功",Kv.by("appId", getAppId()));
	}
	
}
