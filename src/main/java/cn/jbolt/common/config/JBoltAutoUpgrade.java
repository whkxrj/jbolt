package cn.jbolt.common.config;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Aop;
import com.jfinal.kit.HashKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;

import cn.hutool.core.date.DateUtil;
import cn.jbolt._admin.globalconfig.GlobalConfigService;
import cn.jbolt._admin.user.UserService;
import cn.jbolt._admin.userconfig.UserConfigService;
import cn.jbolt.common.db.sql.Sql;
import cn.jbolt.common.model.GlobalConfig;
import cn.jbolt.common.model.User;
import cn.jbolt.common.model.UserConfig;

/**
 * 一切版本过渡之间的自动处理升级业务
 * 在这里实现，文件由JBolt官方操作，他人请勿修改
 * @ClassName:  JBoltAutoUpgrade   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年12月7日   
 */
public class JBoltAutoUpgrade {
	public static final JBoltAutoUpgrade me=new JBoltAutoUpgrade();
	private Log LOG=Log.getLog(JBoltAutoUpgrade.class);
	private JBoltAutoUpgrade() {
	}
	/**
	 * 执行
	 */
	public void exe() {
		LOG.info("JBolt自动升级：开始执行");
//		up20200502_userpwdsalt();
		LOG.info("JBolt自动升级：执行完成");
	}
	public boolean canUpgrade(String upgradeDate) {
		Date date_upgradeDate=DateUtil.parse(upgradeDate);
		Date now=new Date();
		return now.after(date_upgradeDate);
	}
	/**
	 * 升级用户密码体系 加盐
	 */
	public void up20200502_userpwdsalt() {
		if(canUpgrade("2020-05-01 23:59:59")) {
			LOG.info("JBolt自动升级：正在执行-up20200502_userpwdsalt");
			    UserService userService=Aop.get(UserService.class);
			    Sql sql=Sql.me(MainConfig.DB_TYPE).select("id,pwd_salt,password").from(userService.table()).isNull("pwd_salt");
			    List<User> users=userService.find(sql);
				if(users!=null&&users.size()>0) {
					boolean success=Db.tx(new IAtom() {
						@Override
						public boolean run() throws SQLException {
							try {
								for(User user:users) {
									user.setPwdSalt(HashKit.generateSaltForSha256());
									user.setPassword(HashKit.sha256(user.getPwdSalt()+user.getPassword()));
								}
								Db.batchUpdate(users, 100);
							} catch (Exception e) {
								return false;
							}
							return true;
						}
					});
					if(!success) {
						LOG.info("JBolt自动升级：执行失败-up20200502_userpwdsalt");
					}
					
				}
			LOG.info("JBolt自动升级：执行完毕-up20200502_userpwdsalt");
		}
	}
	/**
	 * 临时方法 升级global Config
	 */
	public void up20191207_globalconfig() {
		if(canUpgrade("2019-12-07 23:59:59")) {
			LOG.info("JBolt自动升级：正在执行-up20191207_globalconfig");
			    GlobalConfigService globalConfigService=Aop.get(GlobalConfigService.class);
			    List<GlobalConfig> rewardConfigs=globalConfigService.getCommonListByKeywords("REWARD", "id", "config_key");
				if(rewardConfigs!=null&&rewardConfigs.size()>0) {
					for(GlobalConfig reConfig:rewardConfigs) {
						reConfig.delete();
						LOG.info("删除废弃的全局配置项："+reConfig.getName()+":"+reConfig.getConfigKey());
					}
				}
				List<GlobalConfig> globalConfigs=globalConfigService.getCommonListByKeywords("CONFIG_KEY_", "id", "config_key");
				if(globalConfigs!=null&&globalConfigs.size()>0) {
					for(GlobalConfig config:globalConfigs) {
						config.setConfigKey(config.getConfigKey().replace("CONFIG_KEY_", ""));
						config.update();
					}
				}
			LOG.info("JBolt自动升级：执行完毕-up20191207_globalconfig");
		}
	}
	/**
	 * 临时方法 升级user Config
	 */
	public void up20191207_userconfig() {
		if(canUpgrade("2019-12-07 23:59:59")) {
			LOG.info("JBolt自动升级：正在执行-up20191207_userconfig");
			    UserConfigService userConfigService=Aop.get(UserConfigService.class);
				List<UserConfig> userConfigs=userConfigService.getCommonListByKeywords("CONFIG_KEY_", "id", "config_key");
				if(userConfigs!=null&&userConfigs.size()>0) {
					for(UserConfig config:userConfigs) {
						config.setConfigKey(config.getConfigKey().replace("CONFIG_KEY_", ""));
						config.update();
					}
				}
				
			LOG.info("JBolt自动升级：执行完毕-up20191207_userconfig");
		}
	}
}
