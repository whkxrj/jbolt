package cn.jbolt.common.model.base;
import cn.jbolt.base.JBoltBaseModel;
import cn.jbolt.common.gen.JBoltField;

/**
 * 货架元素_活动
 * Generated by JBolt, do not modify this file.
 */
@SuppressWarnings({"serial", "unchecked"})
public abstract class BaseShelfActivity<M extends BaseShelfActivity<M>> extends JBoltBaseModel<M>{

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

	/**
	 * 海报地址
	 */
	public M setPosterImage(java.lang.String posterImage) {
		set("poster_image", posterImage);
		return (M)this;
	}
	
	/**
	 * 海报地址
	 */
	@JBoltField(name="posterImage" ,columnName="poster_image",type="String", remark="海报地址")
	public java.lang.String getPosterImage() {
		return getStr("poster_image");
	}

	/**
	 * 打开地址
	 */
	public M setOpenUrl(java.lang.String openUrl) {
		set("open_url", openUrl);
		return (M)this;
	}
	
	/**
	 * 打开地址
	 */
	@JBoltField(name="openUrl" ,columnName="open_url",type="String", remark="打开地址")
	public java.lang.String getOpenUrl() {
		return getStr("open_url");
	}

	/**
	 * 打开方式 网页还是商品内页 还是分类 还是
	 */
	public M setOpenType(java.lang.Integer openType) {
		set("open_type", openType);
		return (M)this;
	}
	
	/**
	 * 打开方式 网页还是商品内页 还是分类 还是
	 */
	@JBoltField(name="openType" ,columnName="open_type",type="Integer", remark="打开方式 网页还是商品内页 还是分类 还是")
	public java.lang.Integer getOpenType() {
		return getInt("open_type");
	}

	/**
	 * 货架元素ID
	 */
	public M setShelfElementId(java.lang.Integer shelfElementId) {
		set("shelf_element_id", shelfElementId);
		return (M)this;
	}
	
	/**
	 * 货架元素ID
	 */
	@JBoltField(name="shelfElementId" ,columnName="shelf_element_id",type="Integer", remark="货架元素ID")
	public java.lang.Integer getShelfElementId() {
		return getInt("shelf_element_id");
	}

	/**
	 * 货架ID
	 */
	public M setShelfId(java.lang.Integer shelfId) {
		set("shelf_id", shelfId);
		return (M)this;
	}
	
	/**
	 * 货架ID
	 */
	@JBoltField(name="shelfId" ,columnName="shelf_id",type="Integer", remark="货架ID")
	public java.lang.Integer getShelfId() {
		return getInt("shelf_id");
	}

}