package cn.jbolt._admin.demo;

import com.jfinal.aop.Inject;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;

import cn.jbolt._admin.jboltfile.JBoltFileService;
import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt._admin.updatemgr.ChangeLogService;
import cn.jbolt._admin.updatemgr.JBoltVersionService;
import cn.jbolt._admin.updatemgr.JboltVersionFileService;
import cn.jbolt._admin.updatemgr.UpdateLibsService;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.config.JBoltUploadFolder;
import cn.jbolt.common.config.PageSize;
import cn.jbolt.common.model.JboltVersion;
import cn.jbolt.common.model.JboltVersionFile;
/**
 * Demo演示-JBoltTable组件页面
 * @ClassName:  JBoltTableDemoController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月1日   
 */
@CheckPermission(PermissionKey.DEMO)
@UnCheckIfSystemAdmin
public class JBoltTableDemoController extends JBoltBaseController {
	@Inject
	private JBoltVersionService jBoltVersionService;
	@Inject
	private UpdateLibsService updateLibsService;
	@Inject
	private ChangeLogService changeLogService;
	@Inject
	private JboltVersionFileService jboltVersionFileService;
	@Inject
	private JBoltFileService jboltFileService;
	
	public void index() {
		render("index.html");
	}
	/**
	 * 导入界面
	 */
	public void initImport() {
		render("importexcel.html");
	}
	/**
	 * 下载导入模板
	 */
	public void downloadTpl() {
		renderBytesToExcelXlsFile(jBoltVersionService.getExcelImportTpl().setFileName("版本信息导入模板"));
	}
	/**
	 * 上传Excel 导入到数据库
	 */
	public void importExcel() {
		String uploadPath=JBoltUploadFolder.todayFolder(JBoltUploadFolder.DEMO_JBOLTTABLE_EXCEL);
		UploadFile file=getFile("file",uploadPath);
		if(notExcel(file)){
			renderJsonFail("请上传excel文件");
			return;
		}
		renderJson(jBoltVersionService.importExcelDatas(getSessionAdminUserId(),file.getFile()));
	}
	/**
	 * 导出下载Excel文件
	 */
	public void download() {
		renderBytesToExcelXlsFile(jBoltVersionService.getExcelReport().setFileName("版本信息导出"));
	}
	
