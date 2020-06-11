package cn.jbolt._admin.demo;

import com.jfinal.aop.Inject;
import com.jfinal.kit.PropKit;
import com.jfinal.upload.UploadFile;

import cn.jbolt._admin.jboltfile.JBoltFileService;
import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.config.JBoltUploadFolder;
/**
 * Demo演示-富文本编辑器 组件页面
 * @ClassName:  HtmlEditorDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月1日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class HtmlEditorDemoController extends JBoltBaseController {
	@Inject
	private JBoltFileService jboltFileService;
	public void index() {
		render("htmleditor.html");
	}
	
	public void summernote() {
		set("imghost", PropKit.get("editor_imghost"));
		render("summernote.html");
	}
	public void multiSummernote() {
		set("imghost", PropKit.get("editor_imghost"));
		render("summernote_multi.html");
	}
	public void neditorSubmit() {
		if(isAjax()) {
			renderJsonSuccess();
		}else {
			keepPara();
			set("imghost", PropKit.get("editor_imghost"));
			render("neditor.html");
		}
	}
	public void summernoteInDialog() {
		set("imghost", PropKit.get("editor_imghost"));
		render("summernote_dialog.html");
	}
	public void summernoteInJBoltLayer() {
		set("imghost", PropKit.get("editor_imghost"));
		render("summernote_jboltlayer.html");
	}
	public void summernoteMultiInJBoltLayer() {
		set("imghost", PropKit.get("editor_imghost"));
		render("summernote_multi_jboltlayer.html");
	}
	public void neditor() {
		set("imghost", PropKit.get("editor_imghost"));
		render("neditor.html");
	}
	public void multiNeditor() {
		set("imghost", PropKit.get("editor_imghost"));
		render("neditor_multi.html");
	}
	public void summerNeditor() {
		set("imghost", PropKit.get("editor_imghost"));
		render("neditor_summer_multi.html");
	}
	public void summerNeditorMultiInJBoltLayer() {
		set("imghost", PropKit.get("editor_imghost"));
		render("neditor_summer_multi_jboltlayer.html");
	}
	public void neditorInDialog() {
		set("imghost", PropKit.get("editor_imghost"));
		render("neditor_dialog.html");
	}
	public void neditorInJBoltLayer() {
		set("imghost", PropKit.get("editor_imghost"));
		render("neditor_jboltlayer.html");
	}
	public void neditorMultiInJBoltLayer() {
		set("imghost", PropKit.get("editor_imghost"));
		render("neditor_multi_jboltlayer.html");
	}
	/**
	 * 上传SummernoteImage图片
	 */
	public void uploadSummernoteImage(){
		//上传到今天的文件夹下
		String todayFolder=JBoltUploadFolder.todayFolder();
		String uploadPath=JBoltUploadFolder.DEMO_EDITOR_IMAGE+"/"+todayFolder;
		UploadFile file=getFile("file",uploadPath);
		if(notImage(file.getContentType())){
			renderJsonFail("请上传图片类型文件");
			return;
		}
		renderJson(jboltFileService.saveImageFile(getSessionAdminUserId(),file,uploadPath));
	}
	
	public void editorSubmit() {
		if(isAjax()) {
			renderJsonSuccess();
		}else {
			keepPara();
			set("imghost", PropKit.get("editor_imghost"));
			render("summernote.html");
		}
	}
	
	
	
}
