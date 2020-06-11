package cn.jbolt.admin.appdevcenter;

import com.jfinal.core.Controller;

import cn.jbolt.base.para.JBoltValidator;
import cn.jbolt.common.config.Msg;
/**
   * 应用开发中心 管理应用 参数校验
 * @ClassName:  ApplicationValidator   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年6月22日   
 */
public class ApplicationValidator extends JBoltValidator {
	@Override
	protected void validate(Controller c) {
		validateJBoltInteger(0,  Msg.PARAM_ERROR+":数据ID");
	}


}
