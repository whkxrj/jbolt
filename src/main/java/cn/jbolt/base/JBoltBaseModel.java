package cn.jbolt.base;

import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;

import cn.hutool.core.util.IdUtil;
import cn.jbolt.common.config.MainConfig;
import cn.jbolt.common.db.sql.DBType;
import cn.jbolt.common.db.sql.Sql;
import cn.jbolt.common.model.User;

/**
 * JBolt Base Model
 * @ClassName: JBoltBaseModel
 * @author: JFinal学院-小木 QQ：909854136
 * @date: 2019年12月5日
 */
@SuppressWarnings("serial")
public abstract class JBoltBaseModel<M extends JBoltBaseModel<M>> extends Model<M> implements IBean {
	protected static final Log LOG = Log.getLog(JBoltBaseModel.class);
	protected static final Log JBOLT_AUTO_CACHE_LOG = Log.getLog("JBoltAutoCacheLog");
	/**
	 * 内置常量 可用于其他数据库标识boolean true
	 */
	protected static final String TRUE = "1";
	/**
	 * 内置常量 可用于其他数据库标识boolean false
	 */
	protected static final String FALSE = "0";
	protected static final String COLUMN_CREATE_TIME = "create_time";
	protected static final String COLUMN_UPDATE_TIME = "update_time";
	protected static final String COLUMN_USER_ID = "user_id";
	protected static final String COLUMN_UPDATE_USER_ID = "update_user_id";
	/**
	 * 配置自动缓存处理
	 */
	private transient String idSequenceName;
	/**
	 * 配置自动缓存处理
	 */
	private transient JBoltAutoCache autoCache;
	/**
	 * 映射表名 不参与序列化
	 */
	private transient String tableName;
	/**
	 * model 对应的数据库表 不参与序列化和持久化
	 */
	private transient Table table;
	/**
	 * 主键类型
	 */
	private transient Class<?> primaryType;
	/**
	 * 主键 不参与数据持久化和序列化
	 */
	private transient String[] primaryKeys;

	public JBoltBaseModel() {
		this.autoCache = this.getClass().getAnnotation(JBoltAutoCache.class);
		_getTableName();
		_getIdSequenceName();
	}
	/**
	 * 得到id序列名
	 * @return
	 */
	public String _getIdSequenceName() {
		if (idSequenceName == null) {
			if(MainConfig.isOracle()) {
				idSequenceName = _getTableName()+"_idsq";
			}else if(MainConfig.isPostgresql()) {
				idSequenceName = _getTableName()+"_id_seq";
			}
		}
		return idSequenceName;
	}

	@Override
	public Boolean getBoolean(String attr) {
		if (this._getUsefulClass().isAnnotationPresent(UnProcessBoolean.class)) {
			return super.getBoolean(attr);
		}
		Object value = _getAttrs().get(attr);
		if (value == null || value.toString().trim().length() == 0) {
			return null;
		}
		// 如果就是Boolean
		if (value instanceof Boolean) {
			return (Boolean) value;
		}
		// 使用String 判断
		String v = value.toString();
		int len = v.length();
		// 长度是1 并且值是1=true 0=false
		if (len == 1) {
			if (v.equals(TRUE)) {
				return true;
			} else if (v.equals(FALSE)) {
				return false;
			}
		} else if (len == 4 && v.equalsIgnoreCase("true")) {
			return true;
		} else if (len == 5 && v.equalsIgnoreCase("false")) {
			return false;
		}

		return (Boolean) value;
	}
	/**
	 * 设置属性值 
	 * @param attr
	 * @param value
	 * @param skipIfError 如果出现错误 直接跳过
	 * @return
	 */
	public M set(String attr , Object value , boolean skipIfError) {
		if (this._getUsefulClass().isAnnotationPresent(UnProcessBoolean.class)) {
			return super.set(attr, value);
		}
		Table table = _getTable(); // table 为 null 时用于未启动 ActiveRecordPlugin 的场景
		if (table != null && !table.hasColumnLabel(attr) && !skipIfError) {
			throw new ActiveRecordException("The attribute name does not exist: \"" + attr + "\"");
		}
		if (MainConfig.DB_TYPE.equals(DBType.MYSQL) == false) {
			if (value != null) {
				if (value instanceof Boolean) {
					value = ((Boolean) value) ? TRUE : FALSE;
				} else if (value instanceof String) {
					String v = value.toString();
					int len = v.length();
					if (len == 4 && v.equalsIgnoreCase("true")) {
						value = TRUE;
					} else if (len == 5 && v.equalsIgnoreCase("false")) {
						value = FALSE;
					}
				}
			}
		}
		put(attr, value);
		_getModifyFlag().add(attr); // Add modify flag, update() need this flag.
		return (M) this;
	
	}

