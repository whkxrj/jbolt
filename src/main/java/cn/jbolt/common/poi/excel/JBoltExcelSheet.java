package cn.jbolt.common.poi.excel;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.ListUtil;
/**
 * Excel中的一个Sheet
 * @ClassName:  JBoltExcelSheetSheet   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年4月27日   
 */
public class JBoltExcelSheet {
	private JBoltExcel excel;
	private String name;
	private List<JBoltExcelMerge> merges;//合并设置
	private List<JBoltExcelHeader> headers;//表头
	private List<JBoltExcelData> datas;//数据
	private boolean mergeAsHeader;//用merge代替了header内容设置
	private int headerStartRow;//header开始的行
	private boolean processHeaderAlias;//是否需要处理header别名
	private int dataStartRow;//数据开始的行
	private JBoltExcelDataChangeHandler dataChangeHandler;//数据处理器
	public static JBoltExcelSheet create() {
		return new JBoltExcelSheet();
	}
	public static JBoltExcelSheet create(String name) {
		return new JBoltExcelSheet(name);
	}
	private JBoltExcelSheet() {
		this("Sheet1");
	}
	private JBoltExcelSheet(String name) {
		this.name=name;
		this.mergeAsHeader=false;
		this.headerStartRow=0;
		this.dataStartRow=0;
	}
	
	public boolean hasDatas() {
		return CollUtil.isNotEmpty(this.datas);
	}
	public boolean hasHeaders() {
		return CollUtil.isNotEmpty(this.headers);
	}
	public boolean hasMerges() {
		return CollUtil.isNotEmpty(this.merges);
	}
	public List<JBoltExcelMerge> getMerges() {
		return merges;
	}
	public JBoltExcelSheet setMerges(List<JBoltExcelMerge> merges) {
		this.merges = merges;
		return this;
	}
	public JBoltExcelSheet setMerges(JBoltExcelMerge... merges) {
		return setMerges(ListUtil.toList(merges));
	}
	 
	public List<JBoltExcelData> getDatas() {
		return datas;
	}
	public JBoltExcelSheet setDatas(List<JBoltExcelData> datas) {
		this.datas = datas;
		return this;
	}
	/**
	 * 设置model数据
	 * @param dataStartRow
	 * @param models
	 * @return
	 */
	public JBoltExcelSheet setModelDatas(int dataStartRow,List<? extends Model<?>> models) {
		setDataStartRow(dataStartRow);
		if(models!=null&&models.size()>0) {
			this.datas=new ArrayList<JBoltExcelData>();
			for(Model<?> model:models) {
				this.datas.add(JBoltExcelData.fromModel(model));
			}
		}
		return this;
	}
	/**
	 * change数据
	 * @param data
	 * @param dataChangeHandler
	 * @return
	 */
	public JBoltExcelSheet setDataChangeHandler(JBoltExcelDataChangeHandler dataChangeHandler) {
		this.dataChangeHandler=dataChangeHandler;
		return this;
	}
	/**
	 * 设置records数据
	 * @param dataStartRow
	 * @param records
	 * @return
	 */
	public JBoltExcelSheet setRecordDatas(int dataStartRow,List<Record> records) {
		setDataStartRow(dataStartRow);
		if(records!=null&&records.size()>0) {
			this.datas=new ArrayList<JBoltExcelData>();
			for(Record record:records) {
				this.datas.add(JBoltExcelData.fromRecord(record));
			}
		}
		return this;
	}
 
	public List<JBoltExcelHeader> getHeaders() {
		return headers;
	}
	public List<String> getHeaderColumns() {
		if(headers==null||headers.size()==0) {return null;}
		List<String> columns=new ArrayList<String>();
		headers.forEach((h)->{
			columns.add(h.getColumn());
		});
		return columns;
	}
	public List<String> getHeaderContents() {
		if(headers==null||headers.size()==0) {return null;}
		List<String> contents=new ArrayList<String>();
		headers.forEach((h)->{
			contents.add(h.getContent());
		});
		return contents;
	}
	public JBoltExcelSheet setHeaders(List<JBoltExcelHeader> headers) {
		return setHeaders(0, headers);
	}
	public JBoltExcelSheet setHeaders(int headerStartRow,List<JBoltExcelHeader> headers) {
		return setHeaders(headerStartRow, true, headers);
	}
	public JBoltExcelSheet setHeaders(int headerStartRow,boolean processHeaderAlias,List<JBoltExcelHeader> headers) {
		this.headers = headers;
		this.headerStartRow=headerStartRow;
		this.processHeaderAlias=processHeaderAlias;
		return this;
	}
	public JBoltExcelSheet setHeaders(JBoltExcelHeader... headers) {
		return setHeaders(0,headers);
	}
	public JBoltExcelSheet setHeaders(int headerStartRow,boolean processHeaderAlias,JBoltExcelHeader... headers) {
		return setHeaders(headerStartRow,processHeaderAlias,ListUtil.toList(headers));
	}
	public JBoltExcelSheet setHeaders(int headerStartRow,JBoltExcelHeader... headers) {
		return setHeaders(headerStartRow,true,headers);
	}
	public boolean isMergeAsHeader() {
		return mergeAsHeader;
	}
	public JBoltExcelSheet setMergeAsHeader(boolean mergeAsHeader) {
		this.mergeAsHeader = mergeAsHeader;
		return this;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
 
	public JBoltExcelDataChangeHandler getDataChangeHandler() {
		return dataChangeHandler;
	}
 
	public int getHeaderStartRow() {
		return headerStartRow;
	}
	public void setHeaderStartRow(int headerStartRow) {
		this.headerStartRow = headerStartRow;
	}
	 
	public int getDataStartRow() {
		return dataStartRow;
	}
	public JBoltExcelSheet setDataStartRow(int dataStartRow) {
		this.dataStartRow = dataStartRow;
		return this;
	}
	public boolean isProcessHeaderAlias() {
		return processHeaderAlias;
	}
	public void setProcessHeaderAlias(boolean processHeaderAlias) {
		this.processHeaderAlias = processHeaderAlias;
	}
	public JBoltExcel getExcel() {
		return excel;
	}
	public void setExcel(JBoltExcel excel) {
		this.excel = excel;
	}
	 
}
