package cn.jbolt.admin.wechat.mpinfo;

import cn.jbolt.base.JBoltEnum;

/**
 * 微信公众平台 主体类型
 * @ClassName:  WechatMpinfoSubjectType   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月17日   
 */
public enum WechatMpinfoSubjectType{
	PERSONAL("个人",1),
	INDIVIDUAL_BUSINESS("个体工商户",2),
	COMPANY("企业",3),
	MEDIA("媒体",4),
	ORG("组织",5),
	GOV("政府机关",6),
	GOV_SPONSORED_INSTITUTION("事业单位",7);
	private String text;
	private int value;
	private WechatMpinfoSubjectType(String text,int value) {
		this.text=text;
		this.value=value;
	}
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}
	
	//枚举类加入到JBoltEnum管理器中
	static {
		JBoltEnum.addToTvBeanMap(WechatMpinfoSubjectType.class);
	}

}