	@Override
	public M set(String attr, Object value) {
		return set(attr, value, false);
	}

	/**
	 * 获取主键名称
	 * 
	 * @return
	 */
	public String _getPrimaryKey() {
		return _getPrimaryKeys()[0];
	}

	/**
	 * 获取Model对应表的所有主键 大概率是一个
	 * 
	 * @return
	 */
	public String[] _getPrimaryKeys() {
		if (primaryKeys != null) {
			return primaryKeys;
		}
		primaryKeys = _getTable(true).getPrimaryKey();

		if (primaryKeys == null) {
			String msg = String.format("primaryKeys == null in [%s]", _getUsefulClass());
			LOG.error(msg);
			throw new RuntimeException(msg);
		}
		return primaryKeys;
	}

	/**
	 * 获取主键类型
	 * 
	 * @return
	 */
	protected Class<?> _getPrimaryType() {
		if (primaryType == null) {
			primaryType = _getTable(true).getColumnType(_getPrimaryKey());
		}
		return primaryType;
	}

	/**
	 * 判断表是否存在指定字段
	 * 
	 * @param columnLabel
	 * @return
	 */
	protected boolean _hasColumn(String columnLabel) {
		return _getTable(true).hasColumnLabel(columnLabel);
	}

	/**
	 * 得到表名
	 * 
	 * @return
	 */
	public String _getTableName() {
		if (tableName == null) {
			tableName = _getTable(true).getName();
		}
		return tableName;
	}

	/**
	 * 得到映射表
	 */
	public Table _getTable() {
		return _getTable(false);
	}

	/**
	 * 获取Model映射数据库表
	 * 
	 * @param validateNull
	 * @return
	 */
	public Table _getTable(boolean validateNull) {
		if (table == null) {
			table = super._getTable();
			if (table == null && validateNull) {
				String msg = String.format(
						"class %s can not mapping to database table,maybe application cannot connect to database. ",
						_getUsefulClass().getName());
				LOG.error(msg);
				throw new RuntimeException(msg);
			}
		}
		return table;
	}
	public void setObjectUserId(Object userId) {
		set(COLUMN_USER_ID, userId , true);
	}
	public void setObjectUpdateUserId(Object updateUserId) {
		set(COLUMN_UPDATE_USER_ID, updateUserId , true);
	}

	/**
	 * 初始化主键
	 */
	private void _initPrimaryKey() {
		//如果是NULL
		if(null == get(_getPrimaryKey())) {
			switch (MainConfig.ID_GEN_MODE) {
			case "snowflake":
				super.set(_getPrimaryKey(), JBoltSnowflakeKit.me.nextId());
				break;
			case "uuid":
				super.set(_getPrimaryKey(), IdUtil.fastSimpleUUID());
				break;
			case "sequence":
				System.out.println("jinlai");
				super.set(_getPrimaryKey(), _sequenceNextId());
				break;
			}
		}
	}
	/**
	 * 拼接序列值
	 * @return
	 */
	private String _sequenceNextId() {
		return _getIdSequenceName()+".nextval";
	}


	@Override
	public boolean update() {
		_autoProcessUpdateTime();
		// 这里如果设置按照列处理的缓存，需要修改执行前判断一下数据库数据和提交数据是否列值相同
		// 如果不同就需要把之前的key缓存删除掉
		boolean updateDbKeyCache = false;
		if (_isKeyCacheEnable()) {
			// 得到修改前的数据
			M m = findByIds(_getIdValue());
			// 拿到column的值 对比一下
			Object dbColumnValue = m.get(this.autoCache.column());
			Object currentColumnValue = get(this.autoCache.column());
			// 看看有没有修改过
			if (dbColumnValue!=null&&StrKit.notBlank(dbColumnValue.toString()) && currentColumnValue!=null&&StrKit.notBlank(currentColumnValue.toString())
					&& dbColumnValue.toString().equals(currentColumnValue.toString()) == false) {
				m.deleteKeyCache();
				updateDbKeyCache = true;
			}
		}
		boolean success = this.superUpdate();

		if (success) {
			if(_isIdCacheEnable()) {
				deleteIdCache();
			}
			// 如果key没有改动就不执行了 改动过才执行
			if (_isKeyCacheEnable()&&updateDbKeyCache == false) {
				deleteKeyCache();
			}
			//额外配置缓存删除
			deleteExtraCache("update");
		}

		return success;
	}
	/**
	 * 额外还需要从其它渠道删除的cache处理 需要自行实现
	 */
	protected void deleteExtraCache(String action) {
		//TODO  额外需要的地方自行覆写实现
	}
	@Override
	public boolean delete() {
		boolean success = superDelete();
		if (success) {
			if(_isIdCacheEnable()) {
				deleteIdCache();
			}
			if(_isKeyCacheEnable()) {
				deleteKeyCache();
			}
			//额外配置缓存删除
			deleteExtraCache("delete");
		}
		return success;
	}

