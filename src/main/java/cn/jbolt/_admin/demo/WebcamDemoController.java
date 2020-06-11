package cn.jbolt._admin.demo;

import com.jfinal.core.JFinal;
import com.jfinal.upload.UploadFile;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
/**
 * webcam组件 demo
 * @ClassName:  WebcamDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月29日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class WebcamDemoController extends JBoltBaseController {
	public void index() {
		render("webcam.html");
	}
	
	public void upload() {
		UploadFile file=getFile("file","demo/webcam");
		if(notImage(file)){
			renderJsonFail("请上传图片类型文件");
			return;
		}
		renderJsonData(JFinal.me().getConstants().getBaseUploadPath()+"/demo/webcam/"+file.getFileName());
	}
}
