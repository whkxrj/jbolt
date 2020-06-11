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
 * 用户性别转换指令
 * @ClassName:  SexDirective   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月8日   
 */
public class SexDirective extends Directive {
	
	private Expr valueExpr;
	private Expr typeExpr;
	private int type;//1 文字 2 图
	private int paraNum;
	
	public void setExprList(ExprList exprList) {
		this.paraNum = exprList.length();
		if (paraNum ==0) {
			throw new ParseException("Wrong number parameter of #sex directive, one parameters at least", location);
		}else if (paraNum == 1) {
			this.valueExpr  = exprList.getExpr(0);
			this.type=1;
		}else if (paraNum == 2) {
			this.valueExpr  = exprList.getExpr(0);
			this.typeExpr  = exprList.getExpr(1);
			if(typeExpr!=null) {
				String str=typeExpr.toString().trim();
				if(StrKit.isBlank(str)) {
					this.type=1;
				}else {
					this.type=Integer.parseInt(str);
					if(type!=1&&type!=2) {
						throw new ParseException("The second parameter must be 1 or 2, 1-text,2-img", location);
					}
				}
			}
		} else {
			throw new ParseException("Wrong number parameter of #sex directive, two parameters allowed at most", location);
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
		if(value!=null&&value.toString().length()>0){
				String sexValue=value.toString();
				String name="参数异常";
				switch (sexValue) {
				case "1":
					name=(type==1?"男":"<i class='fa fa-mars text-primary font20' tooltip data-title='男'></i>");
					break;
				case "2":
					name= (type==1?"女":"<i class='fa fa-venus text-danger font20' tooltip data-title='女'></i>");
					break;
				case "0":
					name= (type==1?"未知":"<i class='fa fa-minus-circle text-dark font20' tooltip data-title='未知'></i>");
					break;
				}
				write(writer, name);
		}
		
	}
	
	
	
	
}