	@Override
	public boolean deleteById(Object idValue) {
		return deleteByIds(idValue);
	}
	/**
	 * 得到ID值
	 * @return
	 */
	public Object[] _getIdValue() {
		String[] pkeys = _getPrimaryKeys();
		if (pkeys.length == 1) {
			return new Object[] { get(pkeys[0]) };
		}
		int len = pkeys.length;
		Object[] values = new Object[len];
		for (int i = 0; i < len; i++) {
			values[i] = get(pkeys[i]);
		}
		return values;
	}
	/**
	 * 得到配置keyCahce的对应column值
	 * @param <T>
	 * @return
	 */
	public <T> T _getKeyValue() {
		if (_isKeyCacheEnable() == false) {
			return null;
		}
		return get(this.autoCache.column());
	}
	/**
	 * 得到配置KeyCache后对应的bingColumn值
	 * @param <T>
	 * @return
	 */
	public <T> T _getKeyBindColumnValue() {
		if (_isKeyCacheEnable() == false) {
			return null;
		}
		return get(this.autoCache.bindColumn());
	}
	/**
	 * 判断是否开启了按ID-Object规则操作缓存
	 * @return
	 */
	public boolean _isIdCacheEnable() {
		return _isAutoCache() && autoCache.idCache();
	}
	/**
	 * 判断是否使用了JBoltAutoCache注解
	 * @return
	 */
	public boolean _isAutoCache() {
		return autoCache != null;
	}
	/**
	 * 判断是否开启了按Key-Object规则操作缓存
	 * @return
	 */
	public boolean _isKeyCacheEnable() {
		return _isAutoCache() && autoCache.keyCache();
	}

	@Override
	public boolean deleteByIds(Object... idValues) {
		M m = findByIds(idValues);
		if (m == null) {
			return false;
		}
		return m.delete();
	}

	/**
	 * 根据主键删除缓存
	 */
	public void deleteIdCache() {
		if (_isIdCacheEnable()) {
			if (_getPrimaryKeys().length == 1) {
				Object idValue = get(_getPrimaryKey());
				deleteCacheById(idValue);
			} else {
				Object[] idvalues = new Object[_getPrimaryKeys().length];
				for (int i = 0; i < idvalues.length; i++) {
					idvalues[i] = get(_getPrimaryKeys()[i]);
				}
				deleteCacheById(idvalues);
			}
		}
	}

	/**
	 * 根据key删除缓存
	 */
	public void deleteKeyCache() {
		deleteCacheByKey(_getKeyValue(), _getKeyBindColumnValue());
	}

	/**
	 * 根据主键删除缓存
	 * 
	 * @param idvalues
	 */
	public void deleteCacheById(Object... idValues) {
		if (_isIdCacheEnable()) {
			safeDeleteByCacheKey(buildIdCacheKey(idValues));
		}
	}

	/**
	 * 根据Key删除缓存
	 * 
	 * @param columValue
	 * @param bindColumnValue
	 */
	public void deleteCacheByKey(Object columValue, Object bindColumnValue) {
		if (_isKeyCacheEnable()) {
			safeDeleteByCacheKey(buildKeyCacheKey(columValue, bindColumnValue));
		}
	}

