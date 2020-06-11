package cn.jbolt.base.actionreport;

import java.io.IOException;
import java.io.Writer;

/**
 * JFinal action Report 使用System Out 输出
 * @ClassName:  JBoltActionReportSystemOutWriter   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年12月8日   
 */
public class JBoltActionReportSystemOutWriter extends Writer {
	public void write(String str) throws IOException {
		System.out.print(str);
	}
	public void write(char[] cbuf, int off, int len) throws IOException {}
	public void flush() throws IOException {}
	public void close() throws IOException {}
}