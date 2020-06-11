package cn.jbolt.common.poi.excel;

import com.jfinal.kit.StrKit;

/**
 * JBolt封装Excel Header
 * @ClassName:  JBoltExcelHeader   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月10日   
 */
public class JBoltExcelHeader{
	private String content;
	private String column;
	private int width;
	public JBoltExcelHeader(String column, String content) {
		this(column, content, 0);
	}
	public JBoltExcelHeader(String column, String content,int width) {
		this.column = column;
		this.content = content;
		this.width = width;
	}
	public static JBoltExcelHeader create(String column,String content) {
		return create(column, content,0);
	}
	public static JBoltExcelHeader create(String content,int width) {
		return create(null, content,width);
	}
	public static JBoltExcelHeader create(String column,String content,int width) {
		return new JBoltExcelHeader(column, content,width);
	}

	public String getContent() {
		return content;
	}

	public JBoltExcelHeader setContent(String content) {
		this.content = content;
		return this;
	}

	public String getColumn() {
		return column;
	}

	public JBoltExcelHeader setColumn(String column) {
		this.column = column;
		return this;
	}
	
	@Override
	public String toString() {
		if(StrKit.notBlank(content)) {return content;}
		if(StrKit.notBlank(column)) {return column;}
		return null;
	}
	public int getWidth() {
		return width;
	}
	public JBoltExcelHeader setWidth(int width) {
		this.width = width;
		return this;
	}
	
}
