package cn.jbolt.common.directive;

import com.jfinal.template.Directive;
import com.jfinal.template.Env;
import com.jfinal.template.expr.ast.Expr;
import com.jfinal.template.expr.ast.ExprList;
import com.jfinal.template.io.Writer;
import com.jfinal.template.stat.ParseException;
import com.jfinal.template.stat.Scope;

import cn.jbolt.common.db.sql.SqlUtil;
/**
 * 解析转换sql模板中的具体值
 * @ClassName:  SqlValueDirective   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年1月29日   
 */
public class SqlValueDirective extends Directive {
	
	private Expr valueExpr;
	private int paraNum;
	
	public void setExprList(ExprList exprList) {
		this.paraNum = exprList.length();
		if (paraNum ==0) {
			throw new ParseException("Wrong number parameter of #sqlValue directive, one parameters allowed at most", location);
		}else
		
			if (paraNum == 1) {
				this.valueExpr  = exprList.getExpr(0);
			} 
	}
	
	public void exec(Env env, Scope scope, Writer writer) {
		write(writer,SqlUtil.sqlValue(this.valueExpr.eval(scope)));
	}
		
}
