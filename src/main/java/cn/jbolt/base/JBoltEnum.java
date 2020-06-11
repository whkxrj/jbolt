package cn.jbolt.base;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import com.jfinal.kit.StrKit;
import com.jfinal.template.Engine;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.EnumUtil;
/**
 * JBolt 枚举类使用工具类
 * @ClassName:  JBoltEnum   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月17日   
 */
public class JBoltEnum {
	//存放 name为key的map Enum是值的
	private static  HashMap<String, LinkedHashMap<String, ? extends Enum<?>>> ENUM_NAME_OBJECTMAP=new HashMap<String, LinkedHashMap<String,? extends Enum<?>>>();
	//存放 value为key的map Enum是值的
	private static  HashMap<String, LinkedHashMap<String, ? extends Enum<?>>> ENUM_V_OBJECTMAP=new HashMap<String, LinkedHashMap<String,? extends Enum<?>>>();
	//存放 value和text 分别为key的map
	private static HashMap<String, LinkedHashMap<String, JBoltEnumBean>> ENUM_TV_BEANMAP=new HashMap<String, LinkedHashMap<String, JBoltEnumBean>>();
	//存放 name 分别为key的map
	private static HashMap<String, LinkedHashMap<String, JBoltEnumBean>> ENUM_NAME_BEANMAP=new HashMap<String, LinkedHashMap<String, JBoltEnumBean>>();
	/**
	 * 将枚举类 处理成map
	 * @param clazz
	 * @return
	 */
	public static <E extends Enum<E>> LinkedHashMap<String, JBoltEnumBean> addToTvBeanMap(Class<E> clazz) {
		return addToTvBeanMap(clazz, "text", "value");
	}
	
	/**
	 * 添加到text和value作为key的map中管理
	 * @param clazz
	 * @param textAttrName
	 * @param valueAttrName
	 * @return
	 */
	public static <E extends Enum<E>> LinkedHashMap<String, JBoltEnumBean> addToTvBeanMap(Class<E> clazz , String textAttrName , String valueAttrName) {
		List<Object> texts=EnumUtil.getFieldValues(clazz,textAttrName);
		List<Object> values=EnumUtil.getFieldValues(clazz,valueAttrName);
		if(CollUtil.isEmpty(texts)) {return EMPTY_BEAN_HASHMAP;}
		//组合beanMap
		LinkedHashMap<String, JBoltEnumBean> tvMap=new LinkedHashMap<String, JBoltEnumBean>();
		int size=values.size();
		JBoltEnumBean bean;
		for(int i=0;i<size;i++) {
			bean=new JBoltEnumBean(texts.get(i).toString(), values.get(i));
			tvMap.put("v_"+bean.getValue(),bean);
			tvMap.put("t_"+bean.getText(),bean);
		}
		ENUM_TV_BEANMAP.put(clazz.getName(), tvMap);
		return tvMap;
	}
	/**
	 * 添加到text和value作为key的map中管理
	 * @param clazz
	 * @return
	 */
	public static  LinkedHashMap<String, ? extends Enum<?>> addToVEnumObjectMap(Class<? extends Enum<?>> clazz) {
		return addToVEnumObjectMap(clazz, "text", "value");
	}
	/**
	 * 添加value作为key的map中管理
	 * @param clazz
	 * @param textAttrName
	 * @param valueAttrName
	 * @return
	 */
	public static  LinkedHashMap<String, ? extends Enum<?>> addToVEnumObjectMap(Class<? extends Enum<?>> clazz , String textAttrName , String valueAttrName) {
		List<Object> texts=EnumUtil.getFieldValues(clazz,textAttrName);
		List<Object> values=EnumUtil.getFieldValues(clazz,valueAttrName);
		if(CollUtil.isEmpty(texts)) {return EMPTY_OBJECT_HASHMAP;}
		LinkedHashMap<String, Enum<?>> emMap=new LinkedHashMap<String, Enum<?>>();
		Enum<?>[] es=clazz.getEnumConstants();
		int esSize=es.length;
		for(int i=0;i<esSize;i++) {
			emMap.put("v_"+values.get(i),es[i]);
		}
		ENUM_V_OBJECTMAP.put(clazz.getName(), emMap);
		return emMap;
	}
	/**
	 * 添加到name作为key的map中管理
	 * @param clazz
	 * @return
	 */
	public static  LinkedHashMap<String, ? extends Enum<?>> addToNameEnumObjectMap(Class<? extends Enum<?>> clazz) {
		Enum<?>[] es=clazz.getEnumConstants();
		if(es==null||es.length==0) {return EMPTY_OBJECT_HASHMAP;}
		LinkedHashMap<String, Enum<?>> emMap=new LinkedHashMap<String, Enum<?>>();
		for(Enum<?> e:es) {
			emMap.put(e.name(), e);
		}
		ENUM_NAME_OBJECTMAP.put(clazz.getName(), emMap);
		return emMap;
	}
	
