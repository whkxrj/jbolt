package cn.jbolt.common.model.base;
import cn.jbolt.base.JBoltBaseModel;
import cn.jbolt.common.gen.JBoltField;

/**
 * 商品后台类目表 无限
 * Generated by JBolt, do not modify this file.
 */
@SuppressWarnings({"serial", "unchecked"})
public abstract class BaseGoodsBackCategory<M extends BaseGoodsBackCategory<M>> extends JBoltBaseModel<M>{

	/**
	 * 主键ID
	 */
	public M setId(java.lang.Integer id) {
		set("id", id);
		return (M)this;
	}
	
	/**
	 * 主键ID
	 */
	@JBoltField(name="id" ,columnName="id",type="Integer", remark="主键ID")
	public java.lang.Integer getId() {
		return getInt("id");
	}

	public M setName(java.lang.String name) {
		set("name", name);
		return (M)this;
	}
	
	@JBoltField(name="name" ,columnName="name",type="String", remark="NAME")
	public java.lang.String getName() {
		return getStr("name");
	}

	public M setPid(java.lang.Integer pid) {
		set("pid", pid);
		return (M)this;
	}
	
	@JBoltField(name="pid" ,columnName="pid",type="Integer", remark="PID")
	public java.lang.Integer getPid() {
		return getInt("pid");
	}

	/**
	 * 商品类型
	 */
	public M setTypeId(java.lang.Integer typeId) {
		set("type_id", typeId);
		return (M)this;
	}
	
	/**
	 * 商品类型
	 */
	@JBoltField(name="typeId" ,columnName="type_id",type="Integer", remark="商品类型")
	public java.lang.Integer getTypeId() {
		return getInt("type_id");
	}

	/**
	 * 启用 禁用
	 */
	public M setEnable(java.lang.Boolean enable) {
		set("enable", enable);
		return (M)this;
	}
	
	/**
	 * 启用 禁用
	 */
	@JBoltField(name="enable" ,columnName="enable",type="Boolean", remark="启用 禁用")
	public java.lang.Boolean getEnable() {
		return getBoolean("enable");
	}

	/**
	 * 所有上级和自身ID串联起来
	 */
	public M setCategoryKey(java.lang.String categoryKey) {
		set("category_key", categoryKey);
		return (M)this;
	}
	
	/**
	 * 所有上级和自身ID串联起来
	 */
	@JBoltField(name="categoryKey" ,columnName="category_key",type="String", remark="所有上级和自身ID串联起来")
	public java.lang.String getCategoryKey() {
		return getStr("category_key");
	}

	/**
	 * 排序
	 */
	public M setSortRank(java.lang.Integer sortRank) {
		set("sort_rank", sortRank);
		return (M)this;
	}
	
	/**
	 * 排序
	 */
	@JBoltField(name="sortRank" ,columnName="sort_rank",type="Integer", remark="排序")
	public java.lang.Integer getSortRank() {
		return getInt("sort_rank");
	}

}