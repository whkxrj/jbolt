package cn.jbolt._admin.updatemgr;

import java.io.File;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Before;
import com.jfinal.aop.Inject;
import com.jfinal.kit.Kv;
import com.jfinal.kit.Ret;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;

import cn.jbolt.base.JBoltBaseService;
import cn.jbolt.common.config.Msg;
import cn.jbolt.common.db.sql.Sql;
import cn.jbolt.common.model.JboltVersion;
import cn.jbolt.common.model.JboltVersionFile;
import cn.jbolt.common.model.SystemLog;
import cn.jbolt.common.poi.excel.JBoltExcel;
import cn.jbolt.common.poi.excel.JBoltExcelHeader;
import cn.jbolt.common.poi.excel.JBoltExcelMerge;
import cn.jbolt.common.poi.excel.JBoltExcelSheet;
import cn.jbolt.common.poi.excel.JBoltExcelUtil;
import cn.jbolt.common.util.ArrayUtil;
import cn.jbolt.common.util.CACHE;

/**
 * JBolt版本管理Service
 * @ClassName:  JBoltVersionService   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年11月9日   
 */
public class JBoltVersionService extends JBoltBaseService<JboltVersion> {
	private JboltVersion dao = new JboltVersion().dao();
	@Inject
	private JboltVersionFileService jboltVersionFileService;
	@Override
	protected JboltVersion dao() {
		return dao;
	}
	/**
	 * 保存
	 * @param userId
	 * @param jboltVersion
	 * @return
	 */
	public Ret save(Integer userId,JboltVersion jboltVersion) {
		if(userId==null||isOk(jboltVersion.getId())||notOk(jboltVersion.getVersion())||notOk(jboltVersion.getPublishTime())){return fail(Msg.PARAM_ERROR);}
		jboltVersion.setCreateTime(new Date());
		jboltVersion.setUserId(userId);
		jboltVersion.setIsNew(false);
		boolean success=jboltVersion.save();
		if(success){
			//添加日志
			addSaveSystemLog(jboltVersion.getId(), userId, SystemLog.TARGETTYPE_JBOLT_VERSION, jboltVersion.getVersion());
		}
		return ret(success);
	}
	/**
	 * 更新
	 * @param userId
	 * @param jboltVersion
	 * @return
	 */
	public Ret update(Integer userId,JboltVersion jboltVersion) {
		if(userId==null||notOk(jboltVersion.getId())||notOk(jboltVersion.getVersion())||notOk(jboltVersion.getPublishTime())){return fail(Msg.PARAM_ERROR);}
		boolean success=jboltVersion.update();
		if(success){
			//添加日志
			addUpdateSystemLog(jboltVersion.getId(), userId, SystemLog.TARGETTYPE_JBOLT_VERSION, jboltVersion.getVersion());
		}
		return ret(success);
	}
	/**
	 * 删除
	 * @param userId
	 * @param id
	 * @return
	 */
	public Ret delete(Integer userId,Object id){
		Ret ret=deleteById(id);
		if(ret.isOk()){
			Ret delRet=jboltVersionFileService.deleteByVersion(id);
			if(delRet.isFail()) {return delRet;}
			JboltVersion jboltVersion=ret.getAs("data");
			//日志
			addDeleteSystemLog(jboltVersion.getId(), userId, SystemLog.TARGETTYPE_JBOLT_VERSION, jboltVersion.getVersion());
		}
		return ret;
	}
	
	
 
	/**
	 * 切换是否是最新版
	 * @param userId
	 * @param id
	 * @return
	 */
	public Ret doToggleIsNew(Integer userId, Integer id) {
		Ret ret=toggleBoolean(id, "is_new");
		if(ret.isOk()){
			JboltVersion jboltVersion=ret.getAs("data");
			//日志
			addUpdateSystemLog(jboltVersion.getId(), userId, SystemLog.TARGETTYPE_JBOLT_VERSION, jboltVersion.getVersion(),"的是否为最新版状态:"+jboltVersion.getIsNew());
			return successWithData(jboltVersion.getIsNew());
		}
		return ret;
	}
	
	@Override
	public String afterToggleBoolean(Kv kv,JboltVersion jboltVersion, String column) {
		if(column.equals("is_new")){
			if(jboltVersion.getIsNew()){
				 changeAllIsNewFlase();
			}
		}
		return null;
	}
	/**
	 * 切换所有isNew=true的变为false
	 */
	private void changeAllIsNewFlase() {
		update(updateSql().set("is_new", FALSE()).eq("is_new",TRUE()));
	}
 
	/**
	 * 获取主程序更新数据
	 * @return
	 */
	public String getMainUpdateDatas() {
		JboltVersion jboltVersion=getNewJboltVersion();
		if(jboltVersion==null){return null;}
		List<JboltVersionFile> files=jboltVersionFileService.getFilesByJboltVersionId(jboltVersion.getId());
		if(files==null||files.size()==0){return null;}
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("version", jboltVersion.getVersion());
		jsonObject.put("datas", ArrayUtil.getStringArray(files,"url"));
		return jsonObject.toJSONString();
	}
	/**
	 * 得到最新版
	 * @return
	 */
	private JboltVersion getNewJboltVersion() {
		return findFirst(Kv.by("is_new", TRUE()));
	}
	