	/**
	 * 通过value得到text
	 * @param clazz
	 * @param value
	 * @return
	 */
	public static <E extends Enum<E>> String getTextByValue(Class<E> clazz,Integer value) {
		JBoltEnumBean bean=getByValue(clazz, value);
		return bean==null?null:bean.getText();
	}
	
	/**
	 * 通过text得到得到Integer value
	 * @param clazz
	 * @param text
	 * @return
	 */
	public static <E extends Enum<E>> Integer getIntegerValueByText(Class<E> clazz,String text) {
		JBoltEnumBean bean=getByText(clazz,text);
		return bean==null?null:bean.getValueAs();
	}
	
	/**
	 * 通过text得到int value
	 * @param clazz
	 * @param text
	 * @return
	 */
	public static <E extends Enum<E>> int getIntValueByText(Class<E> clazz,String text) {
		JBoltEnumBean bean=getByText(clazz,text);
		return bean==null?-1000:bean.getValueAs();
	}
	
	/**
	 * 通过value得到bean
	 * @param clazz
	 * @param value
	 * @return
	 */
	public static <E extends Enum<E>> JBoltEnumBean getByValue(Class<E> clazz,Object value) {
		if(value==null) {
			return null;
		}
		LinkedHashMap<String, JBoltEnumBean> beanMap=ENUM_TV_BEANMAP.get(clazz.getName());
		if(beanMap==null) {
			beanMap=addToTvBeanMap(clazz);
			if(beanMap==null) {
				return null;
			}
		}
		return beanMap.get("v_"+value);
	}
	
	/**
	 * 通过value得到Enum对象
	 * @param clazz
	 * @param value
	 * @return
	 */
	public static  <T extends Enum<T>> T getEnumObjectByValue(Class<T> clazz,Object value) {
		if(value==null) {
			return null;
		}
		LinkedHashMap<String, ? extends Enum<?>> objMap=ENUM_V_OBJECTMAP.get(clazz.getName());
		if(objMap==null) {
			objMap=addToVEnumObjectMap(clazz);
			if(objMap==null) {
				return null;
			}
		}
		return (T) objMap.get("v_"+value);
	}
	/**
	 * 通过name得到Enum对象
	 * @param clazz
	 * @param name
	 * @return
	 */
	public static  <T extends Enum<T>> T getEnumObjectByName(Class<T> clazz,String name) {
		if(StrKit.isBlank(name)) {
			return null;
		}
		LinkedHashMap<String, ? extends Enum<?>> objMap=ENUM_NAME_OBJECTMAP.get(clazz.getName());
		if(objMap==null) {
			objMap=addToNameEnumObjectMap(clazz);
			if(objMap==null) {
				return null;
			}
		}
		return (T) objMap.get(name);
	}
	
	/**
	 * 通过text得到bean
	 * @param clazz
	 * @param text
	 * @return
	 */
	public static <E extends Enum<E>> JBoltEnumBean getByText(Class<E> clazz,String text) {
		if(StrKit.isBlank(text)) {
			return null;
		}
		LinkedHashMap<String, JBoltEnumBean> beanMap=ENUM_TV_BEANMAP.get(clazz.getName());
		if(beanMap==null) {
			beanMap=addToTvBeanMap(clazz);
			if(beanMap==null) {
				return null;
			}
		}
		return beanMap.get("t_"+text);
	}
	/**
	 * 获取Enum List数据
	 * @param clazz
	 * @return
	 */
	public static <E extends Enum<E>> List<JBoltEnumBean> getEnumNameBeanList(Class<E> clazz) {
		return getEnumNameBeanList(clazz, "text", "value");
	}
	/**
	 * 获取Enum List数据
	 * @param clazz
	 * @param textAttrName
	 * @param valueAttrName
	 * @return
	 */
	public static <E extends Enum<E>> List<JBoltEnumBean> getEnumNameBeanList(Class<E> clazz,String textAttrName,String valueAttrName) {
		LinkedHashMap<String, JBoltEnumBean> beanMap=ENUM_NAME_BEANMAP.get(clazz.getName());
		if(beanMap==null) {
			beanMap=addToNameBeanMap(clazz,textAttrName,valueAttrName);
			if(beanMap==null) {
				return Collections.emptyList();
			}
		}
		return new ArrayList<JBoltEnumBean>(beanMap.values());
	}
	
