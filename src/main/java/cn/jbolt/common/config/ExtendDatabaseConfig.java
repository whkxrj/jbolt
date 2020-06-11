package cn.jbolt.common.config;

import java.time.Duration;
import java.util.List;

import com.alibaba.druid.filter.logging.Slf4jLogFilter;
import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.wall.WallFilter;
import com.jfinal.config.Plugins;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.dialect.AnsiSqlDialect;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.activerecord.dialect.OracleDialect;
import com.jfinal.plugin.activerecord.dialect.PostgreSqlDialect;
import com.jfinal.plugin.activerecord.dialect.SqlServerDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.template.Engine;
import com.jfinal.template.source.ClassPathSourceFactory;

import cn.hutool.setting.Setting;
import cn.hutool.setting.SettingUtil;
import cn.jbolt.common.db.sql.DBType;
import cn.jbolt.common.db.sql.SqlUtil;
import cn.jbolt.common.directive.LikeValueDirective;
import cn.jbolt.common.directive.SqlValueDirective;

/**
 * JBolt主库之外的其他数据库配置管理
 * @ClassName:  ExtendDatabaseConfig   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月3日   
 */
public class ExtendDatabaseConfig {
	private final static String CONFIG_FILE_NAME="db_mine.setting";
	private Setting setting;
	private static final ExtendDatabaseConfig me = new ExtendDatabaseConfig();
	public static ExtendDatabaseConfig me() {
		return me;
	}
	private ExtendDatabaseConfig() {
		setting=SettingUtil.get("dbconfig/"+MainConfig.DB_TYPE+"/"+CONFIG_FILE_NAME);
	}
	/**
	 * 核心配置
	 * @param me
	 */
	public void config(Plugins me) {
		if(setting==null||setting.isEmpty()) {throw new RuntimeException("请配置db_mine.setting");}
		List<String> groups=setting.getGroups();
		for(String group:groups) {
			configDbPlugin(me,group,setting.getSetting(group));
		}
	}
	
	
	/**
	 * 设置方言
	 * @param arp
	 * @param dbType 
	 */
	public static void setDialect(ActiveRecordPlugin arp, String dbType) {
		switch (dbType) {
		case DBType.MYSQL:
			arp.setDialect(new MysqlDialect());
			break;
		case DBType.ORACLE:
			arp.setDialect(new OracleDialect());
			break;
		case DBType.SQLSERVER:
			arp.setDialect(new SqlServerDialect());
			break;
		case DBType.POSTGRESQL:
			arp.setDialect(new PostgreSqlDialect());
			break;
		default:
			arp.setDialect(new AnsiSqlDialect());
			break;
		}
	}
	
	/**
	 * 配置数据库连接池等插件信息
	 * @param plugins
	 * @param configName
	 * @param dbSetting
	 */
	private void configDbPlugin(Plugins plugins,String configName,Setting dbSetting) {
		//配置数据库连接池插件
		DruidPlugin dbPlugin=createDruidPlugin(dbSetting);
		plugins.add(dbPlugin);
		//orm映射 配置ActiveRecord插件
		ActiveRecordPlugin arp=new ActiveRecordPlugin(configName,dbPlugin);
		//设置方言
		setDialect(arp,dbSetting.getStr("db_type","mysql"));
		
		/********在此添加数据库 表-Model 映射*********/
		//设置加载位置
		Engine sqlEngine=arp.getEngine();
		sqlEngine.setSourceFactory(new ClassPathSourceFactory());
		sqlEngine.addDirective("sqlValue", SqlValueDirective.class);
		sqlEngine.addDirective("likeValue", LikeValueDirective.class);
		sqlEngine.addSharedObject("SqlUtil", new SqlUtil());
		//设置不区分大小写
		arp.setContainerFactory(new CaseInsensitiveContainerFactory(true));
		//配置加载Sql模板的具体路径
		arp.addSqlTemplate("/sql/"+dbSetting.getStr("db_type","mysql")+"/all_sqls.sql");
		//配置模板热加载
		sqlEngine.setDevMode(dbSetting.getBool("dev_mode", false));
		
		
		//添加到插件列表中
		plugins.add(dbPlugin);
		plugins.add(arp);
	}
	
	/**
	 * 创建一个Druid配置插件
	 * @param dbSetting 
	 * @return
	 */
	public static DruidPlugin createDruidPlugin(Setting dbSetting) {
		DruidPlugin druidPlugin=new DruidPlugin(dbSetting.get("jdbc_url"), dbSetting.get("user"), dbSetting.get("password"));
		//配置防火墙
		WallFilter wallFilter = new WallFilter(); // 加强数据库安全
		druidPlugin.addFilter(wallFilter);
		//统计监控的过滤器
		StatFilter statFilter=new StatFilter();
		statFilter.setMergeSql(true);
		statFilter.setLogSlowSql(true);
		statFilter.setSlowSqlMillis(Duration.ofMillis(1000).toMillis());
		//添加 StatFilter 才会有统计数据
		druidPlugin.addFilter(statFilter);    
		
		
		// 2.日志插件
		   // 保存DruidDataSource的监控记录,设置打印日志周期,默认使用DruidDataSourceStatLoggerImpl
		   // DruidPlugin未暴露setTimeBetweenLogStatsMillis(),只能使用properties方法设置
		druidPlugin.setConnectionProperties("druid.timeBetweenLogStatsMillis="+ Duration.ofHours(24).toMillis());
	    Slf4jLogFilter slf4jLogFilter = new Slf4jLogFilter();
	    slf4jLogFilter.setConnectionLogEnabled(false);
	    slf4jLogFilter.setResultSetLogEnabled(false);
	    slf4jLogFilter.setStatementParameterSetLogEnabled(false);
	    slf4jLogFilter.setConnectionLogEnabled(false);
	    slf4jLogFilter.setResultSetCloseAfterLogEnabled(false);
	    slf4jLogFilter.setConnectionCloseAfterLogEnabled(false);
	    slf4jLogFilter.setStatementParameterClearLogEnable(false);
	    slf4jLogFilter.setStatementPrepareAfterLogEnabled(false);
	    slf4jLogFilter.setStatementPrepareCallAfterLogEnabled(false);
	    slf4jLogFilter.setStatementCreateAfterLogEnabled(false);
	    slf4jLogFilter.setStatementCloseAfterLogEnabled(false);
	    
	    //设置输出执行后的日志 带执行耗时等信息
	    slf4jLogFilter.setStatementExecuteAfterLogEnabled(false);
	    //设置批量操作执行后的日志 带执行耗时等信息
	    slf4jLogFilter.setStatementExecuteBatchAfterLogEnabled(false);
	    //设置查询操作执行后的日志 带执行耗时等信息
	    slf4jLogFilter.setStatementExecuteQueryAfterLogEnabled(false);
	    //设置更新 插入 删除 操作执行后的日志 带执行耗时等信息
	    slf4jLogFilter.setStatementExecuteUpdateAfterLogEnabled(false);
	    //输出完整的SQL 将值替换掉问号，这个仅在开发模式下有效
	    slf4jLogFilter.setStatementExecutableSqlLogEnable(dbSetting.getBool("dev_mode", false));
	    
	    druidPlugin.addFilter(slf4jLogFilter);
		 if(dbSetting.getStr("db_type","mysql").equals(DBType.MYSQL)) {
			//指定初始化 编码为utf8mb4 
			druidPlugin.setConnectionInitSql("set names utf8mb4");
		 }
		return druidPlugin;
	}
}
