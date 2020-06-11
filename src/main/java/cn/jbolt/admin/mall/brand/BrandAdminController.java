package cn.jbolt.admin.mall.brand;

import com.jfinal.aop.Inject;
import com.jfinal.core.JFinal;
import com.jfinal.upload.UploadFile;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.config.JBoltUploadFolder;
import cn.jbolt.common.config.PageSize;
import cn.jbolt.common.model.Brand;

/**
 * 品牌库管理   
 * @ClassName:  BrandAdminController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年4月12日 上午11:53:43   
 */
@CheckPermission(PermissionKey.MALL_BRAND)
public class BrandAdminController extends JBoltBaseController {
	@Inject
	private BrandService service;
	public void index(){
		render("index.html");
	}
	/**
	 * 异步加载数据
	 */
	public void datas() {
		renderJsonData(service.paginateAdminList(getPageNumber(), getPageSize(PageSize.PAGESIZE_ADMIN_LIST_15),getSortColumn(),getSortType(),getKeywords()));
	}
	
	/**
	 * 上传商品相关图片
	 */
	public void uploadImage(){
		//上传到今天的文件夹下
		String todayFolder=JBoltUploadFolder.todayFolder();
		String uploadPath=JBoltUploadFolder.MALL_BRAND_IMAGE+"/"+todayFolder;
		UploadFile file=getFile("file",uploadPath);
		if(notImage(file)){
			renderJsonFail("请上传图片类型文件");
			return;
		}
		renderJsonData(JFinal.me().getConstants().getBaseUploadPath()+"/"+uploadPath+"/"+file.getFileName());
	}

	/**
	 * 新增
	 */
	public void add(){
		render("add.html");
	}
	/**
	 * 编辑
	 */
	public void edit(){
		set("brand", service.findById(getInt(0)));
		render("edit.html");
	}
	/**
	 * 保存
	 */
	public void save(){
		renderJson(service.save(getSessionAdminUserId(),getModel(Brand.class, "brand")));
	}
	/**
	 * 更新
	 */
	public void update(){
		renderJson(service.update(getSessionAdminUserId(),getModel(Brand.class, "brand")));
	}
	/**
	 * 删除
	 */
	public void delete(){
		renderJson(service.delete(getSessionAdminUserId(),getInt(0)));
	}
	/**
	 * 切换启用禁用状态
	 */
	public void toggleEnable(){
		renderJson(service.toggleEnable(getSessionAdminUserId(),getInt(0)));
	}
}
