package cn.jbolt._admin.demo;

import com.jfinal.aop.Inject;
import com.jfinal.core.JFinal;
import com.jfinal.kit.Kv;
import com.jfinal.upload.UploadFile;

import cn.jbolt._admin.jboltfile.JBoltFileService;
import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.config.JBoltUploadFolder;
/**
 * Demo演示-文件上传
 * @ClassName:  FileUploaderDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月1日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class FileUploaderDemoController extends JBoltBaseController {
	@Inject
	private JBoltFileService jboltFileService;
	public void index() {
		render("fileuploader.html");
	}
	
	public void submit() {
		keepPara();
		setMsg("这是提交表单跳转页面，返回到本页面后的效果，输入框里带着值");
		render("fileuploader.html");
	}
	
	/**
	 * 上传文件
	 */
	public void uploadFile(){
		//上传到今天的文件夹下
		String uploadPath=JBoltUploadFolder.todayFolder(JBoltUploadFolder.DEMO_FILE_UPLOADER);
		UploadFile file=getFile("file",uploadPath);
		if(file==null) {
			renderJsonFail("上传失败");
			return;
		}
		Kv kv=Kv.create();
		kv.set("fileUrl", JFinal.me().getConstants().getBaseUploadPath()+"/"+uploadPath+"/"+file.getFileName());
		kv.set("fileName",file.getOriginalFileName());
		renderJsonData(kv);
	}
	
	
}
