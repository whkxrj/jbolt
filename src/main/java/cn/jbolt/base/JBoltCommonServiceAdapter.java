package cn.jbolt.base;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.jfinal.kit.Kv;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;

import cn.jbolt.base.para.IJBoltParaValidator;
import cn.jbolt.base.para.JBoltParaValidator;
import cn.jbolt.common.config.MainConfig;
import cn.jbolt.common.config.PageSize;
import cn.jbolt.common.db.sql.DBType;
import cn.jbolt.common.db.sql.Sql;
import cn.jbolt.common.db.sql.SqlUtil;
import cn.jbolt.common.util.DateUtil;
/**
 * 全局Service最底层基类实现封装
 * @ClassName:  CommonServiceAdapter   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月16日   
 */
public class JBoltCommonServiceAdapter implements IJBoltParaValidator {
	/**
	 * 空分页数据返回值
	 */
	protected static final Page EMPTY_PAGE = new Page(Collections.EMPTY_LIST, 1, PageSize.PAGESIZE_ADMIN_LIST, 0, 0);
	public Page getEmptyPage(){
		return EMPTY_PAGE;
	}
	/**
	 * 添加拼接like
	 * 
	 * @param column
	 */
	protected String columnLike(String column) {
		if (notOk(column)) {
			return " like ''";
		}
		if (column.indexOf("'") != -1) {
			column = column.replace("'", "''");
		}
		return " like '%" + column + "%'";
	}

	 
	/**
	 * 更新同级删除数据之后数据的排序
	 * 
	 * @param sortRank
	 */
	protected void updateSortRankAfterDelete(String table, Integer sortRank) {
		updateSortRankAfterDelete(table, null, sortRank);
	}

	/**
	 * 更新同级删除数据之后数据的排序
	 * 
	 * @param params
	 * @param sortRank
	 */
	protected void updateSortRankAfterDelete(String table, Kv params, Integer sortRank) {
		if (params == null || params.isEmpty()) {
			Db.update("update " + table + " set sort_rank=sort_rank-1 where sort_rank>?", sortRank);
		} else {
			StringBuilder sb = new StringBuilder();
			sb.append(" 1=1 ");
			int size = params.size();
			Object[] paramArray = new Object[size + 1];
			int i = 0;
			for (Object key : params.keySet()) {
				sb.append(" and ").append(key.toString()).append("=? ");
				paramArray[i] = params.get(key.toString());
				i++;
			}
			paramArray[size] = sortRank;
			Db.update("update " + table + " set sort_rank=sort_rank-1 where " + sb.toString() + " and sort_rank>?",
					paramArray);
		}
	}

	/**
	 * 查询一个字段
	 * 
	 * @param sql
	 * @return
	 */
	protected <T> T queryColumn(Sql sql) {
		if (sql.isPrepared()) {
			return queryColumn(sql, sql.getWhereValues());
		}
		return queryColumn(sql.toSql());
	}

	/**
	 * 查询一个字段
	 * 
	 * @param <T>
	 * @param sql
	 * @param paras
	 * @return
	 */
	protected <T> T queryColumn(Sql sql, Object... paras) {
		return queryColumn(sql.toSql(), paras);
	}

	/**
	 * 查询一个字段
	 * 
	 * @param <T>
	 * @param sql
	 * @return
	 */
	protected <T> T queryColumn(String sql) {
		return Db.queryColumn(sql);
	}

	/**
	 * 查询一个字段
	 * 
	 * @param <T>
	 * @param sql
	 * @param paras
	 * @return
	 */
	protected <T> T queryColumn(String sql, Object... paras) {
		return Db.queryColumn(sql, paras);
	}

	protected Integer queryInt(Sql sql) {
		if (sql.isPrepared()) {
			return queryInt(sql, sql.getWhereValues());
		}
		return queryInt(sql.toSql());
	}

	protected Integer queryInt(Sql sql, Object... paras) {
		return queryInt(sql.toSql(), paras);
	}

