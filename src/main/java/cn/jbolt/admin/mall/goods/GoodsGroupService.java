package cn.jbolt.admin.mall.goods;

import java.util.List;

import com.jfinal.kit.Kv;

import cn.jbolt.base.JBoltBaseService;
import cn.jbolt.common.model.GoodsGroup;

/**   
 * @ClassName:  GoodsGroupService   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年3月23日 下午1:52:51   
 */
public class GoodsGroupService extends JBoltBaseService<GoodsGroup> {
	private GoodsGroup dao = new GoodsGroup().dao();
	@Override
	protected GoodsGroup dao() {
		return dao;
	}
	
	public List<GoodsGroup> getList(Boolean enable) {
		if(isOk(enable)){
			return getCommonList(Kv.by("enable", enable));
		}
		return findAll();
	}


}
