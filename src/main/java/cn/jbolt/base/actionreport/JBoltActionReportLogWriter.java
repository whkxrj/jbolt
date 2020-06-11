package cn.jbolt.base.actionreport;

import java.io.IOException;
import java.io.Writer;

import com.jfinal.log.Log;
/**
 * JBolt中的action report 日志输出处理
 * @ClassName:  JBoltActionReportLogWriter   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年12月4日   
 */
public class JBoltActionReportLogWriter extends Writer {
	private static final Log LOG=Log.getLog("JBoltActionReportLog");
	@Override
	public void write(String str) throws IOException {
		LOG.debug(str);
	}
	@Override
	public void write(char[] cbuf, int off, int len) throws IOException {
	}

	@Override
	public void flush() throws IOException {
	}

	@Override
	public void close() throws IOException {
	}

}
