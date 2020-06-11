package cn.jbolt.common.poi.excel;
/**
 * JBolt Excel文件 合并单元格
 * @ClassName:  JBoltExcelMerge   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年3月10日   
 */
public class JBoltExcelMerge {
	private int firstRow;//首行
	private int lastRow;//末行
	private int firstColumn;//首列
	private int lastColumn;//末列
	private String content;//内容
	private String column;//列名
	private boolean isSetHeaderStyle;//是否为合并后的单元格设置默认标题样式
	/**
	 * 默认第一行 从第一列到指定列范围
	 * @param lastColumn
	 */
	public JBoltExcelMerge(int lastColumn) {
		this(lastColumn, null);
	}
	/**
	 * 默认第一行 从第一列到指定列范围
	 * @param lastColumn
	 * @return
	 */
	public static JBoltExcelMerge create(int lastColumn) {
		return new JBoltExcelMerge(lastColumn);
	}
	/**
	 * 默认第一行 从第一列到指定列范围
	 * @param lastColumn
	 * @param content
	 */
	public JBoltExcelMerge(int lastColumn,String content) {
		this(0, lastColumn, content);
	}
	/**
	 * 默认第一行 从第一列到指定列范围
	 * @param lastColumn
	 * @param content
	 */
	public static JBoltExcelMerge create(int lastColumn,String content) {
		return new JBoltExcelMerge(lastColumn, content);
	}
	/**
	 * 默认从第一行到指定行里的 第一列到指定列范围
	 * 跨行合并相同宽度区域
	 * @param lastRow
	 * @param lastColumn
	 */
	public JBoltExcelMerge(int lastRow,int lastColumn) {
		this(lastRow,lastColumn, null);
	}
	/**
	 * 默认从第一行到指定行里的 第一列到指定列范围
	 * 跨行合并相同宽度区域
	 * @param lastRow
	 * @param lastColumn
	 */
	public static JBoltExcelMerge create(int lastRow,int lastColumn) {
		return new JBoltExcelMerge(lastRow, lastColumn);
	}
	/**
	 * 默认从第一行到指定行里的 第一列到指定列范围
	 * 跨行合并相同宽度区域
	 * @param lastRow
	 * @param lastColumn
	 * @param content
	 */
	public JBoltExcelMerge(int lastRow,int lastColumn,String content) {
		this(0,lastRow,lastColumn, content);
	}
	/**
	 * 默认从第一行到指定行里的 第一列到指定列范围
	 * 跨行合并相同宽度区域
	 * @param lastRow
	 * @param lastColumn
	 * @param content
	 */
	public static JBoltExcelMerge create(int lastRow,int lastColumn,String content) {
		return new JBoltExcelMerge(lastRow, lastColumn, content);
	}
	/**
	 * 从指定行范围里的第一列到指定列范围
	 * 跨行合并相同宽度区域
	 * @param firstRow
	 * @param lastRow
	 * @param lastColumn
	 */
	public JBoltExcelMerge(int firstRow,int lastRow,int lastColumn) {
		this(firstRow, lastRow,lastColumn, null);
	}
	/**
	 * 从指定行范围里的第一列到指定列范围
	 * 跨行合并相同宽度区域
	 * @param firstRow
	 * @param lastRow
	 * @param lastColumn
	 */
	public static JBoltExcelMerge create(int firstRow,int lastRow,int lastColumn) {
		return new JBoltExcelMerge(firstRow, lastRow, lastColumn);
	}
	/**
	 * 从指定行范围里的第一列到指定列范围
	 * 跨行合并相同宽度区域
	 * @param firstRow
	 * @param lastRow
	 * @param lastColumn
	 * @param content
	 */
	public JBoltExcelMerge(int firstRow,int lastRow,int lastColumn,String content) {
		this(firstRow, lastRow,0,lastColumn, content,false);
	}
	
	/**
	 * 从指定行范围里的第一列到指定列范围
	 * 跨行合并相同宽度区域
	 * @param firstRow
	 * @param lastRow
	 * @param lastColumn
	 * @param content
	 */
	public static JBoltExcelMerge create(int firstRow,int lastRow,int lastColumn,String content) {
		return new JBoltExcelMerge(firstRow, lastRow, lastColumn, content);
	}
	
