package cn.jbolt.common.directive;

import com.jfinal.kit.StrKit;
import com.jfinal.template.Directive;
import com.jfinal.template.Env;
import com.jfinal.template.expr.ast.Expr;
import com.jfinal.template.expr.ast.ExprList;
import com.jfinal.template.io.Writer;
import com.jfinal.template.stat.ParseException;
import com.jfinal.template.stat.Scope;

import cn.jbolt.common.config.GlobalConfigKey;
import cn.jbolt.common.model.GlobalConfig;
import cn.jbolt.common.util.CACHE;
/**
 * JBolt admin 后台 左上角LOGO专属指令
 * @ClassName:  JBoltAdminLogoDirective   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年2月21日   
 */
public class JBoltAdminLogoDirective extends Directive {
	private Expr defaultValueExpr;
	private int paraNum;
	private String textTpl_4="<div class='jbolt_system_name' style='background-color:%s;color:%s;'><span class='main'>%s</span><span class='sm'>%s</span></div>";
	private String textTpl_3="<div class='jbolt_system_name' style='color:%s;'><span class='main'>%s</span><span class='sm'>%s</span></div>";
	private String textTpl_2="<div class='jbolt_system_name'><span class='main'>%s</span><span class='sm'>%s</span></div>";
	private String textTpl_1="<div class='jbolt_system_name'><span class='main'>%s</span><span class='sm'>JBolt</span></div>";
	private String imgTpl_1="<img class='jbolt_admin_logo main' src='%s' /><img class='jbolt_admin_logo sm' src='assets/img/logo_sm.png' />";
	private String imgTpl_2="<img class='jbolt_admin_logo main' src='%s' /><img class='jbolt_admin_logo sm' src='%s' />";
	private String imgTpl_3="<div style='background-color:%s;'><img class='jbolt_admin_logo main' src='%s' /><img class='jbolt_admin_logo sm' src='%s' /></div>";
	public void setExprList(ExprList exprList) {
		this.paraNum = exprList.length();
		if (paraNum>1) {
			throw new ParseException("Wrong number parameter of #jboltAdminLogo directive, one parameters allowed at most", location);
		}else if (paraNum == 1) {
			this.defaultValueExpr  = exprList.getExpr(0);
		} 
	}
	private void outputText(Writer writer,String value) {
		String arr[]=value.split(":");
		int len=arr.length;
		switch (len) {
		case 1:
			write(writer,String.format(textTpl_1,arr[0]));
			break;
		case 2:
			write(writer,String.format(textTpl_2,arr[0],arr[1]));
			break;
		case 3:
			write(writer,String.format(textTpl_3,arr[2],arr[0],arr[1]));
			break;
		case 4:
			write(writer,String.format(textTpl_4, arr[3],arr[2],arr[0],arr[1]));
			break;
		}
	}
	private void outputImg(Writer writer,String value) {
		String arr[]=value.split(":");
		int len=arr.length;
		switch (len) {
		case 1:
			write(writer,String.format(imgTpl_1, arr[0]));
			break;
		case 2:
			write(writer,String.format(imgTpl_2, arr[0],arr[1]));
			break;
		case 3:
			write(writer,String.format(imgTpl_3, arr[2],arr[0],arr[1]));
			break;
		}
	}
	private void outputByType(Writer writer,String value) {
		if(value.indexOf("/")!=-1&&value.indexOf(".")!=-1) {
			outputImg(writer, value);
		}else {
			outputText(writer, value);
		}
	}
	@Override
	public void exec(Env env, Scope scope, Writer writer) {
		GlobalConfig globalConfig=CACHE.me.getGlobalConfig(GlobalConfigKey.SYSTEM_ADMIN_LOGO);
		if(globalConfig==null||StrKit.isBlank(globalConfig.getConfigValue())) {
			//如果没有配置就用默认值
			Object defaultValue=this.defaultValueExpr.eval(scope);
			if(defaultValue==null) {
				//如果没有默认值 就输出JBolt 开发平台
				outputText(writer,"JBolt 开发平台:JBolt");
			}else {
				//如果有默认值
				outputByType(writer,defaultValue.toString());
			}
		}else {
			outputByType(writer,globalConfig.getConfigValue());
		}
		


	}

}