	/**
	 * 根据ID获取缓存数据
	 * 
	 * @param idValues
	 * @return
	 */
	protected M loadCacheById(Object... idValues) {
		if (_isIdCacheEnable()) {
			try {
				String cacheKey=buildIdCacheKey(idValues);
				M m=CacheKit.get(this.autoCache.name(), cacheKey, new IDataLoader() {
					@Override
					public Object load() {
						M m = JBoltBaseModel.super.findByIds(idValues);
						if (m instanceof User) {
							m.remove("password","pwd_salt");
						}
						return m;
					}
				});
				if(MainConfig.JBOLT_AUTO_CACHE_LOG) {
					JBOLT_AUTO_CACHE_LOG.debug("JBolt loadCacheById Result: cacheKey={}\n{}",cacheKey, JSON.toJSONString(m,true));
				}
				return m;
			} catch (Exception ex) {
				JBOLT_AUTO_CACHE_LOG.error(ex.toString(), ex);
				deleteCacheById(idValues);
			}
		}
		return JBoltBaseModel.super.findByIds(idValues);
	}

	/**
	 * 根据注解指定的column值做key 处理获取缓存数据
	 * 
	 * @param columnValue
	 * @return
	 */
	protected M loadCacheByKey(String columnValue) {
		return loadCacheByKey(columnValue, null);
	}

	/**
	 * 据注解指定的column和bindColumn做key 处理获取缓存数据
	 * 
	 * @param columnValue
	 * @param bindColumnValue
	 * @return
	 */
	protected M loadCacheByKey(String columnValue, Object bindColumnValue) {
		if (this.autoCache == null || StrKit.isBlank(this.autoCache.column()) || StrKit.isBlank(columnValue)) {
			return null;
		}
		try {
			String cacheKey=buildKeyCacheKey(columnValue, bindColumnValue);
			M m=CacheKit.get(this.autoCache.name(), cacheKey,
					new IDataLoader() {
				@Override
				public Object load() {
					M m = findFirstByColumn(autoCache.column(), columnValue, autoCache.bindColumn(),
							bindColumnValue);
					if (m instanceof User) {
						m.remove("password","pwd_salt");
					}
					return m;
				}
			});
			if(MainConfig.JBOLT_AUTO_CACHE_LOG) {
				JBOLT_AUTO_CACHE_LOG.debug("JBolt loadCacheByKey Result: cacheKey={}\n{}",cacheKey, JSON.toJSONString(m,true));
			}
			return m;
		} catch (Exception ex) {
			JBOLT_AUTO_CACHE_LOG.error(ex.toString(), ex);
			deleteCacheByKey(columnValue, bindColumnValue);
		}
		return findFirstByColumn(autoCache.column(), columnValue, autoCache.bindColumn(), bindColumnValue);
	}

	/**
	 * 根据指定列值获取唯一数据
	 * 
	 * @param column
	 * @param columnValue
	 * @return
	 */
	protected M findFirstByColumn(String column, String columnValue, String bindColumn, Object bindColumnValue) {
		Sql sql = Sql.me(MainConfig.DB_TYPE).select().from(tableName).eq(column, columnValue).first().prepared();
		if (StrKit.notBlank(bindColumn)) {
			if (StrKit.isBlank(bindColumnValue.toString())) {
				String msg = String.format("JBoltAutoCache bindColumn [%s], Value is null in [%s]", bindColumn,
						_getUsefulClass());
				JBOLT_AUTO_CACHE_LOG.error(msg);
				throw new RuntimeException(msg);
			} else {
				sql.eq(bindColumn, bindColumnValue);
			}
		}

		return findFirst(sql.toSql(), sql.getWhereValues());
	}

	@Override
	public M findById(Object idValue) {
		if (idValue == null) {
			return null;
		}
		return _isIdCacheEnable() ? loadCacheById(idValue) : super.findById(idValue);
	}
	
	

	@Override
	public M findByIds(Object... idValues) {
		if (idValues == null) {
			return null;
		}
		if (idValues.length != _getPrimaryKeys().length) {
			throw new IllegalArgumentException("idValues.length != _getPrimaryKeys().length");
		}
		return _isIdCacheEnable() ? loadCacheById(idValues) : super.findByIds(idValues);
	}

	/**
	 * 根据最终的key删除 idCache和KeyCache都可以调用
	 * 
	 * @param deleteKey
	 */
	private void safeDeleteByCacheKey(String deleteKey) {
		if (_isAutoCache() && StrKit.notBlank(deleteKey)) {
			try {
				if (MainConfig.JBOLT_AUTO_CACHE_LOG) {
					JBOLT_AUTO_CACHE_LOG.debug("delete Cache Key:" + deleteKey);
				}
				CacheKit.remove(this.autoCache.name(), deleteKey);
			} catch (Exception ex) {
				JBOLT_AUTO_CACHE_LOG.error(ex.toString(), ex);
			}
		}
	}

