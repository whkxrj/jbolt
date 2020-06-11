package cn.jbolt.base;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.jfinal.aop.Inject;
import com.jfinal.kit.Kv;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.Ret;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.DbKit;

import cn.jbolt._admin.systemlog.SystemLogService;
import cn.jbolt.common.config.MainConfig;
import cn.jbolt.common.config.Msg;
import cn.jbolt.common.db.sql.DBType;
import cn.jbolt.common.model.SystemLog;
import cn.jbolt.common.util.CACHE;

/**
 * Service底层通用封装
 * 
 * @ClassName: CommonService
 * @author: JFinal学院-小木 QQ：909854136
 * @date: 2019年12月10日
 */
public abstract class JBoltCommonService extends JBoltCommonServiceAdapter{
	protected static final Log LOG = Log.getLog(JBoltCommonService.class);
	@Inject
	protected SystemLogService systeLogService;
	/**
	 * 成功消息默认返回值
	 */
	protected static final Ret SUCCESS = Ret.ok("msg", Msg.SUCCESS);
	/**
	 * 失败消息默认返回值
	 */
	protected static final Ret FAIL = Ret.fail("msg", Msg.FAIL);

	/**
	 * 设置失败返回消息
	 * 
	 * @param msg
	 * @return
	 */
	protected Ret fail(String msg) {
		return Ret.fail("msg", msg);
	}

	/**
	 * 自动判断返回值
	 * 
	 * @param success
	 * @return
	 */
	protected Ret ret(boolean success) {
		return success ? SUCCESS : FAIL;
	}
	/**
	 * 过来返回值 model专用
	 * @param ret
	 * @param columns
	 * @return
	 */
	protected Ret filterModelRet(Ret ret,String... columns) {
		if(columns==null) {
			return ret;
		}
		JBoltBaseModel<? extends JBoltBaseModel<?>> myModel=ret.getAs("data");
		if(columns.length==1) {
			ret.set("data",myModel.get(columns[0]));
		}else {
			Kv kv=Kv.create();
			for(String column:columns) {
				kv.set("column",myModel.get(column));
			}
			ret.set("data",kv);
		}
		return ret;
	}

	/**
	 * 设置成功返回消息
	 * 
	 * @param msg
	 * @return
	 */
	protected Ret success(String msg) {
		return Ret.ok("msg", msg);
	}

	/**
	 * 设置成功返回消息 设置返回data
	 * 
	 * @param data
	 * @return
	 */
	protected Ret successWithData(Object data) {
		return Ret.ok("data", data);
	}

	/**
	 * 设置成功返回值带着数据和消息
	 * 
	 * @param data
	 * @param msg
	 * @return
	 */
	protected Ret success(Object data, String msg) {
		return Ret.ok("msg", msg).set("data", data);
	}

	/**
	 * 调用日志服务 添加日志信息 操作类型是Save
	 * 
	 * @param targetId   关联操作目标数据的ID
	 * @param userId     操作人
	 * @param targetType 操作目标的ID
	 * @param modelName  操作目标的具体数据的名字
	 */
	protected void addSaveSystemLog(Object targetId, Object userId, int targetType, String modelName) {
		addSystemLog(targetId, userId, SystemLog.TYPE_SAVE, targetType, modelName, null);
	}

	/**
	 * 调用日志服务 添加日志信息 操作类型是Update
	 * 
	 * @param targetId   关联操作目标数据的ID
	 * @param userId     操作人
	 * @param targetType 操作目标的ID
	 * @param modelName  操作目标的具体数据的名字
	 */
	protected void addUpdateSystemLog(Object targetId, Object userId, int targetType, String modelName) {
		addSystemLog(targetId, userId, SystemLog.TYPE_UPDATE, targetType, modelName, null);
	}

	/**
	 * 调用日志服务 添加日志信息 操作类型是Update
	 * 
	 * @param targetId   关联操作目标数据的ID
	 * @param userId     操作人
	 * @param targetType 操作目标的ID
	 * @param modelName  操作目标的具体数据的名字
	 * @param append     额外信息
	 */
	protected void addUpdateSystemLog(Object targetId, Object userId, int targetType, String modelName, String append) {
		addSystemLog(targetId, userId, SystemLog.TYPE_UPDATE, targetType, modelName, append);
	}

