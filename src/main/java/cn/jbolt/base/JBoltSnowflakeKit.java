package cn.jbolt.base;

import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.util.IdUtil;
import cn.jbolt.common.config.MainConfig;

/**
 * JBolt平台雪花算法
 * @ClassName:  JBoltSnowflakeKit   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年12月16日   
 */
public class JBoltSnowflakeKit {
	public static final JBoltSnowflakeKit me=new JBoltSnowflakeKit();
	private Snowflake SNOWFLAKE=null;
	private JBoltSnowflakeKit() {
		SNOWFLAKE=IdUtil.getSnowflake(MainConfig.WORKER_ID, MainConfig.DATACENTER_ID);
	}
	public long nextId() {
		return SNOWFLAKE.nextId();
	}
	
	public static void main(String[] args) {
		for(int i=0;i<1000;i++) {
			System.out.println(IdUtil.randomUUID());
			System.out.println(IdUtil.objectId());
		}
	}
}
