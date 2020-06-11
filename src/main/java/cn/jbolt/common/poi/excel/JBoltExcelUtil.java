package cn.jbolt.common.poi.excel;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.core.converter.TypeConverter;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;

public class JBoltExcelUtil {
	/**
	 * 处理单元格合并
	 * 
	 * @param excelWriter
	 * @param merges
	 */
	private static void processExcelMerge(ExcelWriter excelWriter, JBoltExcelSheet sheet) {
		List<JBoltExcelMerge> merges=sheet.getMerges();
		if (CollUtil.isNotEmpty(merges)){
			merges.forEach(merge -> {
				excelWriter.merge(merge.getFirstRow(), merge.getLastRow(), merge.getFirstColumn(),
						merge.getLastColumn(), merge.getContent(), merge.isSetHeaderStyle());
			});
		}
	}

	/**
	 * 处理导出数据的表头
	 * @param excelWriter
	 * @param jBoltExcel
	 */
	private static void processExcelHeaders(ExcelWriter excelWriter, JBoltExcelSheet sheet) {
		List<JBoltExcelHeader> headers = sheet.getHeaders();
		if(headers!=null&&headers.size()>0&&sheet.isProcessHeaderAlias()) {
			//设置别名
			for (JBoltExcelHeader header : headers) {
				excelWriter.addHeaderAlias(header.getColumn(), header.getContent());
			}
			//设置只输出设置别名的数据列
			excelWriter.setOnlyAlias(true);
		}
		// 只有merge不设置覆盖header 并且header有值 我才输出header
		if (sheet.isMergeAsHeader() == false) {
			if(sheet.getHeaderStartRow()>0) {
				excelWriter.setCurrentRow(sheet.getHeaderStartRow());
			}
			excelWriter.writeHeadRow(sheet.getHeaders());
		}
	}
	/**
	 * 处理读取数据的表头
	 * @param excelReader
	 * @param jBoltExcel
	 */
	private static void processExcelHeaders(ExcelReader excelReader, JBoltExcelSheet sheet) {
		List<JBoltExcelHeader> headers = sheet.getHeaders();
		if(headers!=null&&headers.size()>0&&sheet.isProcessHeaderAlias()) {
			//设置别名
			for (JBoltExcelHeader header : headers) {
				excelReader.addHeaderAlias(header.getContent(),header.getColumn());
			}
		}
	}

	/**
	 * 处理导出数据
	 * @param excelWriter
	 * @param jBoltExcel
	 */
	private static void processExportExcelDatas(ExcelWriter excelWriter, JBoltExcelSheet sheet) {
		if (sheet.hasDatas()) {
			List<JBoltExcelData> datas=sheet.getDatas();
			JBoltExcelDataChangeHandler handler=sheet.getDataChangeHandler();
			if(handler!=null) {
				datas.forEach(data -> handler.change(data));
			}
			if(sheet.getDataStartRow()>0) {
				excelWriter.setCurrentRow(sheet.getDataStartRow());
			}
			excelWriter.write(datas,false);
		}
	}

	/**
	 * 处理列宽
	 * @param excelWriter
	 * @param jBoltExcel
	 */
	public static void processColumnWidth(ExcelWriter excelWriter, JBoltExcelSheet sheet) {
		if(sheet.hasHeaders()) {
			List<JBoltExcelHeader> headers=sheet.getHeaders();
			int size=headers.size(),width;
			for(int i=0;i<size;i++) {
				width=headers.get(i).getWidth();
				if(width>0) {
					excelWriter.setColumnWidth(i, width);
				}else {
					excelWriter.autoSizeColumn(i, true);
				}
			}

		}
	}
	/**
	 * 处理样式
	 * @param excelWriter
	 * @param jBoltExcel
	 */
	private static void processExcelStyle(ExcelWriter excelWriter, JBoltExcelSheet sheet) {
		processColumnWidth(excelWriter, sheet);
	}
	/**
	 * 处理导出数据
	 * 
	 * @param excelWriter
	 * @param jBoltExcel
	 *//*
		 * private void processExcelDatas(ExcelWriter excelWriter,JBoltExcel jBoltExcel)
		 * { List<Map<String, Object>> datas=jBoltExcel.getDatas(); if(isOk(datas)) {
		 * List<JBoltExcelHeader> headers=jBoltExcel.getHeaders(); int
		 * row=excelWriter.getCurrentRow(), maxRow=datas.size()+row,
		 * maxCol=jBoltExcel.getHeaders().size(), col=0; Map<String, Object> data;
		 * JBoltExcelHeader header; for(;row<maxRow;row++) { data=datas.get(row);
		 * for(;col<maxCol;col++) { header=headers.get(col);
		 * excelWriter.writeCellValue(row,col, data.get(header.getColumn())); } } } }
		 */

	/**
	 * 把JBoltExcel数据转为byte[]
	 * 
	 * @param jBoltExcel
	 * @return
	 */
	public static byte[] getExcelBytes(JBoltExcel jBoltExcel) {
		ExcelWriter excelWriter = null;
		if(jBoltExcel.isBig()) {
			excelWriter=ExcelUtil.getBigWriter();
		}else {
			excelWriter=ExcelUtil.getWriter(jBoltExcel.isXlsx());
		}
		LinkedHashMap<String ,JBoltExcelSheet> sheetsMap=jBoltExcel.getSheets();
		if(sheetsMap!=null&&sheetsMap.isEmpty()==false) {
			int index=0;
			Collection<JBoltExcelSheet> sheets=sheetsMap.values();
			for(JBoltExcelSheet sheet:sheets) {
				excelWriter.setSheet(index);
				excelWriter.renameSheet(sheet.getName());
				// 处理单元格合并
				processExcelMerge(excelWriter, sheet);
				// 处理表头生成 如果需要header直接使用merge合并数据作为标题的话 就不处理headers
				processExcelHeaders(excelWriter, sheet);
				// 处理导出数据
				processExportExcelDatas(excelWriter, sheet);
				//样式处理
				processExcelStyle(excelWriter,sheet);
				index++;
			}
			
		}
		
		//转为byte[]
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		excelWriter.flush(os, true);
		excelWriter.close();
		return os.toByteArray();
	}
	