	public void normal() {
		set("dataList", jBoltVersionService.getCommonListByKeywords(getKeywords(), getSortColumn("create_time"), getSortType("desc"), "version"));
		keepPara();
		render("normal.html");
	}
	public void normalToolbar() {
		set("dataList", jBoltVersionService.getCommonListByKeywords(getKeywords(), getSortColumn("create_time"), getSortType("desc"), "version"));
		keepPara();
		render("normal_toolbar.html");
	}
	public void normalMulti() {
		set("dataList", jBoltVersionService.getCommonListByKeywords(getKeywords(), getSortColumn("create_time"), getSortType("desc"), "version"));
		set("updatelibs", updateLibsService.getCommonList("id", "desc"));
		keepPara();
		render("normal_multi.html");
	}
	public void normalMultiInJBoltLayer() {
		set("dataList", jBoltVersionService.getCommonListByKeywords(getKeywords(), getSortColumn("create_time"), getSortType("desc"), "version"));
		set("updatelibs", updateLibsService.getCommonList("id", "desc"));
		keepPara();
		render("normal_jboltlayer_multi.html");
	}
	public void normalInDialog() {
		set("dataList", jBoltVersionService.getCommonListByKeywords(getKeywords(),  getSortColumn("create_time"), getSortType("desc"), "version"));
		keepPara();
		render("normal_dialog.html");
	}
	public void normalInJBoltLayer() {
		set("dataList", jBoltVersionService.getCommonListByKeywords(getKeywords(),  getSortColumn("create_time"), getSortType("desc"), "version"));
		keepPara();
		render("normal_jboltlayer.html");
	}
	/**
	 * 分页版
	 */
	public void paginate() {
		set("pageData", jBoltVersionService.paginateAdminList(getPageNumber(),getPageSize(PageSize.PAGESIZE_ADMIN_LIST_15),getSortColumn("create_time"),getSortType("desc"),getKeywords(),getDate("startTime"),getDate("endTime")));
		keepPara();
		render("paginate.html");
	}
	/**
	 * 本地渲染无分页 复杂表头
	 */
	public void normalThead() {
		set("dataList", jBoltVersionService.getCommonListByKeywords(getKeywords(), getSortColumn("create_time"), getSortType("desc"), "version"));
		keepPara();
		render("normal_thead.html");
	}
	/**
	 * 分页版 多实例
	 */
	public void paginateMulti() {
		set("pageData", jBoltVersionService.paginateAdminList(getPageNumber(),getPageSize(PageSize.PAGESIZE_ADMIN_LIST_15),getSortColumn("create_time"),getSortType("desc"),getKeywords(),getDate("startTime"),getDate("endTime")));
		keepPara();
		render("paginate_multi.html");
	}
	/**
	 * 分页版 dialog
	 */
	public void paginateInDialog() {
		set("pageData", jBoltVersionService.paginateAdminList(getPageNumber(),getPageSize(PageSize.PAGESIZE_ADMIN_LIST_15),getSortColumn("create_time"),getSortType("desc"),getKeywords(),getDate("startTime"),getDate("endTime")));
		keepPara();
		render("paginate_dialog.html");
	}
	/**
	 * 分页版 jboltLayer
	 */
	public void paginateInJBoltLayer() {
		set("pageData", jBoltVersionService.paginateAdminList(getPageNumber(),getPageSize(PageSize.PAGESIZE_ADMIN_LIST_15),getSortColumn("create_time"),getSortType("desc"),getKeywords(),getDate("startTime"),getDate("endTime")));
		keepPara();
		render("paginate_jboltlayer.html");
	}
	/**
	 * 分页版 jboltLayer 多实例
	 */
	public void paginateMultiInJBoltLayer() {
		set("pageData", jBoltVersionService.paginateAdminList(getPageNumber(),getPageSize(PageSize.PAGESIZE_ADMIN_LIST_15),getSortColumn("create_time"),getSortType("desc"),getKeywords(),getDate("startTime"),getDate("endTime")));
		keepPara();
		render("paginate_jboltlayer_multi.html");
	}
	/**
	 * 复杂表头
	 */
	public void thead() {
		set("pageData", jBoltVersionService.paginateAdminList(getPageNumber(),getPageSize(PageSize.PAGESIZE_ADMIN_LIST_15),getSortColumn("create_time"),getSortType("desc"),getKeywords(),getDate("startTime"),getDate("endTime")));
		keepPara();
		render("thead.html");
	}
	/**
	 * 进入ajax版demo首页
	 */
	public void ajax() {
		setDefaultSortInfo("create_time","desc");
		render("ajax.html");
	}
	/**
	 * 进入ajax版demo首页 带工具条
	 */
	public void ajaxToolbar() {
		setDefaultSortInfo("create_time","desc");
		render("ajax_toolbar.html");
	}
	/**
	 * 进入ajax版demo 复杂表头
	 */
	public void ajaxThead() {
		setDefaultSortInfo("create_time","desc");
		render("ajax_thead.html");
	}
	/**
	 * 进入ajax版demo首页 多实例
	 */
	public void ajaxMulti() {
		setDefaultSortInfo("create_time","desc");
		render("ajax_multi2.html");
	}
	/**
	 * 进入ajax版demo首页 dialog中
	 */
	public void ajaxInDialog() {
		setDefaultSortInfo("create_time","desc");
		render("ajax_dialog.html");
	}
	/**
	 * 进入ajax版demo首页 jboltlayer中
	 */
	public void ajaxInJBoltLayer() {
		setDefaultSortInfo("create_time","desc");
		render("ajax_jboltlayer.html");
	}
	/**
	 * 进入ajax版demo首页 多实例 jboltlayer中
	 */
	public void ajaxMultiInJBoltLayer() {
		setDefaultSortInfo("create_time","desc");
		render("ajax_multi_jboltlayer.html");
	}
	/**
	 * 进入ajax版demo首页 无分页
	 */
	public void ajaxNoPage() {
		setDefaultSortInfo("create_time","desc");
		render("ajax_nopage.html");
	}
	/**
	 * 进入ajax版demo复杂表头 无分页
	 */
	public void ajaxNoPageThead() {
		setDefaultSortInfo("create_time","desc");
		render("ajax_nopage_thead.html");
	}
	/**
	 * 进入ajax版demo首页 无分页 dialog中
	 */
	public void ajaxNoPageInDialog() {
		setDefaultSortInfo("create_time","desc");
		render("ajax_nopage_dialog.html");
	}
	/**
	 * 进入ajax版demo首页 无分页jboltlayer中
	 */
	public void ajaxNoPageInJBoltLayer() {
		setDefaultSortInfo("create_time","desc");
		render("ajax_nopage_jboltlayer.html");
	}
	/**
	 * 进入ajax版demo首页 无分页jboltlayer中
	 */
	public void ajaxNoPageMultiInJBoltLayer() {
		setDefaultSortInfo("create_time","desc");
		render("ajax_nopage_multi_jboltlayer.html");
	}
	/**
	  * 进入ajax版demo首页 无分页
	 */
	public void ajaxNoPageMulti() {
		setDefaultSortInfo("create_time","desc");
		render("ajax_nopage_multi.html");
	}
	
