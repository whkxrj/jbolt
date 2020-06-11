package cn.jbolt.admin.mall.spec;

import com.jfinal.aop.Inject;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.config.Msg;
import cn.jbolt.common.model.Spec;

/**   
 * 系统商品规格管理
 * @ClassName:  GoodsTypeAdminController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年3月26日 下午12:59:17   
 */
@CheckPermission(PermissionKey.MALL_SPEC)
public class SpecAdminController extends JBoltBaseController {
	@Inject
	private SpecService service;
	public void index(){
		set("goodsTypes", service.findAll());
		render("index.html");
	}
	
	public void add(){
		render("add.html");
	}
	
	public void edit(){
		Integer id=getInt(0);
		if(notOk(id)){
			renderFormError(Msg.PARAM_ERROR);
			return;
		}
		Spec spec=service.findById(getInt(0));
		if(spec==null){
			renderFormError(Msg.DATA_NOT_EXIST);
			return;
		}
		set("spec", spec);
		render("edit.html");
	}
	
	public void save(){
		renderJson(service.save(getSessionAdminUserId(),getModel(Spec.class,"spec")));
	}
	public void update(){
		renderJson(service.update(getSessionAdminUserId(),getModel(Spec.class,"spec")));
	}
	public void delete(){
		renderJson(service.delete(getSessionAdminUserId(),getInt(0)));
	}
	
 
	
}
