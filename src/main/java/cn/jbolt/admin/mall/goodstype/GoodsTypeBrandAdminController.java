package cn.jbolt.admin.mall.goodstype;

import java.util.List;

import com.jfinal.aop.Inject;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt.admin.mall.brand.BrandService;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.model.Brand;
/**
 * 商品类型关联的品牌表
 * @ClassName:  GoodsTypeBrandAdminController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年7月11日   
 */
@CheckPermission(PermissionKey.MALL_GOODSTYPE)
public class GoodsTypeBrandAdminController extends JBoltBaseController {
	@Inject
	private BrandService brandService;
	@Inject
	private GoodsTypeBrandService service;
	public void index() {
		Integer goodsTypeId=getInt(0);
		List<Brand> choosedList=brandService.getBrandsByGoodsType(getInt(0));
		set("choosedList", choosedList);
		if(isOk(choosedList)) {
			set("brands", brandService.getBrandsWithoutGoodsType(getInt(0)));
		}else {
			set("brands", brandService.findAll());
		}
		set("goodsTypeId", goodsTypeId);
		render("index.html");
	}
	/**
	 * 清空关联品牌
	 */
	public void clearByType() {
		renderJson(service.clearByType(getInt(0)));
	}
	/**
	 * 提交关联数据
	 */
	public void submit() {
		renderJson(service.submit(getInt("goodsTypeId"),get("brandIds")));
	}
}
