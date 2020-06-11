package cn.jbolt.common.directive;

import com.jfinal.kit.StrKit;
import com.jfinal.template.Directive;
import com.jfinal.template.Env;
import com.jfinal.template.expr.ast.Expr;
import com.jfinal.template.expr.ast.ExprList;
import com.jfinal.template.io.Writer;
import com.jfinal.template.stat.ParseException;
import com.jfinal.template.stat.Scope;
/**
 * action地址判断与转换
 * @ClassName:  ActionDirective   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年2月28日   
 */
public class ActionDirective extends Directive {
	
	private Expr valueExpr;
	private Expr defaultValueExpr;
	private int paraNum;
	
	public void setExprList(ExprList exprList) {
		this.paraNum = exprList.length();
		if (paraNum ==0) {
			throw new ParseException("Wrong number parameter of #action directive, one parameters allowed at most", location);
		}else if (paraNum == 1) {
			this.valueExpr  = exprList.getExpr(0);
		}else if (paraNum == 2) {
			this.valueExpr  = exprList.getExpr(0);
			this.defaultValueExpr  = exprList.getExpr(1);
		} 
	}
	
	public void exec(Env env, Scope scope, Writer writer) {
		if (paraNum == 0) {
			write(writer, "");
		} else{
			outputValue(env, scope, writer);
		}
	}
	/**
	 * 输出处理后的value值
	 * @param env
	 * @param scope
	 * @param writer
	 */
	private void outputValue(Env env,Scope scope, Writer writer) {
		Object value=this.valueExpr.eval(scope);
		String action=null;
		if(value==null) {
			if(this.paraNum==2) {
				Object defaultValue=this.defaultValueExpr.eval(scope);
				action=(defaultValue==null?"":defaultValue.toString().trim());
			}
		}else {
			 action=value.toString().trim();
		}
		if(StrKit.isBlank(action)){
			write(writer, "");
		}else {
			if(action.charAt(0)=='/'&&action.charAt(1)!='/') {
				write(writer, action.substring(1));
			}else {
				write(writer, action);
			}
		}
		
	}
	
	
	
	
}
