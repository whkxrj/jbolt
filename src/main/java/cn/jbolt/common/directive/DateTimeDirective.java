package cn.jbolt.common.directive;

import java.io.IOException;
import java.util.Date;

import com.jfinal.template.Directive;
import com.jfinal.template.Env;
import com.jfinal.template.TemplateException;
import com.jfinal.template.expr.ast.Expr;
import com.jfinal.template.expr.ast.ExprList;
import com.jfinal.template.io.Writer;
import com.jfinal.template.stat.ParseException;
import com.jfinal.template.stat.Scope;

import cn.jbolt.common.util.DateUtil;

/**
 * 专门处理时间转换 HTML5原生时间格式的指令
 * 
 * @ClassName: DateTimeDirective
 * @author: JFinal学院-小木 QQ：909854136
 * @date: 2019年10月8日
 */
public class DateTimeDirective extends Directive {

	private Expr valueExpr;
	private Expr datePatternExpr;
	private boolean defaultToday;
	private boolean withT;
	private int paraNum;

	public void setExprList(ExprList exprList) {
		this.paraNum = exprList.length();
		if (paraNum > 3) {
			throw new ParseException("Wrong number parameter of #datetime directive, three parameters allowed at most",
					location);
		}

		if (paraNum == 0) {
			this.valueExpr = null;
			this.datePatternExpr = null;
		} else if (paraNum == 1) {
			this.valueExpr = exprList.getExpr(0);
			this.datePatternExpr = null;
		} else if (paraNum == 2) {
			this.valueExpr = exprList.getExpr(0);
			this.datePatternExpr = exprList.getExpr(1);
		} else if (paraNum == 3) {
			this.valueExpr = exprList.getExpr(0);
			this.datePatternExpr = exprList.getExpr(1);
			this.defaultToday = true;
		}
		this.withT=false;
	}

	public void exec(Env env, Scope scope, Writer writer) {
		if (paraNum == 1) {
			outputWithoutDatePattern(env, scope, writer);
		} else if (paraNum == 2) {
			outputWithDatePattern(env, scope, writer);
		} else if (paraNum == 3) {
			outputWithDatePattern(env, scope, writer);
		} else {
			outputToday(env, writer, scope);
		}
	}

	private void outputToday(Env env, Writer writer, Scope scope) {
		Date date = new Date();
		if (this.paraNum == 1) {
			write(writer, date, env.getEngineConfig().getDatePattern());
		} else if (this.paraNum == 2 || this.paraNum == 3) {
			String datePatternString = processDatePattern(scope);
			write(writer, date, datePatternString);
		}
	}

	private String processDatePattern(Scope scope) {
		Object datePattern = this.datePatternExpr.eval(scope);
		String datePatternString=null;
		if (datePattern instanceof String) {
			datePatternString = datePattern.toString();
			if(datePatternString.indexOf("T")!=-1) {
				this.withT=true;
				datePatternString=datePatternString.replaceAll("T", " ");
			}
		} else {
			throw new TemplateException("The sencond parameter datePattern of #datetime directive must be String",
					location);
		}
		return datePatternString;
	}

	/**
	 * 输出空字符
	 * 
	 * @param env
	 * @param writer
	 */
	private void outputNothing(Env env, Writer writer) {
		try {
			writer.write("");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void outputWithoutDatePattern(Env env, Scope scope, Writer writer) {
		Object value = valueExpr.eval(scope);
		if (value == null || value.toString().trim().length() == 0) {
			outputNothing(env, writer);
		} else if (value instanceof Date) {
			write(writer, (Date) value, env.getEngineConfig().getDatePattern());
		} else {
			Date date = DateUtil.toDate(value.toString(), env.getEngineConfig().getDatePattern());
			if(date==null) {
				outputNothing(env, writer);
			}else {
				write(writer, date, env.getEngineConfig().getDatePattern());
			}
		}
	}

	private void outputWithDatePattern(Env env, Scope scope, Writer writer) {
		Object value = valueExpr.eval(scope);
		if (value == null || value.toString().trim().length() == 0) {
			if (defaultToday) {
				outputToday(env, writer, scope);
			} else {
				outputNothing(env, writer);
			}
			return;
		}
		String datePatternString=processDatePattern(scope);
		
		if (value instanceof Date) {
			write(writer, (Date) value, datePatternString);			
		} else {
			Date date = DateUtil.toDate(value.toString(), datePatternString);
			if(date==null) {
				outputNothing(env, writer);
			}else {
				write(writer, date, datePatternString);
			}
		}
	}

	 
	private void write(Writer writer, Date date, String datePattern) {
		try {
			if(withT) {
				writer.write(DateUtil.formatWithT(date, datePattern));
			}else {
				writer.write(DateUtil.format(date, datePattern));
			}
		} catch (IOException e) {
			throw new TemplateException(e.getMessage(), location, e);
		}
	}
}