	protected Integer queryInt(String sql) {
		return Db.queryInt(sql);
	}

	protected Integer queryInt(String sql, Object... paras) {
		return Db.queryInt(sql, paras);
	}

	protected void update(Sql sql) {
		if (sql.isPrepared()) {
			update(sql, sql.getWhereValues());
		} else {
			update(sql.toSql());
		}
	}

	protected void update(Sql sql, Object... paras) {
		update(sql.toSql(), paras);
	}

	protected int update(String sql) {
		return Db.update(sql);
	}

	protected int update(String sql, Object... paras) {
		return Db.update(sql, paras);
	}

	protected <T> List<T> query(String sql, Object... paras) {
		return Db.query(sql, paras);
	}

	protected <T> List<T> query(String sql) {
		return Db.query(sql);
	}

	protected <T> List<T> query(Sql sql) {
		if (sql.isPrepared()) {
			return query(sql.toSql(), sql.getWhereValues());
		}
		return query(sql.toSql());
	}

	protected <T> List<T> query(Sql sql, Object... paras) {
		return query(sql.toSql(), paras);
	}

	protected Object TRUE() {
		return SqlUtil.TRUE();
	}

	protected Object FALSE() {
		return SqlUtil.FALSE();
	}

	/**
	 * 判断Object参数有效性
	 * 
	 * @param param
	 */
	public boolean isOk(Object param) {
		return JBoltParaValidator.isOk(param);
	}

	/**
	 * 判断Object参数是否无效
	 */
	public boolean notOk(Object param) {
		return JBoltParaValidator.notOk(param);
	}

	/**
	 * 判断上传文件是图片
	 * 
	 * @param isImage
	 */
	public boolean isImage(String contentType) {
		return JBoltParaValidator.isImage(contentType);
	}

	/**
	 * 判断上传文件不是图片
	 * 
	 * @param notImage
	 */
	public boolean notImage(String contentType) {
		return JBoltParaValidator.notImage(contentType);
	}

	/**
	 * 判断上传文件类型不是图片
	 * 
	 * @param file
	 */
	public boolean notImage(UploadFile file) {
		return JBoltParaValidator.notImage(file);
	}

	/**
	 * 判断上传文件类型是否为图片
	 * 
	 * @param file
	 */
	public boolean isImage(UploadFile file) {
		return JBoltParaValidator.isImage(file);
	}

	/**
	 * 判断Object[]数组类型数据是否正确
	 * 
	 * @param param
	 * @return
	 */
	public boolean isOk(Object[] param) {
		return JBoltParaValidator.isOk(param);
	}

	/**
	 * 判断Object[]数组类型数据不正确
	 * 
	 * @param param
	 * @return
	 */
	public boolean notOk(Object[] param) {
		return JBoltParaValidator.notOk(param);
	}

	/**
	 * 转为startTime
	 * 
	 * @param dateTime
	 * @return
	 */
	public String toStartTime(Date startTime) {
		return toDateTime(DateUtil.HHmmssTo000000Str(startTime));
	}

	/**
	 * 转为endTime
	 * 
	 * @param endTime
	 * @return
	 */
	public String toEndTime(Date endTime) {
		return toDateTime(DateUtil.HHmmssTo235959Str(endTime));
	}

	/**
	 * 转为表达式处理date
	 * 
	 * @param dateTime
	 * @return
	 */
	public String toDateTime(String dateTime) {
		if (MainConfig.DB_TYPE.equals(DBType.ORACLE)) {
			return String.format("TO_DATE('%s','yyyy-mm-dd hh24:mi:ss')", dateTime);
		}
		return dateTime;
	}
	@Override
	public boolean notExcel(UploadFile file) {
		return JBoltParaValidator.notExcel(file);
	}
	@Override
	public boolean isExcel(UploadFile file) {
		return JBoltParaValidator.isExcel(file);
	}


}