	/**
	 * 从Excel中读取models
	 * @param jBoltExcel
	 * @param dataStartRow
	 * @param modelClass
	 * @param errorMsg
	 * @return
	 */
	public static <T> List<T> readModels(JBoltExcel jBoltExcel,String sheetName,Class<T> modelClass,StringBuilder errorMsg){
		JBoltExcelSheet sheet=jBoltExcel.getSheet(sheetName);
		if(sheet==null) {
			errorMsg.append("Excel中名为[").append(sheetName).append("]的工作表不存在! ");
			return null;
		}
		ExcelReader excelReader=ExcelUtil.getReader(jBoltExcel.getFromFile(),sheetName);
		excelReader.setIgnoreEmptyRow(true);
		processExcelHeaders(excelReader, sheet);
		
		List<Map<String, Object>> datas=readDatas(excelReader,sheet);
		if(datas==null||datas.size()==0) {return null;}
		
		List<T> ts=new ArrayList<T>();
		JBoltExcelDataChangeHandler changeHandler=sheet.getDataChangeHandler();
		
		T t;
		JBoltExcelData excelData;
		for(Map<String, Object> data:datas) {
			excelData=new JBoltExcelData(data);
			if(changeHandler!=null) {
				changeHandler.change(excelData);
			}
			t=toModel(modelClass, excelData, false,errorMsg);
			if(t!=null) {
				ts.add(t);
			}
		}
		
		return ts;
	}
	/**
	 * 读取excel数据
	 * @param excelReader
	 * @param jBoltExcel
	 * @return
	 */
	private static List<Map<String, Object>> readDatas(ExcelReader excelReader, JBoltExcelSheet sheet) {
		return excelReader.read(sheet.getHeaderStartRow(),sheet.getDataStartRow(),excelReader.getRowCount()-1);
	}

	/**
	 * 从Excel中读取records
	 * @param jBoltExcel
	 * @param dataStartRow
	 * @return
	 */
	public static List<Record> readRecords(JBoltExcel jBoltExcel,JBoltExcelSheet sheet,int dataStartRow){
		ExcelReader excelReader=ExcelUtil.getReader(jBoltExcel.getFromFile(),sheet.getName());
		int endRow=excelReader.getRowCount()-1;
		List<JBoltExcelData> datas=excelReader.read(sheet.getHeaderStartRow(), dataStartRow, endRow, JBoltExcelData.class);
		if(datas==null||datas.size()==0) {return null;}
		List<Record> records=new ArrayList<Record>();
		Record record;
		for(JBoltExcelData data:datas) {
			record=toRecord(data);
			if(record!=null) {
				records.add(record);
			}
		}
		return records;
	}
	
	public static final Record toRecord(JBoltExcelData data) {
		return new Record().setColumns(data);
	}
	@SuppressWarnings("unchecked")
	public static final <T> T toModel(Class<T> modelClass,JBoltExcelData data,boolean skipConvertError,StringBuilder errorMsg) {
		Object temp = null;
		try {
			temp= modelClass.newInstance();
		} catch (Exception e) {
			errorMsg.append("指定Modelclass无效，无法实例化");
			return null;
		}
		Model<?> model = (Model<?>)temp;
		Table table = TableMapping.me().getTable(model.getClass());
		if (table == null) {
			errorMsg.append("The Table mapping of model: ").append(modelClass.getName()).append(" not exists or the ActiveRecordPlugin not start.");
			return null;
		}
		
		TypeConverter converter = TypeConverter.me();
		// 对 paraMap进行遍历而不是对table.getColumnTypeMapEntrySet()进行遍历，以便支持 CaseInsensitiveContainerFactory
		// 以及支持界面的 attrName有误时可以感知并抛出异常避免出错
		//得到数据的columns
		List<String> columns=CollUtil.newArrayList(data.keySet());
		int size=columns.size();
		String attrName;
		Object colData;
		for (int i=0;i<size;i++) {
			attrName=columns.get(i);
			Class<?> colType=null;
			if(table.hasColumnLabel(attrName)) {
				colType = table.getColumnType(attrName);
			}else {
				if(attrName.indexOf("_")==-1) {
					attrName=StrUtil.toUnderlineCase(attrName);
					if(table.hasColumnLabel(attrName)) {
						colType = table.getColumnType(attrName);
					}
				}
			}
			if (colType == null) {
				if (skipConvertError) {
					continue ;
				} else {
					errorMsg.append("The model attribute ").append( attrName).append(" is not exists.");
					return null;
				}
			}
			
			try {
				colData=data.get(attrName);
				Object value =  colData!= null ? converter.convert(colType, colData.toString()) : null;
				model.set(attrName, value);
			} catch (Exception e) {
				if (skipConvertError == false) {
					errorMsg.append("Can not convert parameter: ").append( attrName);
					return null;
				}
			}
		}
		
		return (T)model;
	}
}
