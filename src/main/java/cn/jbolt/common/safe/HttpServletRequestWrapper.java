package cn.jbolt.common.safe;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

import com.jfinal.kit.StrKit;

import cn.hutool.core.util.StrUtil;

/**
 * @desc 处理Xss漏洞
 */
public class HttpServletRequestWrapper extends javax.servlet.http.HttpServletRequestWrapper{

    private HttpServletRequest request;

    public HttpServletRequestWrapper(HttpServletRequest request) {
        super(request);
        this.request = request;
    }
    /**
     * 重写getmeter方法
     */
    @Override
    public String getParameter(String name) {
        String value = this.request.getParameter(name);
        if (value == null)
            return null;
        value = processXSS(value);
        return value;
    }
    /**
     * 重写并过滤getParameterValues方法
     */
    @Override
    public String[] getParameterValues(String name) {
        String[] values = super.getParameterValues(name);
        if (null == values){
            return null;
        }
        int len=values.length;
        for (int i = 0; i < len; i++) {
            values[i] = processXSS(values[i]);
        }
        return values;
    }
    /**
     * 重写getmeterMap
     */
    @Override
    public Map<String, String[]> getParameterMap() {
        Map<String, String[]> parameterMap =super.getParameterMap();
        Map<String, String[]> newMap = new HashMap<String, String[]>();
        for (Entry<String, String[]> entry : parameterMap.entrySet()) { 
            newMap.put(entry.getKey(), new String[]{processXSS(entry.getValue()[0])});
        }
        return newMap;
    }
    /**
     *  @desc jsoup处理
     *  @param str 
     */
    private String jsoupFormat(String str) {
    	if(StrKit.isBlank(str)) {return null;}
        return  Jsoup.clean(str, Whitelist.basicWithImages());
    }
    /**
     * 过滤正则表达式合集
     */
    private static final Pattern[] scriptPatterns= {
            Pattern.compile("<script>(.*?)</script>", Pattern.CASE_INSENSITIVE),
    		Pattern.compile("src[\r\n]*=[\r\n]*\\\'(.*?).js\\\'",
            Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
    		Pattern.compile("src[\r\n]*=[\r\n]*\\\"(.*?).js\\\"",
            Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
    		Pattern.compile("</script>", Pattern.CASE_INSENSITIVE),
    		Pattern.compile("<script(.*?)>",
            Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
    		Pattern.compile("eval\\((.*?)\\)",
            Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
    		Pattern.compile("e­xpression\\((.*?)\\)",
            Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
    		Pattern.compile("javascript:", Pattern.CASE_INSENSITIVE),
    		Pattern.compile("vbscript:", Pattern.CASE_INSENSITIVE),
    		Pattern.compile("onload(.*?)=",
            Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
    		Pattern.compile("alert\\((.*?)\\)",
            Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
    		Pattern.compile("window.location(.*?)=",
            Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
    		Pattern.compile("unescape\\((.*?)\\)",
            Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
    		Pattern.compile("execscript\\((.*?)\\)",
            Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
    		Pattern.compile("msgbox\\((.*?)\\)",
            Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
    		Pattern.compile("confirm\\((.*?)\\)",
            Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
    		Pattern.compile("prompt\\((.*?)\\)",
            Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL)
	};
    
    /**
          * 正则处理
     * @param value
     * @return
     */
    private String processXSS(String value) {
        if (StrUtil.isNotBlank(value)) {
        	for(Pattern pattern:scriptPatterns) {
        		value = pattern.matcher(value).replaceAll("");
        	}
        }
        return value;
    }
}
