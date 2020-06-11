package cn.jbolt.common.gen;

import javax.sql.DataSource;

import cn.jbolt.common.util.ArrayUtil;


public class _JBoltOracleMetaBuilder extends JBoltMetaBuilder {
	private static final String[] skipTableNames=new String[] {"dept","bonus","emp","salgrade"};
	public _JBoltOracleMetaBuilder(DataSource dataSource) {
		super(dataSource);
	}
	@Override
	protected boolean isSkipTable(String tableName) {
		if(ArrayUtil.contains(skipTableNames, tableName.trim().toLowerCase()))
		{
			return true;
		}
		return false;
	}
}