	/**
	 * ajax读取数据
	 */
	public void ajaxDataList() {
		renderJsonData(jBoltVersionService.getAdminList(getSortColumn("create_time"),getSortType("desc"),getKeywords(),getDate("startTime"),getDate("endTime")));
	}
	
	/**
	 * ajax读取数据
	 */
	public void ajaxDatas() {
		Page<JboltVersion> pageData=jBoltVersionService.paginateAdminList(getPageNumber(),getPageSize(PageSize.PAGESIZE_ADMIN_LIST_15),getSortColumn("create_time"),getSortType("desc"),getKeywords(),getDate("startTime"),getDate("endTime"));
		renderJsonData(pageData);
	}
	
	
	
	public void files() {
		Integer jboltVersionId=getInt(0);
		set("jboltVersionId", jboltVersionId);
		set("files", jboltVersionFileService.getFilesByJboltVersionId(jboltVersionId));
		render("files.html");
	}
	public void addFile() {
		Integer jboltVersionId=getInt(0);
		set("jboltVersionId", jboltVersionId);
		render("addfile.html");
	}
	public void editFile() {
		Integer fileId=getInt(0);
		JboltVersionFile file=jboltVersionFileService.findById(fileId);
		if(file==null){
			renderFormError("数据不存在");
			return;
		}
		set("jboltVersionFile", file);
		if(isOk(file.getJboltVersionId())){
			set("jboltVersionId", file.getJboltVersionId());
		}
		render("editfile.html");
	}
	public void saveFile() {
		renderJson(jboltVersionFileService.save(getSessionAdminUserId(),getModel(JboltVersionFile.class,"jboltVersionFile")));
	}
	public void updateFile() {
		renderJson(jboltVersionFileService.update(getSessionAdminUserId(),getModel(JboltVersionFile.class,"jboltVersionFile")));
	}
	public void deleteFile() {
		renderJson(jboltVersionFileService.delete(getSessionAdminUserId(),getInt(0)));
	}

	public void add() {
		render("add.html");
	}

	public void edit() {
		set("jboltVersion", jBoltVersionService.findById(getInt(0)));
		render("edit.html");
	}

	public void save() {
		renderJson(jBoltVersionService.save(getSessionAdminUserId(), getModel(JboltVersion.class, "jboltVersion")));
	}

	public void update() {
		renderJson(jBoltVersionService.update(getSessionAdminUserId(), getModel(JboltVersion.class, "jboltVersion")));
	}

	public void delete() {
		renderJson(jBoltVersionService.delete(getSessionAdminUserId(), getInt(0)));
	}
	
	public void deleteByIds() {
		renderJson(jBoltVersionService.deleteByIds(getSessionAdminUserId(), getStrParaToArray("ids")));
	}

	public void toggleIsNew() {
		renderJson(jBoltVersionService.doToggleIsNew(getSessionAdminUserId(), getInt(0)));
	}

}
