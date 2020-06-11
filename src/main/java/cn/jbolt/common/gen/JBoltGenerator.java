package cn.jbolt.common.gen;

import java.util.List;

import javax.sql.DataSource;

import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.activerecord.dialect.PostgreSqlDialect;
import com.jfinal.plugin.activerecord.dialect.SqlServerDialect;
import com.jfinal.plugin.activerecord.generator.Generator;
import com.jfinal.plugin.activerecord.generator.TableMeta;

import cn.hutool.core.util.StrUtil;
import cn.jbolt.common.db.sql.DBType;
/**
 * 生成器主体
 * @ClassName:  JBoltGenerator   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年12月11日   
 */
public class JBoltGenerator extends Generator {
	private JBoltMetaBuilder metaBuilder;
	public JBoltGenerator(DataSource dataSource) {
		super(dataSource, new JBoltBaseModelGenerator(JBoltProjectGenConfig.baseModelPackageName, JBoltProjectGenConfig.baseModelOutputDir),
				new JBoltModelGenerator(JBoltProjectGenConfig.modelPackageName, JBoltProjectGenConfig.baseModelPackageName, JBoltProjectGenConfig.modelOutputDir));
		this.setMappingKitGenerator(
				new JBoltMappingKitGenerator(modelGenerator.getModelPackageName(), modelGenerator.getModelOutputDir()));
		this.setDataDictionaryGenerator(
				new JBoltDataDictionaryGenerator(dataSource, modelGenerator.getModelOutputDir()));
		switch (JBoltProjectGenConfig.dbType) {
			case DBType.MYSQL:
				setDialect(new MysqlDialect());
				metaBuilder = new JBoltMetaBuilder(dataSource);
				break;
			case DBType.ORACLE:
				setDialect(new JBoltOracleDialect());
				metaBuilder = new _JBoltOracleMetaBuilder(dataSource);
				break;
			case DBType.SQLSERVER:
				setDialect(new SqlServerDialect());
				metaBuilder = new _JBoltSqlServerMetaBuilder(dataSource);
				break;
			case DBType.POSTGRESQL:
				setDialect(new PostgreSqlDialect());
				metaBuilder = new JBoltMetaBuilder(dataSource);
				String schemaPattern=getPostGresqlSchema(JBoltProjectGenConfig.jdbcUrl);
				if(schemaPattern!=null) {
					metaBuilder.setSchemaPattern(schemaPattern);
				}
				break;
				
		}
		if(metaBuilder==null) {
			throw new RuntimeException("目前只支持Mysql、Oracle、SqlServer、Postgresql四个数据库");
		}
		metaBuilder.filter(JBoltProjectGenConfig.filterPredicate);
		setMetaBuilder(metaBuilder);
		
	}

	private String getPostGresqlSchema(String jdbcUrl) {
		if(jdbcUrl.indexOf("currentSchema")!=-1) {
			String schemaname=jdbcUrl.substring(jdbcUrl.lastIndexOf("currentSchema")+13).replace("=", "").trim();
			if(StrUtil.isNotBlank(schemaname)) {
				return schemaname;
			}
		}
		return null;
	}


	@Override
	public void generate() {
		JBoltConsoleUtil.printJboltcn();
		JBoltConsoleUtil.printMessage(
				"=========================JBolt Generator:JFinal Model Generator:Start=========================");
		JBoltConsoleUtil.printMessageWithDate(" JBolt Generate Start");
		if (dialect != null) {
			metaBuilder.setDialect(dialect);
		}

		long start = System.currentTimeMillis();
		List<TableMeta> allMatas = metaBuilder.build();
		if (allMatas.size() == 0) {
			JBoltConsoleUtil.printMessageWithDate(" TableMeta 数量为 0，不生成任何文件");
			return;
		}
		baseModelGenerator.generate(allMatas);
		if (modelGenerator != null) {
			modelGenerator.generate(allMatas);
		}
		if (mappingKitGenerator != null) {
			mappingKitGenerator.generate(allMatas);
		}
		if (dataDictionaryGenerator != null && generateDataDictionary) {
			dataDictionaryGenerator.generate(allMatas);
		}
		long usedTime = (System.currentTimeMillis() - start) / 1000;
		JBoltConsoleUtil.printMessageWithDate(" JBolt Generate complete in " + usedTime + " seconds.");
		JBoltConsoleUtil.printMessage(
				"=========================JBolt Generator:JFinal Model Generator:Done=========================");
	}

	 

}
