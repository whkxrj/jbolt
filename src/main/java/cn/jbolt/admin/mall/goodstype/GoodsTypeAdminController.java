package cn.jbolt.admin.mall.goodstype;

import com.jfinal.aop.Inject;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.config.Msg;
import cn.jbolt.common.config.PageSize;
import cn.jbolt.common.model.GoodsType;

/**   
 * 商品类型管理
 * @ClassName:  GoodsTypeAdminController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年3月26日 下午12:59:17   
 */
@CheckPermission(PermissionKey.MALL_GOODSTYPE)
public class GoodsTypeAdminController extends JBoltBaseController {
	@Inject
	private GoodsTypeService service;
	public void index(){
		service.checkAndInitPinyin();
		render("index.html");
	}
	/**
	 * 读取数据接口 分页查询 json数返回
	 */
	public void datas() {
		renderJsonData(service.paginateAdminList(getKeywords(), getPageNumber(), getPageSize(PageSize.PAGESIZE_ADMIN_LIST_20)));
	}
	
	@CheckPermission({PermissionKey.MALL_GOODS_BACK_CATEGORY})
	public void options(){
		renderJsonData(service.getOptionList("name", "id"));
	}
	/**
	 * 进入添加表单界面
	 */
	public void add(){
		render("add.html");
	}
	/**
	 * 进入修改表单界面
	 */
	public void edit(){
		Integer id=getInt(0);
		if(notOk(id)){
			renderFormError(Msg.PARAM_ERROR);
			return;
		}
		GoodsType goodsType=service.findById(getInt(0));
		if(goodsType==null){
			renderFormError(Msg.DATA_NOT_EXIST);
			return;
		}
		set("goodsType", goodsType);
		render("edit.html");
	}
	/**
	 * 提交保存数据
	 */
	public void save(){
		renderJson(service.save(getSessionAdminUserId(),getModel(GoodsType.class,"goodsType")));
	}
	/**
	 * 提交修改数据
	 */
	public void update(){
		renderJson(service.update(getSessionAdminUserId(),getModel(GoodsType.class,"goodsType")));
	}
	/**
	 * 根据ID删除数据
	 */
	public void delete(){
		renderJson(service.delete(getSessionAdminUserId(),getInt(0)));
	}
	/**
	 * 切换enable状态
	 */
	public void toggleEnable(){
		renderJson(service.toggleEnable(getSessionAdminUserId(),getInt(0)));
	}
	/**
	 * 排序上移
	 */
	public void up(){
		renderJson(service.doUp(getSessionAdminUserId(),getInt(0)));
	}
	/**
	 * 排序下移
	 */
	public void down(){
		renderJson(service.doDown(getSessionAdminUserId(),getInt(0)));
	}
	/**
	 * 排序初始化排序
	 */
	public void initRank(){
		renderJson(service.doInitRank(getSessionAdminUserId()));
	}
	
}