	/**
	  * 分页条件查询
	 * @param pageNumber
	 * @param pageSize
	 * @param keywords
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public Page<JboltVersion> paginateAdminList(Integer pageNumber, Integer pageSize,String sortColumn,String sortType, String keywords, Date startTime, Date endTime) {
		Kv paras=Kv.create();
		if(StrKit.notBlank(keywords)){
			paras.set("version",columnLike(keywords.trim()));
		}
		if(isOk(startTime)){
			paras.set("create_time >=",toStartTime(startTime));
		}
		if(isOk(endTime)){
			paras.set("create_time <=",toEndTime(endTime));
		}
		
		return paginate(paras, sortColumn, sortType, pageNumber, pageSize, true);
	}
	/**
	 * 按照条件查询数据 不进行分页
	 * @param keywords
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<JboltVersion> getAdminList(String orderColumn,String orderType,String keywords, Date startTime, Date endTime) {
		Sql sql=selectSql();
		if(isOk(keywords)) {
			sql.like("version", keywords);
		}
		if(isOk(startTime)){
			sql.ge("create_time",toStartTime(startTime));
		}
		if(isOk(endTime)){
			sql.le("create_time",toEndTime(endTime));
		}
		sql.orderBy(orderColumn, orderType);
		return find(sql);
	}
	/**
	 * 生成Excel 导入模板的数据 byte[]
	 * @return
	 */
	public JBoltExcel getExcelImportTpl() {
		return JBoltExcel
				//创建
				.create()
				.setSheets(
						JBoltExcelSheet.create("versions")
						//设置列映射 顺序 标题名称 不处理别名
						.setHeaders(1,false,
								JBoltExcelHeader.create("版本号",16),
								JBoltExcelHeader.create("发布日期",15),
								JBoltExcelHeader.create("记录时间",15),
								JBoltExcelHeader.create("是否最新版",12),
								JBoltExcelHeader.create("用户名",10)
								)
						.setMerges(JBoltExcelMerge.create(0, 0, 4, "JBolt版本信息"))
					);
	}
	/**
	 * 生成Excel数据 byte[]
	 * @return
	 */
	public JBoltExcel getExcelReport() {
	return JBoltExcel
			//创建
			.create()
    		//设置工作表
    		.setSheets(
    				//设置工作表 列映射 顺序 标题名称
    				JBoltExcelSheet
    				.create("versions")
    				//表头映射关系
    				.setHeaders(1,
    						JBoltExcelHeader.create("version", "版本号",16),
    						JBoltExcelHeader.create("publish_time", "发布日期",15),
    						JBoltExcelHeader.create("create_time", "记录时间",15),
    						JBoltExcelHeader.create("is_new", "是否最新版",12),
    						JBoltExcelHeader.create("user_username", "用户名",10)
    						)
    				//设置单元格合并区域
    		    	.setMerges(JBoltExcelMerge.create(0, 0, 4, "JBolt版本信息"))
    		    	//特殊数据转换器
    		    	.setDataChangeHandler(data ->{
    		    			//将user_id转为user_name
    		    			data.changeWithKey("user_id","user_username", CACHE.me.getUserUsername(data.get("user_id")));
    		    			data.changeBooleanToStr("is_new","是","否");
    		    	})
    		    	//设置导出的数据源 来自于数据库查询出来的Model List
    		    	.setModelDatas(2,findAll())
    				);
	}
	/**
	  * 删除多个数据
	 * @param userId
	 * @param ids
	 * @return
	 */
	@Before(Tx.class)
	public Ret deleteByIds(Integer userId, Object[] ids) {
		if(notOk(ids)) {return fail(Msg.PARAM_ERROR);}
		Ret ret;
		for(Object id:ids) {
			ret=delete(userId, id);
			if(ret.isFail()) {
				return ret;
			}
		}
		return SUCCESS;
	}
	/**
	 * 读取excel文件
	 * @param userId
	 * @param file
	 * @return
	 */
	public Ret importExcelDatas(Integer sessionAdminUserId, File file) {
		StringBuilder errorMsg=new StringBuilder();
		JBoltExcel jBoltExcel=JBoltExcel
		//从excel文件创建JBoltExcel实例
		.from(file)
		//设置工作表信息
		.setSheets(
				JBoltExcelSheet.create("versions")
				//设置列映射 顺序 标题名称
				.setHeaders(1,
					JBoltExcelHeader.create("version", "版本号"),
					JBoltExcelHeader.create("publish_time", "发布日期"),
					JBoltExcelHeader.create("create_time", "记录时间"),
					JBoltExcelHeader.create("is_new", "是否最新版"),
					JBoltExcelHeader.create("user_id", "用户名")
					)
				//特殊数据转换器
				.setDataChangeHandler(data ->{
					//将user_id转为user_name
					data.changeStrToBoolean("is_new","是");
					data.change("user_id",CACHE.me.getUserIdByUsername(data.getStr("user_id")));
				})
				//从第三行开始读取
				.setDataStartRow(2)
				);
		
		//从指定的sheet工作表里读取数据
		List<JboltVersion> jboltVersions=JBoltExcelUtil.readModels(jBoltExcel,"versions", JboltVersion.class,errorMsg);
		if(notOk(jboltVersions)) {
			if(errorMsg.length()>0) {
				return fail(errorMsg.toString());
			}else {
				return fail(Msg.DATA_IMPORT_FAIL_EMPTY);
			}
		}
		
		//执行批量操作
		boolean success=Db.tx(new IAtom() {
			@Override
			public boolean run() throws SQLException {
				Db.batchSave(jboltVersions, 100);
				return true;
			}
		});
		
		if(!success) {
			return fail(Msg.DATA_IMPORT_FAIL);
		}
		return SUCCESS;
	}
	

	


}
