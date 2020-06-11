package cn.jbolt.common.model.base;
import cn.jbolt.base.JBoltBaseModel;
import cn.jbolt.common.gen.JBoltField;

/**
 * 微信菜单
 * Generated by JBolt, do not modify this file.
 */
@SuppressWarnings({"serial", "unchecked"})
public abstract class BaseWechatMenu<M extends BaseWechatMenu<M>> extends JBoltBaseModel<M>{

	public M setId(java.lang.Integer id) {
		set("id", id);
		return (M)this;
	}
	
	@JBoltField(name="id" ,columnName="id",type="Integer", remark="ID")
	public java.lang.Integer getId() {
		return getInt("id");
	}

	/**
	 * 微信 ID
	 */
	public M setMpId(java.lang.Integer mpId) {
		set("mp_id", mpId);
		return (M)this;
	}
	
	/**
	 * 微信 ID
	 */
	@JBoltField(name="mpId" ,columnName="mp_id",type="Integer", remark="微信 ID")
	public java.lang.Integer getMpId() {
		return getInt("mp_id");
	}

	public M setType(java.lang.String type) {
		set("type", type);
		return (M)this;
	}
	
	@JBoltField(name="type" ,columnName="type",type="String", remark="TYPE")
	public java.lang.String getType() {
		return getStr("type");
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

	public M setValue(java.lang.String value) {
		set("value", value);
		return (M)this;
	}
	
	@JBoltField(name="value" ,columnName="value",type="String", remark="VALUE")
	public java.lang.String getValue() {
		return getStr("value");
	}

	/**
	 * 微信小程序APPID
	 */
	public M setAppId(java.lang.String appId) {
		set("app_id", appId);
		return (M)this;
	}
	
	/**
	 * 微信小程序APPID
	 */
	@JBoltField(name="appId" ,columnName="app_id",type="String", remark="微信小程序APPID")
	public java.lang.String getAppId() {
		return getStr("app_id");
	}

	/**
	 * 微信小程序页面地址
	 */
	public M setPagePath(java.lang.String pagePath) {
		set("page_path", pagePath);
		return (M)this;
	}
	
	/**
	 * 微信小程序页面地址
	 */
	@JBoltField(name="pagePath" ,columnName="page_path",type="String", remark="微信小程序页面地址")
	public java.lang.String getPagePath() {
		return getStr("page_path");
	}

}