package cn.jbolt.common.poi.excel;

import java.io.File;
import java.util.LinkedHashMap;
/**
 * JBolt提供Excel导出封装类
 * @ClassName:  JBoltExcel   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月10日   
 */
public class JBoltExcel {
	public static final int OPT_MODE_IMPORT=1;
	public static final int OPT_MODE_EXPORT=2;
	
	private int optMode;//1  导入  2 导出操作类型
	private String fileName;//文件名
	private boolean isBig;//格式设置
	private boolean isXlsx;//格式设置
	private File fromFile;//读取用的文件
	private LinkedHashMap<String,JBoltExcelSheet> sheets;
	private JBoltExcel(int optMode) {
		this.optMode=optMode;
		this.isBig=false;
		this.isXlsx=false;
	}
	private JBoltExcel(File fromFile) {
		this(OPT_MODE_IMPORT);
		this.fromFile=fromFile;
	}

	public static JBoltExcel create() {
		return new JBoltExcel(OPT_MODE_EXPORT);
	}
	public static JBoltExcel from(File file) {
		return new JBoltExcel(file);
	}
	public boolean isXlsx() {
		return isXlsx;
	}
	public JBoltExcel setXlsx(boolean isXlsx) {
		if(this.isBig) {
			this.isXlsx=true;
		}else {
			this.isXlsx = isXlsx;
		}
		return this;
	}
	
	  
	public byte[] toByteArray() {
		return JBoltExcelUtil.getExcelBytes(this);
	}
	public boolean isBig() {
		return isBig;
	}
	public JBoltExcel setBig(boolean isBig) {
		this.isBig = isBig;
		if(isBig) {
			this.isXlsx=true;
		}
		return this;
	}
	 
	public String getFileName() {
		return fileName;
	}
	public JBoltExcel setFileName(String fileName) {
		this.fileName = fileName;
		return this;
	}
	 
	public File getFromFile() {
		return fromFile;
	}
 
	public int getOptMode() {
		return optMode;
	}
	public JBoltExcel addSheet(JBoltExcelSheet sheet) {
		if(this.sheets==null) {
			this.sheets=new LinkedHashMap<String, JBoltExcelSheet>();
		}
		this.sheets.put(sheet.getName(), sheet);
		return this;
	}
	public JBoltExcel setSheets(JBoltExcelSheet... sheets) {
		if(sheets!=null&&sheets.length>0) {
			for(JBoltExcelSheet sheet : sheets) {
				addSheet(sheet);
			}
		}
		return this;
	}
	public LinkedHashMap<String, JBoltExcelSheet> getSheets() {
		return sheets;
	}
	public JBoltExcelSheet getSheet(String name) {
		return (this.sheets==null||this.sheets.isEmpty())?null:this.sheets.get(name);
	}
	public void setSheets(LinkedHashMap<String, JBoltExcelSheet> sheets) {
		this.sheets = sheets;
	}
	 
 
}
