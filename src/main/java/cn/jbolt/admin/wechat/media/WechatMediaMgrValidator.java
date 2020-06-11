package cn.jbolt.admin.wechat.media;

import com.jfinal.core.Controller;

import cn.hutool.core.util.ArrayUtil;
import cn.jbolt.base.para.JBoltValidator;
import cn.jbolt.common.config.Msg;
/**
 * 微信公众平台资源库
 * @ClassName:  WechatReplyContentMgrValidator   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年6月22日   
 */
public class WechatMediaMgrValidator extends JBoltValidator {
	private static final String[] actionNames= new String[]{"chooseIt"};
	@Override
	protected void validate(Controller c) {
		validateJBoltInteger(0, Msg.PARAM_ERROR+":微信公众平台mpId");
		String actionName=getActionMethodName();
		if(ArrayUtil.contains(actionNames, actionName)) {
			validateJBoltInteger(1,  Msg.PARAM_ERROR+":数据ID");
		}
	}


}
