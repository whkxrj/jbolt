package cn.jbolt.base.para;

import com.jfinal.upload.UploadFile;

/**
 * 参数校验接口
 * @ClassName:  IJBoltParaValidator   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年12月5日   
 */
public interface IJBoltParaValidator {
	/**
	 * 判断Object参数有效性
	 * @param param
	 */
	public boolean isOk(Object param);
	/**
	 * 判断Object参数是否无效
	 */
	public boolean notOk(Object param);
	/**
	 * 判断Object[]参数有效性
	 * @param param
	 */
	public boolean isOk(Object[] param);
	/**
	 * 判断Object[]参数是否无效
	 */
	public boolean notOk(Object[] param);
	
	/**
	 * 判断上传文件类型不是图片
	 * @param file
	 */
	public boolean notImage(UploadFile file);
	/**
	 * 判断上传文件类型是否为图片
	 * @param file
	 */
	public boolean isImage(UploadFile file);
	
	/**
	 * 判断上传文件是图片
	 * @param isImage
	 */
	public boolean isImage(String contentType);
	/**
	 * 判断上传文件不是图片
	 * @param notImage
	 */
	public boolean notImage(String contentType);
	/**
	 * 判断上传文件是excel
	 * @param isImage
	 */
	public boolean notExcel(UploadFile file);
	/**
	 * 判断上传文件不是excel
	 * @param notImage
	 */
	public boolean isExcel(UploadFile file);
}