	/**
	 *从指定行范围里的第一列到指定列范围
	 * 跨行合并相同宽度区域
	 * 可以指定是否为合并后的单元格设置默认标题样式
	 * @param firstRow
	 * @param lastRow
	 * @param lastColumn
	 * @param isSetHeaderStyle
	 */
	public JBoltExcelMerge(int firstRow,int lastRow,int lastColumn,boolean isSetHeaderStyle) {
		this(firstRow, lastRow,lastColumn, null,isSetHeaderStyle);
	}
	/**
	 *从指定行范围里的第一列到指定列范围
	 * 跨行合并相同宽度区域
	 * 可以指定是否为合并后的单元格设置默认标题样式
	 * @param firstRow
	 * @param lastRow
	 * @param lastColumn
	 * @param isSetHeaderStyle
	 */
	public static JBoltExcelMerge create(int firstRow,int lastRow,int lastColumn,boolean isSetHeaderStyle) {
		return new JBoltExcelMerge(firstRow, lastRow, lastColumn, isSetHeaderStyle);
	}
	/**
	 *从指定行范围里的第一列到指定列范围
	 * 跨行合并相同宽度区域
	 * 可以指定是否为合并后的单元格设置默认标题样式
	 * @param firstRow
	 * @param lastRow
	 * @param lastColumn
	 * @param content
	 * @param isSetHeaderStyle
	 */
	public JBoltExcelMerge(int firstRow,int lastRow,int lastColumn,String content,boolean isSetHeaderStyle) {
		this(firstRow, lastRow,0,lastColumn, content,isSetHeaderStyle);
	}
	/**
	 *从指定行范围里的第一列到指定列范围
	 * 跨行合并相同宽度区域
	 * 可以指定是否为合并后的单元格设置默认标题样式
	 * @param firstRow
	 * @param lastRow
	 * @param lastColumn
	 * @param content
	 * @param isSetHeaderStyle
	 */
	public static JBoltExcelMerge create(int firstRow,int lastRow,int lastColumn,String content,boolean isSetHeaderStyle) {
		return new JBoltExcelMerge(firstRow, lastRow, lastColumn, content, isSetHeaderStyle);
	}
	/**
	 *指定矩形范围从第几行到第几行 从第几列到第几列
	 * @param firstRow
	 * @param lastRow
	 * @param firstColumn
	 * @param lastColumn
	 * @param content
	 */
	public JBoltExcelMerge(int firstRow,int lastRow,int firstColumn,int lastColumn,String content) {
		this(firstRow, lastRow, firstColumn, lastColumn, content, false);
	}
	/**
	 *指定矩形范围从第几行到第几行 从第几列到第几列
	 * @param firstRow
	 * @param lastRow
	 * @param firstColumn
	 * @param lastColumn
	 * @param content
	 */
	public static JBoltExcelMerge create(int firstRow,int lastRow,int firstColumn,int lastColumn,String content) {
		return new JBoltExcelMerge(firstRow, lastRow, lastColumn, content);
	}
	/**
	 *指定矩形范围从第几行到第几行 从第几列到第几列
	 * @param firstRow
	 * @param lastRow
	 * @param firstColumn
	 * @param lastColumn
	 */
	public JBoltExcelMerge(int firstRow,int lastRow,int firstColumn,int lastColumn) {
		this(firstRow, lastRow, firstColumn, lastColumn, null);
	}
	/**
	 *指定矩形范围从第几行到第几行 从第几列到第几列
	 * @param firstRow
	 * @param lastRow
	 * @param firstColumn
	 * @param lastColumn
	 */
	public static JBoltExcelMerge create(int firstRow,int lastRow,int firstColumn,int lastColumn) {
		return new JBoltExcelMerge(firstRow, lastRow, firstColumn, lastColumn);
	}
	/**
	 * 指定行列范围合并
	 * 设置内容
	 * 可以指定是否为合并后的单元格设置默认标题样式
	 * @param firstRow
	 * @param lastRow
	 * @param firstColumn
	 * @param lastColumn
	 * @param content
	 * @param isSetHeaderStyle
	 */
	public JBoltExcelMerge(int firstRow,int lastRow,int firstColumn,int lastColumn,String content,boolean isSetHeaderStyle) {
		this.firstRow=firstRow;
		this.lastRow=lastRow;
		this.firstColumn=firstColumn;
		this.lastColumn=lastColumn;
		this.content=content;
		this.isSetHeaderStyle=isSetHeaderStyle;
	}
	/**
	 * 指定行列范围合并
	 * 设置内容
	 * 可以指定是否为合并后的单元格设置默认标题样式
	 * @param firstRow
	 * @param lastRow
	 * @param firstColumn
	 * @param lastColumn
	 * @param isSetHeaderStyle
	 */
	public JBoltExcelMerge(int firstRow,int lastRow,int firstColumn,int lastColumn,boolean isSetHeaderStyle) {
		this(firstRow, lastRow, firstColumn, lastColumn, null, isSetHeaderStyle);
	}
	/**
	 * 指定行列范围合并
	 * 设置内容
	 * 可以指定是否为合并后的单元格设置默认标题样式
	 * @param firstRow
	 * @param lastRow
	 * @param firstColumn
	 * @param lastColumn
	 * @param isSetHeaderStyle
	 */
	public static JBoltExcelMerge create(int firstRow,int lastRow,int firstColumn,int lastColumn,boolean isSetHeaderStyle) {
		return new JBoltExcelMerge(firstRow, lastRow, firstColumn, lastColumn, isSetHeaderStyle);
	}
	public int getFirstRow() {
		return firstRow;
	}
	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}
	public int getLastRow() {
		return lastRow;
	}
	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
	}
	public int getFirstColumn() {
		return firstColumn;
	}
	public void setFirstColumn(int firstColumn) {
		this.firstColumn = firstColumn;
	}
	public int getLastColumn() {
		return lastColumn;
	}
	public void setLastColumn(int lastColumn) {
		this.lastColumn = lastColumn;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public boolean isSetHeaderStyle() {
		return isSetHeaderStyle;
	}
	public void setSetHeaderStyle(boolean isSetHeaderStyle) {
		this.isSetHeaderStyle = isSetHeaderStyle;
	}
	public String getColumn() {
		return column;
	}
	public JBoltExcelMerge setColumn(String column) {
		this.column = column;
		return this;
	}
}
