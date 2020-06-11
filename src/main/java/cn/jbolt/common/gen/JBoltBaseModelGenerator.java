package cn.jbolt.common.gen;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.kit.Kv;
import com.jfinal.plugin.activerecord.generator.BaseModelGenerator;
import com.jfinal.plugin.activerecord.generator.TableMeta;

import cn.jbolt.common.util.RemarkUtil;

/**
 * Base model 生成器
 */
public class JBoltBaseModelGenerator extends BaseModelGenerator{
	@SuppressWarnings("serial")
	protected Map<String, String> javaTypeMap = new HashMap<String, String>() {{
		put("java.lang.String", "String");
		put("java.lang.Integer", "Integer");
		put("java.util.Date", "Date");
		put("java.sql.Time", "Time");
		put("java.lang.Boolean", "Boolean");
		put("java.math.BigDecimal", "BigDecimal");
		put("java.lang.Long", "Long");
		put("java.lang.Double", "Double");
	}};
	public JBoltBaseModelGenerator(String baseModelPackageName, String baseModelOutputDir) {
		super(baseModelPackageName, baseModelOutputDir);
		getterTypeMap.put("java.lang.Boolean", "getBoolean");
		getterTypeMap.put("java.sql.Time", "getTime");
		getterTypeMap.put("java.util.Date", "getDate");
	}
	
	@Override
	protected void initEngine() {
		super.initEngine();
		engine.addSharedMethod(new RemarkUtil());
		engine.setDevMode(true);
		setTemplate("/gentpl/base_model_template.jf");
	}
	@Override
	public void generate(List<TableMeta> tableMetas) {
		JBoltConsoleUtil.printMessage("-------------------------Base Model-------------------------");
		JBoltConsoleUtil.printMessageWithDate(" Generate Base Model :Starting ...");
		JBoltConsoleUtil.printMessageWithDate(" Base Model Output Dir: " + baseModelOutputDir);
		JBoltConsoleUtil.printMessageWithDate(" JBolt Base Model Generator is Working...");
		for (TableMeta tableMeta : tableMetas) {
			genBaseModelContent(tableMeta);
		}
		writeToFile(tableMetas);
		JBoltConsoleUtil.printMessageWithDate(" Generate Base Model :Done ...");
	}
	
	@Override
	protected void genBaseModelContent(TableMeta tableMeta) {
		JBoltConsoleUtil.printMessageWithDate(" Generate Base Model:"+baseModelPackageName+"."+tableMeta.baseModelName);
		Kv data = Kv.by("baseModelPackageName", baseModelPackageName);
		data.set("generateChainSetter", generateChainSetter);
		data.set("tableMeta", tableMeta);
		data.set("charToBoolean", JBoltProjectGenConfig.charToBoolean);
		data.set("extendsJBoltBaseModel",JBoltProjectGenConfig.baseModelExtendsJBoltBaseModel);
		data.set("javaTypeMap", javaTypeMap);
		tableMeta.baseModelContent = engine.getTemplate(template).renderToString(data);
	}
	
}






