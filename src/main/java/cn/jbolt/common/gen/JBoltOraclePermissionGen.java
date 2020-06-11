package cn.jbolt.common.gen;

import java.util.List;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.activerecord.dialect.OracleDialect;
import com.jfinal.plugin.druid.DruidPlugin;

public class JBoltOraclePermissionGen {
public static void main(String[] args) {
	DruidPlugin mysqlPlugin=new DruidPlugin("jdbc:mysql://127.0.0.1:3306/jbolt?characterEncoding=utf8&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai", "root", "root");
	mysqlPlugin.start();
	ActiveRecordPlugin mysqlArp = new ActiveRecordPlugin("mysql", mysqlPlugin);
	mysqlArp.setDialect(new MysqlDialect());
	mysqlArp.start();
	
	DruidPlugin oraclePlugin=new DruidPlugin("jdbc:oracle:thin:@127.0.0.1:1521:ORCL", "scott", "tiger");
	oraclePlugin.start();
	ActiveRecordPlugin oracleArp = new ActiveRecordPlugin("oracle",oraclePlugin);
	oracleArp.setContainerFactory(new CaseInsensitiveContainerFactory(true));
	oracleArp.setDialect(new OracleDialect());
	oracleArp.start();
	
	List<Record> parantList=Db.find("select * from jb_permission order by id asc");
	Db.use("oracle").batchSave("jb_permission", parantList, parantList.size());
	
	
	
	
	mysqlPlugin.stop();
	mysqlArp.stop();
	oraclePlugin.stop();
	oracleArp.stop();
}
}