	/**
	 * 拼接Id CACHE KEY
	 * 
	 * @param cachePrefix
	 * @param idValues
	 * @return
	 */
	private String buildIdCacheKey(Object... idValues) {
		if (_isIdCacheEnable() == false || idValues == null || idValues.length == 0) {
			return null;
		}
		String name = _getUsefulClass().getSimpleName().toLowerCase();
		StringBuilder key = new StringBuilder();
		key.append(this.autoCache.prefix()).append(name).append("_");
		for (int i = 0; i < idValues.length; i++) {
			key.append(idValues[i]);
			if (i < idValues.length - 1) {
				key.append("_");
			}
		}
		if (MainConfig.JBOLT_AUTO_CACHE_LOG) {
			JBOLT_AUTO_CACHE_LOG.debug("buildIdCacheKey result:[{}]", key);
		}
		return key.toString();
	}

	/**
	 * 拼接Key CACHE KEY
	 * 
	 * @param columnValue
	 * @return
	 */
	private String buildKeyCacheKey(Object columnValue, Object bindColumnValue) {
		if (this.autoCache == null || StrKit.isBlank(this.autoCache.column()) ||columnValue==null|| StrKit.isBlank(columnValue.toString())) {
			return null;
		}
		String name = _getUsefulClass().getSimpleName().toLowerCase();
		StringBuilder keySb = new StringBuilder();
		keySb.append(this.autoCache.prefix()).append(name).append("_").append(this.autoCache.column()).append("_")
				.append(columnValue);
		// 如果额外绑定了其它字段 需要拼接上
		String bindColumn = this.autoCache.bindColumn();
		if (StrKit.notBlank(bindColumn)) {
			if (bindColumnValue != null && StrKit.isBlank(bindColumnValue.toString())) {
				String msg = String.format("JBoltAutoCache bindColumn [%s], Value is null in [%s]", bindColumn,
						_getUsefulClass());
				JBOLT_AUTO_CACHE_LOG.error(msg);
				throw new RuntimeException(msg);
			}
			keySb.append("_").append(bindColumnValue);
		}
		if (MainConfig.JBOLT_AUTO_CACHE_LOG) {
			JBOLT_AUTO_CACHE_LOG.debug("buildKeyCacheKey result:[{}]", keySb);
		}
		return keySb.toString();
	}

	/**
	 * Model原始update
	 * 
	 * @return
	 */
	protected boolean superUpdate() {
		return super.update();
	}
	
	/**
	 * Model原始findById
	 * 
	 * @return
	 */
	protected M superFindById(Object id) {
		return super.findById(id);
	}
	
	/**
	 * 自动处理CreateTIme
	 */
	private void _autoProcessCreateTime() {
		if (_hasColumn(COLUMN_CREATE_TIME) && null == get(COLUMN_CREATE_TIME)) {
			set(COLUMN_CREATE_TIME, new Date());
		}
	}
	/**
	 * 自动处理updateTIme
	 */
	private void _autoProcessUpdateTime() {
		if (_hasColumn(COLUMN_UPDATE_TIME)) {
			set(COLUMN_UPDATE_TIME, new Date());
		}
	}
	@Override
	public boolean save() {
		_autoProcessCreateTime();
		_autoProcessUpdateTime();
		_initPrimaryKey();
		//处理额外相关缓存的删除
		deleteExtraCache("save");
		return this.superSave();

	}
	
	/**
	 * Model原始Save
	 * 
	 * @return
	 */
	protected boolean superSave() {
		return super.save();
	}

	/**
	 * Model原始delete
	 * 
	 * @return
	 */
	protected boolean superDelete() {
		return super.delete();
	}


	 
	/**
	 * 设置子关联数据
	 * @param items
	 */
	public void putItems(List<?> items) {
		if(items!=null&&items.size()>0) {
			put("items",items);
		}
	}
	/**
	  * 得到关联子数据
	 * @return
	 */
	public <T> List<T> getItems() {
		return this.get("items");
	}
	
	/**
	 * 检测是否是更新
	 * @param action
	 * @return
	 */
	protected boolean _actionIsUpdate(String action) {
		return action.equals("update");
	}
	
	/**
	 * 检测是否是保存
	 * @param action
	 * @return
	 */
	protected boolean _actionIsSave(String action) {
		return action.equals("save");
	}
	
	/**
	 * 检测是否是删除
	 * @param action
	 * @return
	 */
	protected boolean _actionIsDelete(String action) {
		return action.equals("delete");
	}
}
