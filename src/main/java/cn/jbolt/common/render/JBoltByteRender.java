package cn.jbolt.common.render;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.Charset;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;

import com.jfinal.kit.StrKit;
import com.jfinal.render.Render;
import com.jfinal.render.RenderException;

import cn.hutool.core.net.URLEncoder;
/**
 * 通用的文件字节渲染器
 * 来自于 https://www.jfinal.com/share/1877
 * @ClassName:  ByteRender   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年11月9日   
 */
public class JBoltByteRender extends Render {
 
	private String fileName;// 下载名称
	private byte[] fileByte;
	//前端试图展示的文件类型，例如想通过浏览器直接打开为pdf类型
	private JBoltByteFileType fileType = JBoltByteFileType.PDF;
	//浏览器直接试图查看和下载两种方式
	private JBoltByteRenderType renderType = JBoltByteRenderType.VIEW;// 默认类型
 
	private ServletOutputStream outputStream;
 
	@Override
	public void render() {
 
		if (validate() == false) {
			throw new RenderException("请检查ByteRender属性值是否为空");
		}
 
		if (renderType == JBoltByteRenderType.DOWNLOAD) {
			response.setHeader("Content-Disposition", "attachment;" + encodeFileName());
		}
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Accept-Ranges", "bytes");
		response.setDateHeader("Expires", 0);
		response.setContentType(fileType.contentType);
 
		try {
			this.outputStream = response.getOutputStream();
			switch (fileType) {
			case JPG:
				renderImage();
				break;
			case PDF:
				renderPdf();
				break;
			case TXT:
				renderTxt();
				break;
			case XLS:
				outputStream.write(fileByte);
				break;
			case XLSX:
				outputStream.write(fileByte);
				break;
				default:
					outputStream.write(fileByte);
					break;
			}
			outputStream.flush();
			outputStream.close();
		} catch (IOException e) {
			String name = e.getClass().getSimpleName();
			if (name.equals("ClientAbortException") || name.equals("EofException")) {
			} else {
				throw new RenderException(e);
			}
		} catch (Exception e) {
			throw new RenderException(e);
		} finally {
			if (outputStream != null) {
				try {
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
 
	void renderPdf() throws IOException {
		outputStream.write(fileByte);
	}
 
	void renderImage() throws IOException {
		ByteArrayInputStream bais = new ByteArrayInputStream(fileByte);  
	    BufferedImage img =ImageIO.read(bais);
		ImageIO.write(img, fileType.suffix, outputStream);
	}
	
	void renderTxt() throws IOException {
		outputStream.write(fileByte);
	}
 
	/**
	 * filename编码
	 */
	public String encodeFileName() {
			String suffix="."+ fileType.suffix;
			if(!fileName.endsWith(suffix)) {
				fileName=fileName+suffix;
			}
			String encodedFileName=URLEncoder.createDefault().encode(fileName, Charset.forName("UTF-8"));
			return "filename=" + encodedFileName;
			 
	}
 
	private boolean validate() {
		if (renderType == null || fileType == null) {
			return false;
		}
		// 如果是下载，需要传入下载的名称
		if (renderType == JBoltByteRenderType.DOWNLOAD) {
			if (StrKit.isBlank(fileName)) {
				return false;
			}
		}
		if (fileByte == null || fileByte.length == 0) {
			return false;
		}
		return true;
	}
 
	public static JBoltByteRender create() {
		return new JBoltByteRender();
	}
	public static JBoltByteRender create(byte[] fileByte) {
		return create().setFileByte(fileByte);
	}
 
	public JBoltByteRender setFileName(String fileName) {
		this.fileName = fileName;
		return this;
	}
 
	public JBoltByteRender setFileByte(byte[] fileByte) {
		this.fileByte = fileByte;
		return this;
	}
 
	public JBoltByteRender setFileType(JBoltByteFileType fileType) {
		this.fileType = fileType;
		return this;
	}
 
	public JBoltByteRender setRenderType(JBoltByteRenderType renderType) {
		this.renderType = renderType;
		return this;
	}
 
	
 
	@Override
	public String toString() {
		return "ByteRender [fileName=" + fileName + ", fileByte[length]="
				+ (fileByte == null ? "null" : fileByte.length) + ", fileType=" + fileType + ", renderType="
				+ renderType + "]";
	}
}