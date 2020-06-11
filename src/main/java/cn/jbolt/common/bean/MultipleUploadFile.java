package cn.jbolt.common.bean;

public class MultipleUploadFile {
	private String fileId;
	private String fileName;
	private String url;
	public MultipleUploadFile() {
		
	}
	public MultipleUploadFile(String fileId,String fileName,String url) {
		this.fileId=fileId;
		this.fileName=fileName;
		this.url=url;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
