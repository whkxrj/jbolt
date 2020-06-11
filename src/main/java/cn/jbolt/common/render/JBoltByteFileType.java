package cn.jbolt.common.render;

/**
 * Byte流的文件类型
 * 
 * @ClassName: ByteFileType
 * @author: JFinal学院-小木 QQ：909854136
 * @date: 2019年11月9日
 */
public enum JBoltByteFileType {
	XLSX("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "xlsx"), 
	XLS("application/vnd.ms-excel", "xls"), 
	TXT("text/plain", "txt"), 
	PDF("application/pdf", "pdf"), 
	JPG("image/jpeg", "jpg");
	public String contentType;
	public String suffix;

	JBoltByteFileType(String contentType, String suffix) {
		this.contentType = contentType;
		this.suffix = suffix;
	}
}