	/**
	 * 调用日志服务 添加日志信息 操作类型是Delete
	 * 
	 * @param targetId   关联操作目标数据的ID
	 * @param userId     操作人
	 * @param targetType 操作目标的ID
	 * @param modelName  操作目标的具体数据的名字
	 */
	protected void addDeleteSystemLog(Object targetId, Object userId, int targetType, String modelName) {
		addSystemLog(targetId, userId, SystemLog.TYPE_DELETE, targetType, modelName, null);
	}

	/**
	 * 调用日志服务 添加日志信息
	 * 
	 * @param targetId   关联操作目标数据的ID
	 * @param userId     操作人
	 * @param type       操作类型
	 * @param targetType 操作目标的ID
	 * @param modelName  操作目标的具体数据的名字
	 */
	protected void addSystemLog(Object targetId, Object userId, int type, int targetType, String modelName) {
		addSystemLog(targetId, userId, type, targetType, modelName, null);
	}

	/**
	 * 调用日志服务 添加日志信息
	 * 
	 * @param targetId   关联操作目标数据的ID
	 * @param userId     操作人
	 * @param type       操作类型
	 * @param targetType 操作目标的ID
	 * @param modelName  操作目标的具体数据的名字
	 * @param append     额外信息
	 */
	protected void addSystemLog(Object targetId, Object userId, int type, int targetType, String modelName,
			String append) {
		String userName = CACHE.me.getUserName(userId);
		String userUsername = CACHE.me.getUserUsername(userId);
		StringBuilder title = new StringBuilder();
		title.append("<span class='text-danger'>[").append(userName).append("(").append(userUsername).append(")").append("]</span>")
				.append(SystemLogService.typeName(type)).append(SystemLogService.targetTypeName(targetType))
				.append("<span class='text-danger'>[").append(modelName).append("]</span>");
		if (StrKit.notBlank(append)) {
			title.append(append);
		}
		// 调用底层方法
		addSystemLogWithTitle(targetId, userId, type, targetType, title.toString());
	}

	/**
	 * 调用日志服务 添加日志信息
	 * 
	 * @param targetId
	 * @param userId
	 * @param type
	 * @param targetType
	 * @param title
	 */
	protected void addSystemLogWithTitle(Object targetId, Object userId, int type, int targetType, String title) {
		String userName = CACHE.me.getUserName(userId);
		systeLogService.saveLog(type, targetType, targetId, title.toString(), 0, userId, userName);
	}

	 
	/**
	 * 创建id自增序列
	 * 
	 * @param tableName
	 * @return
	 */
	protected boolean createIdSequence(String tableName) {
		String sql = null;
		switch (MainConfig.DB_TYPE) {
		case DBType.ORACLE:
			sql = "create sequence %s_idsq";
			break;
		case DBType.POSTGRESQL:
			sql = "create sequence %s_id_seq";
			break;
		}
		return jdbcExeSql(String.format(sql, tableName));
	}

	/**
	 * 创建分表
	 * 
	 * @param newTableName
	 * @param mainTableName
	 * @return
	 */
	protected boolean createTheTable(String newTableName, String mainTableName) {
		String sql = null;
		switch (MainConfig.DB_TYPE) {
		case DBType.MYSQL:
			sql = "create table " + newTableName + " LIKE " + mainTableName;
			break;
		case DBType.POSTGRESQL:
			sql = "create table " + newTableName + " (LIKE " + mainTableName + ")";
			break;
		case DBType.SQLSERVER:
			sql = "select  * into " + newTableName + " from " + mainTableName;
			break;
		case DBType.ORACLE:
			sql = "create table " + newTableName + " as select * from " + mainTableName + " where 1=2";
			break;
		}
		boolean success = jdbcExeSql(sql);
		if (success == false) {
			return false;
		}
		return tableExist(newTableName);
	}

	private boolean jdbcExeSql(String sql) {
		Connection connection = null;
		Statement statement = null;
		try {
			connection = DriverManager.getConnection(PropKit.get("jdbc_url"), PropKit.get("user"),
					PropKit.get("password"));
			if (connection == null) {
				return false;
			}
			statement = connection.createStatement();
			statement.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return true;
	}

	/**
	 * 检测表是否存在
	 * 
	 * @param tableName
	 * @return
	 */
	protected boolean tableExist(String tableName) {
		if (MainConfig.DB_TYPE.equals(DBType.ORACLE)) {
			tableName = tableName.toUpperCase();
		}
		boolean flag = false;
		try {
			Connection connection = DbKit.getConfig().getConnection();
			DatabaseMetaData meta = connection.getMetaData();
			String type[] = { "TABLE" };
			ResultSet rs = meta.getTables(null, null, tableName, type);
			flag = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return flag;
	}
}
