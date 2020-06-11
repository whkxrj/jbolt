package cn.jbolt._admin.demo;

import com.jfinal.aop.Inject;
import com.jfinal.kit.Ret;
import com.jfinal.kit.StrKit;
import com.jfinal.upload.UploadFile;

import cn.jbolt._admin.jboltfile.JBoltFileService;
import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.bean.MultipleUploadFile;
import cn.jbolt.common.config.JBoltUploadFolder;
/**
 * Demo演示-Bootstrap-fileinput文件上传 异步版
 * @ClassName:  MultipleFileUploaderDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月1日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class MultipleFileUploaderDemoController extends JBoltBaseController {
	@Inject
	private JBoltFileService jboltFileService;
	public void index() {
		render("multiplefileuploader.html");
	}
	
	public void submit() {
		keepPara();
		setMsg("这是提交表单跳转页面，返回到本页面后的效果，输入框里带着值");
		render("multiplefileuploader.html");
	}
	
	/**
	 * 上传文件 异步单文件
	 */
	public void upload(){
		//上传到今天的文件夹下
		String uploadPath=JBoltUploadFolder.todayFolder(JBoltUploadFolder.DEMO_FILE_UPLOADER);
		UploadFile file=getFile("file",uploadPath);
		if(file==null) {
			renderBootFileUploadError("文件["+getPara("fileId")+"]上传失败!");
			return;
		}
		Ret ret=jboltFileService.saveImageFile(getSessionAdminUserId(),file,uploadPath);
		String fileId=getPara("fileId");
		if(StrKit.isBlank(fileId)) {
			fileId=file.getOriginalFileName();
		}
		renderJsonData(new MultipleUploadFile(fileId, file.getOriginalFileName(), ret.getStr("data")));
	}
	
	
}
