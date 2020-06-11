package cn.jbolt.common.gen;

import java.util.Set;

import cn.hutool.core.util.ClassUtil;
import cn.hutool.core.util.StrUtil;
/**
 * 用于生成oracle里的对应序列和触发器
 * @ClassName:  OracleInitSqlGen   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年12月15日   
 */
public class JBoltOracleInitSqlGen {
	private static final String packageName="cn.jbolt.common.model.base";
	public static void genSequenceSql(Set<Class<?>> classes) {
		
		for(Class<?> clazz:classes) {
			System.out.println(String.format("create sequence %s_idsq;",StrUtil.toSymbolCase(clazz.getSimpleName().replace("Base", "jb"), '_')));
		}
	}
	public static void genTriggerSql(Set<Class<?>> classes) {
		String tableName=null;
		String objName=null;
		for(Class<?> clazz:classes) {
			objName=StrUtil.toSymbolCase(clazz.getSimpleName().replace("Base", ""), '_');
			tableName=StrUtil.toSymbolCase(clazz.getSimpleName().replace("Base", "jb"), '_');
			System.out.println(String.format("create or replace trigger %s_nxtid_tg\r\n" + 
					"before insert on %s for each row\r\n" + 
					"begin\r\n" + 
					"select %s_id_seq.nextval into:new.id from dual;\r\n" + 
					"end;",objName,tableName,objName));
		}
	}
	public static void gen() {
		Set<Class<?>> classes=ClassUtil.scanPackage(packageName);
		genSequenceSql(classes);
//		genTriggerSql(classes);
	}
	public static void main(String[] args) {
		JBoltOracleInitSqlGen.gen();
	}
}
