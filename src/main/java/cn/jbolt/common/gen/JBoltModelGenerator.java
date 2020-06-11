package cn.jbolt.common.gen;

import java.util.List;

import com.jfinal.plugin.activerecord.generator.ModelGenerator;
import com.jfinal.plugin.activerecord.generator.TableMeta;


/**
 * Model 生成器
 */
public class JBoltModelGenerator extends ModelGenerator {
	public JBoltModelGenerator(String modelPackageName, String baseModelPackageName, String modelOutputDir) {
		super(modelPackageName, baseModelPackageName, modelOutputDir);
	}
	@Override
	protected void initEngine() {
		super.initEngine();
		engine.setDevMode(true);
		setTemplate("/gentpl/model_template.jf");
	}

	@Override
	public void generate(List<TableMeta> tableMetas) {
		JBoltConsoleUtil.printMessage("-------------------------Model-------------------------");
		JBoltConsoleUtil.printMessageWithDate(" Generate Model :Starting ...");
		JBoltConsoleUtil.printMessageWithDate(" Model Output Dir: " + modelOutputDir);
		JBoltConsoleUtil.printMessageWithDate(" JBolt Model Generator is Working...");
		
		for (TableMeta tableMeta : tableMetas) {
			genModelContent(tableMeta);
		}
		writeToFile(tableMetas);
		
		JBoltConsoleUtil.printMessageWithDate(" Generate Model :Done ...");
	}
	@Override
	protected void genModelContent(TableMeta tableMeta) {
		JBoltConsoleUtil.printMessageWithDate(" Generate Model:"+modelPackageName+"."+tableMeta.modelName);
		super.genModelContent(tableMeta);
	}
}


