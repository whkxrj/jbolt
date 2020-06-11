package cn.jbolt._admin.demo;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.aop.Inject;
import com.jfinal.kit.Ret;
import com.jfinal.upload.UploadFile;

import cn.jbolt._admin.jboltfile.JBoltFileService;
import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.bean.MultipleUploadFile;
import cn.jbolt.common.config.JBoltUploadFolder;
/**
 * Demo演示-Bootstrap-fileinput文件上传
 * @ClassName:  MultipleFileSyncUploaderDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月1日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class MultipleFileSyncUploaderDemoController extends JBoltBaseController {
	@Inject
	private JBoltFileService jboltFileService;
	public void index() {
		render("multiplefilesyncuploader.html");
	}
	
	public void submit() {
		setMsg("这是提交表单跳转页面，返回到本页面后的效果，输入框里带着值");
		keepPara();
		render("multiplefilesyncuploader.html");
	}
	
	/**
	 * 上传文件 同步批量上传文件
	 */
	public void upload(){
		//上传到今天的文件夹下
		String uploadPath=JBoltUploadFolder.todayFolder(JBoltUploadFolder.DEMO_FILE_UPLOADER);
		List<UploadFile> files=getFiles(uploadPath);
		if(!isOk(files)) {
			renderBootFileUploadError("文件上传失败!");
			return;
		}
		List<MultipleUploadFile> retFiles=new ArrayList<MultipleUploadFile>();
		Ret ret;
		for(UploadFile uploadFile:files) {
			ret=jboltFileService.saveImageFile(getSessionAdminUserId(),uploadFile,uploadPath);
			retFiles.add(new MultipleUploadFile(uploadFile.getOriginalFileName(), uploadFile.getOriginalFileName(), ret.getStr("data")));
		}
		renderJsonData(retFiles);
	}
	
	
}
