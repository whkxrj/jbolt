package cn.jbolt._admin.dictionary;

import com.jfinal.aop.Before;
import com.jfinal.aop.Inject;
import com.jfinal.plugin.activerecord.tx.Tx;

import cn.jbolt._admin.permission.CheckPermission;
import cn.jbolt._admin.permission.PermissionKey;
import cn.jbolt._admin.permission.UnCheckIfSystemAdmin;
import cn.jbolt.base.JBoltBaseController;
import cn.jbolt.common.model.DictionaryType;

/**
 * 数据字典类型管理Controller
 * @ClassName:  DictionaryTypeAdminController   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年11月9日   
 */
@CheckPermission({PermissionKey.DICTIONARY})
@UnCheckIfSystemAdmin
public class DictionaryTypeAdminController extends JBoltBaseController {
	@Inject
	private DictionaryTypeService service;
	/**
	 * 加载管理portal
	 */
	public void mgr(){
		set("dictionaryTypes",service.findAll());
		render("mgrportal.html");
	}
	
	public void add(){
		render("add.html");
	}
	public void edit(){
		Integer id=getInt(0);
		if(notOk(id)){
			renderFormError("数据不存在");
			return;
		}
		DictionaryType type=service.findById(id);
		if(type==null){
			if(notOk(id)){
				renderFormError("数据不存在");
				return;
			}
		}
		set("dictionaryType",type);
		render("edit.html");
	}
	public void save(){
		renderJson(service.save(getSessionAdminUserId(),getModel(DictionaryType.class, "dictionaryType")));
	}
	@Before(Tx.class)
	public void update(){
		renderJson(service.update(getSessionAdminUserId(),getModel(DictionaryType.class, "dictionaryType")));
	}
	public void delete(){
		renderJson(service.delete(getSessionAdminUserId(),getInt(0)));
	}
}
