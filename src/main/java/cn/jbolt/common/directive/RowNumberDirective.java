package cn.jbolt.common.directive;

import java.io.IOException;

import com.jfinal.template.Directive;
import com.jfinal.template.Env;
import com.jfinal.template.expr.ast.Expr;
import com.jfinal.template.expr.ast.ExprList;
import com.jfinal.template.io.Writer;
import com.jfinal.template.stat.ParseException;
import com.jfinal.template.stat.Scope;
/**
 * 行号
 * @ClassName:  RowNumberDirective   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月8日   
 */
public class RowNumberDirective extends Directive {
	
	private Expr countExpr;
	private Expr pageNumberExpr;
	private Expr pageSizeExpr;
	private int paraNum;
	
	public void setExprList(ExprList exprList) {
		this.paraNum = exprList.length();
		if (paraNum !=3) {
			throw new ParseException("Wrong number parameter of #rownumber directive, three parameters", location);
		}
		
		this.countExpr  = exprList.getExpr(0);
		this.pageNumberExpr  = exprList.getExpr(1);
		this.pageSizeExpr  = exprList.getExpr(2);
	}
	
	public void exec(Env env, Scope scope, Writer writer) {
		Object count=this.countExpr.eval(scope);
		Object pageNumber=this.pageNumberExpr.eval(scope);
		Object pageSize=this.pageSizeExpr.eval(scope);
		try {
			writer.write(Integer.parseInt(count.toString())+((Integer.parseInt(pageNumber.toString())-1)*Integer.parseInt(pageSize.toString())));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
}