	/*******用于enjoy模板引擎*******/
	
	private static final LinkedHashMap<String, JBoltEnumBean> EMPTY_BEAN_HASHMAP=new LinkedHashMap<String, JBoltEnumBean>();
	private static final LinkedHashMap<String, Enum<?>> EMPTY_OBJECT_HASHMAP=new LinkedHashMap<String, Enum<?>>();
	public static <E extends Enum<E>> LinkedHashMap<String, JBoltEnumBean> getEnumNameBeanMap(Class<E> clazz) {
		return getEnumNameBeanMap(clazz, "text", "value");
	}
	/**
	 * 得到
	 * @param <E>
	 * @param clazz
	 * @param textAttrName
	 * @param valueAttrName
	 * @return
	 */
	public static <E extends Enum<E>> LinkedHashMap<String, JBoltEnumBean> getEnumNameBeanMap(Class<E> clazz,String textAttrName,String valueAttrName) {
		String className=clazz.getSimpleName();
		LinkedHashMap<String, JBoltEnumBean> nameBeanMap=ENUM_NAME_BEANMAP.get(className);
		if(nameBeanMap==null) {
			nameBeanMap=addToNameBeanMap(clazz,textAttrName,valueAttrName);
		}
		return nameBeanMap;
		 
	}
	
	/**
	 * 添加用enum name作为key的beanMap
	 * @param <E>
	 * @param clazz
	 * @return
	 */
	public static <E extends Enum<E>> LinkedHashMap<String, JBoltEnumBean> addToNameBeanMap(Class<E> clazz) {
		return addToNameBeanMap(clazz, "text", "value");
	}
	
	/**
	 * 添加用enum name作为key的beanMap
	 * @param <E>
	 * @param clazz
	 * @param textAttrName
	 * @param valueAttrName
	 * @return
	 */
	public static <E extends Enum<E>> LinkedHashMap<String, JBoltEnumBean> addToNameBeanMap(Class<E> clazz,String textAttrName,String valueAttrName) {
		List<String> names=EnumUtil.getNames(clazz);
		if(CollUtil.isEmpty(names)) {return EMPTY_BEAN_HASHMAP;}
		List<Object> texts=EnumUtil.getFieldValues(clazz,textAttrName);
		List<Object> values=EnumUtil.getFieldValues(clazz,valueAttrName);
		//组合beanMap
		LinkedHashMap<String, JBoltEnumBean> beanMap=new LinkedHashMap<String, JBoltEnumBean>();
		int size=names.size();
		for(int i=0;i<size;i++) {
			beanMap.put(names.get(i),new JBoltEnumBean(texts.get(i).toString(), values.get(i)));
		}
		ENUM_NAME_BEANMAP.put(clazz.getSimpleName(), beanMap);
		return beanMap;
	}

	/**
	 * 枚举类转换添加到模板引擎中
	 * @param <E>
	 * @param engine
	 * @param clazz
	 */
	public static <E extends Enum<E>> void addEnjoyEngineShareObject(Engine engine,Class<E> clazz) {
		engine.addSharedObject(clazz.getSimpleName(), getEnumNameBeanMap(clazz));
	}
	/**
	 * 数据源
	 * 下拉列表 radio checkbox等 都可以
	 * @param <E>
	 * @param clazz
	 * @return
	 */
	public static <E extends Enum<E>> List<JBoltEnumBean> getEnumOptionList(Class<E> clazz) {
		return getEnumNameBeanList(clazz);
	}
	/**
	 * 数据源
	 * 下拉列表 radio checkbox等 都可以
	 * @param <E>
	 * @param clazz
	 * @param textAttrName
	 * @param valueAttrName
	 * @return
	 */
	public static <E extends Enum<E>> List<JBoltEnumBean> getEnumOptionList(Class<E> clazz,String textAttrName,String valueAttrName) {
		return getEnumNameBeanList(clazz,textAttrName,valueAttrName);
	}
	
}
