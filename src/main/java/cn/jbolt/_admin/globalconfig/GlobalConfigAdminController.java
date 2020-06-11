package cn.jbolt._admin.globalconfig;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.jfinal.aop.Inject;
import com.jfinal.kit.PathKit;

import cn.hutool.core.io.FileUtil;
import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.config.GlobalConfigKey;
import cn.jbolt.common.model.GlobalConfig;

/**
 * 全局配置项
* @author 小木 qq:909854136
* @version 创建时间：2018年12月25日 下午11:13:57
*/
@CheckPermission(PermissionKey.GLOBALCONFIG)
@UnCheckIfSystemAdmin
public class GlobalConfigAdminController extends JBoltBaseController {
	@Inject
	private GlobalConfigService service;
	public void index(){
		service.checkAndInit(getSessionAdminUserId());
		set("globalConfigs", service.findAll());
		render("index.html");
	}
	/**
	 * 列出登录背景图数据源
	 */
	private List<String> getLoginBgimgs() {
		List<File> bgImgs=FileUtil.loopFiles(PathKit.getWebRootPath()+"/assets/css/img/loginbg");
		List<String> imgs=new ArrayList<String>(bgImgs.size());
		if(bgImgs.size()>0) {
			for(File file:bgImgs) {
				imgs.add("assets/css/img/loginbg/"+file.getName());
			}
		}
		return imgs;
	}
	/**
	 * 列出登录背景视频数据源
	 */
	private List<String> getLoginBgvideos() {
		List<File> bgVideos=FileUtil.loopFiles(PathKit.getWebRootPath()+"/assets/css/video/loginbg",(file)->{
			String name=file.getName();
			return name.endsWith(".webm")||name.endsWith(".mp4");
		});
		List<String> videos=new ArrayList<String>(bgVideos.size());
		if(bgVideos.size()>0) {
			for(File file:bgVideos) {
				videos.add("assets/css/video/loginbg/"+file.getName());
			}
		}
		return videos;
	}
	
	/**
	 * 编辑
	 */
	public void edit(){
		GlobalConfig globalConfig=service.findById(getInt(0));
		set("globalConfig", globalConfig);
		if(globalConfig!=null&&GlobalConfigKey.JBOLT_LOGIN_BGIMG.equals(globalConfig.getConfigKey())) {
			set("imgs", getLoginBgimgs());
			set("videos", getLoginBgvideos());
		}
		render("edit.html");
	}
	/**
	 * 更新
	 */
	public void update(){
		GlobalConfig globalConfig=getModel(GlobalConfig.class, "globalConfig");
		renderJson(service.update(getSessionAdminUserId(),globalConfig));
	}
	/**
	 * 刷新assetsVersion
	 */
	public void changeAssetsVersion(){
		renderJson(service.changeAssetsVersion(getSessionAdminUserId()));
	}
 
/*	*//**
	 * 删除
	 *//*
	public void delete(){
		renderJson(service.deleteById(getSessionAdminUserId(),getInt()));
	}*/
	
}
