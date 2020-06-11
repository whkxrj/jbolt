package cn.jbolt.base.api;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.SecretKey;

import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.kit.Base64Kit;
import com.jfinal.kit.HashKit;
import com.jfinal.kit.JsonKit;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;

import cn.hutool.core.util.IdUtil;
import cn.jbolt.base.JBoltControllerKit;
import cn.jbolt.common.model.Application;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.security.SignatureException;

/**
 * JBolt平台关于API JWT的实用管理工具类
 * 
 * @ClassName: JBoltApiJwtManger
 * @author: JFinal学院-小木 QQ：909854136
 * @date: 2019年9月12日
 */
public class JBoltApiJwtManger {
	private static final Log API_LOG=Log.getLog("JBoltApiLog");
	/**
	 * 有效期 默认两个小时 2 * 60 * 60 *1000 2小时
	 */
	private static final long JWT_TTL = 7200000L;
	/**
	 * 定义调用接口方传递TOKEN数据的KEY键
	 */
	public final static String JBOLT_API_TOKEN_KEY = "jboltjwt";
	public final static String JBOLT_JWT_SIGNATURE = "jboltsignature";
	public final static String JBOLT_JWT_TIMESTAMP = "jbolttimestamp";
	public final static String JBOLT_JWT_NONCE = "jboltnonce";
	private static JBoltApiJwtManger me = new JBoltApiJwtManger();

	public static JBoltApiJwtManger me() {
		return me;
	}

	/**
	 * 创建JBolt Api Token (JWT)
	 * 
	 * @param jwtParseRet
	 * @return
	 */
	public String createJBoltApiToken(JBoltJwtParseRet jwtParseRet) {
		// 默认两个小时过期
		return createJBoltApiToken(JBoltApiKit.getApplication(), jwtParseRet.getApiUser());
	}

	/**
	 * 创建JBolt Api Token (JWT)
	 * 
	 * @param application 所属应用APP
	 * @param apiUser     签发用户
	 * @return
	 * @throws Exception
	 */
	public String createJBoltApiToken(Application application, JBoltApiUser apiUser) {
		// 默认两个小时过期
		return createJBoltApiToken(application, apiUser, null);
	}

	/**
	 * 创建JBolt Api Token (JWT)
	 * 
	 * @param application 所属应用APP
	 * @param apiUser     签发用户
	 * @param ttlMillis   过期时长
	 * @return
	 * @throws Exception
	 */
	public String createJBoltApiToken(Application application, JBoltApiUser apiUser, Long ttlMillis) {
		// 生成JWT 签发 时间
		long nowMillis = System.currentTimeMillis();//
		Date now = new Date(nowMillis);
		// 计算过期时间 如果没传或者不合要求 使用默认两小时
		if (ttlMillis == null || ttlMillis <= 0) {
			ttlMillis = JWT_TTL;
		}
		Date ttlDate = new Date(nowMillis + ttlMillis);
		 // 指定签名的时候使用的签名算法，也就是header那部分，jjwt已经将这部分内容封装好了。
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
		// 得到加密秘钥 配置 一个app
		SecretKey key = generalKey(application.getAppSecret());
		// 构建claims
		Map<String, Object> claims = new HashMap<String, Object>();
		claims.put("apiUser", JsonKit.toJson(apiUser));
//		claims.put("appId", apiUser.getAppId());
//		claims.put("userId", apiUser.getUserId());
//		claims.put("userName", apiUser.getUserName());
//		if(StrKit.notBlank(apiUser.getSessionKey())) {
//			claims.put("sessionKey",apiUser.getSessionKey());
//		}

		// 构建payload 加密 合并压缩 生成 token
		return Jwts.builder().setClaims(claims)
				.setId(String.format("%s_%s_%s", apiUser.getAppId(),apiUser.getUserId(),IdUtil.fastSimpleUUID()))
				.setIssuer("JBOLT")
				.setAudience(apiUser.getUserName())
				.setIssuedAt(now)
				.signWith(key,signatureAlgorithm)
				.setExpiration(ttlDate)
				.compact();
	}

	/**
	 * 将APP的appSecret 生成 SecretKey
	 * 
	 * @param appSecret
	 * @return
	 */
	private SecretKey generalKey(String appSecret) {
		byte[] encodedKey = Base64Kit.decode(appSecret);
		return Keys.hmacShaKeyFor(encodedKey);
	}

	/**
	 * 从请求header里获取JWT生成的JBOLT API TOKEN
	 * 
	 * @return
	 */
	private String getJBoltApiToken(Controller controller) {
		return controller.getHeader(JBOLT_API_TOKEN_KEY);
	}

	/**
	 * 从请求header里获取JWT生成的JBOLT API TOKEN
	 * 
	 * @return
	 */
	public JBoltJwtParseRet getJwtParseRet(Invocation invocation) {
		return getJwtParseRet(invocation.getController());
	}


	/**
	 * 从请求header里获取JWT生成的JBOLT API TOKEN
	 * 
	 * @return
	 */
	public JBoltJwtParseRet getJwtParseRet(Controller controller) {
		String token = getJBoltApiToken(controller);
		if (StrKit.isBlank(token)) {
			return new JBoltJwtParseRet().setApiRet(JBoltApiRet.NO_JBOLT_JWT);
		}
		//校验application
		String appId = JBoltApiKit.getAppId();
		if (StrKit.isBlank(appId)) {
			return new JBoltJwtParseRet().setApiRet(JBoltApiRet.NO_JBOLT_APPID);
		}
		Application application = JBoltApiKit.getApplication();
		if (application == null) {
			return new JBoltJwtParseRet().setApiRet(JBoltApiRet.APPLICATION_NOT_EXIST(appId));
		}
		if (application.getEnable() == false) {
			return new JBoltJwtParseRet().setApiRet(JBoltApiRet.APPLICATION_NOT_ENABLE(application));
		}
		//判断是否需要校验sign
		if(application.getNeedCheckSign()) {
			boolean checkSignSuccess = checkJBoltJwtSignature(controller, token);
			
			if(checkSignSuccess==false) {
				return new JBoltJwtParseRet().setSignCheckFailed(true).setApiRet(JBoltApiRet.SIGNATURE_CHECK_FAILED(application));
			}
		}
		return parseJWT(application,token);
	}
	/**
	  * 验证Signature
	 * @param signature
	 * @param token
	 * @param timestamp
	 * @param nonce
	 * @return
	 */
	private boolean checkSignature(String signature, String token, String timestamp, String nonce) {
		String array[] = { token, timestamp, nonce };
		Arrays.sort(array);
		String tempStr = array[0] + array[1] + array[2];
		tempStr = HashKit.sha1(tempStr);
		return tempStr.equalsIgnoreCase(signature);
	}
	/**
	 * 验证Jbolt_jwt_sign
	 * @param controller
	 * @param token
	 * @return
	 */
	private boolean checkJBoltJwtSignature(Controller controller, String token) {
		String signature = controller.getHeader(JBOLT_JWT_SIGNATURE);
		String timestamp = controller.getHeader(JBOLT_JWT_TIMESTAMP);
		String nonce = controller.getHeader(JBOLT_JWT_NONCE);
		if (StrKit.isBlank(signature) || StrKit.isBlank(timestamp) || StrKit.isBlank(nonce)) {
			API_LOG.error("check signature failure: params are empty");
			return false;
		}

		if (checkSignature(signature, token, timestamp, nonce)) {
			return true;
		}
		API_LOG.error("check signature failure: " + " signature = " + controller.getPara("signature") + " timestamp = "
				+ controller.getPara("timestamp") + " nonce = " + controller.getPara("nonce"));

		return false;
	}

	/**
	 * 解析jwt
	 * 
	 * @param application
	 * @param jwt
	 * @return
	 */
	private JBoltJwtParseRet parseJWT(Application application,String jwt) {
		JBoltJwtParseRet jwtParseResut = new JBoltJwtParseRet();
		if (StrKit.isBlank(jwt)) {
			return jwtParseResut.setApiRet(JBoltApiRet.JWT_PARSE_FAIL(4, application, "jwt参数为空"));
		}
		//验证jwt三段格式
		String[] jwtArray = jwt.split("\\.");
		if (jwtArray == null || jwtArray.length != 3) {
			return jwtParseResut.setApiRet(JBoltApiRet.JWT_PARSE_FAIL(5, application, "jwt格式不正确"));
		}
		// 签名秘钥和生成的签名的秘钥一模一样
		SecretKey secretKey = generalKey(application.getAppSecret());
		Claims claims = null;
		try {
			claims = Jwts.parser().setSigningKey(secretKey).parseClaimsJws(jwt).getBody();
			if (claims == null || claims.containsKey("apiUser") == false) {
				jwtParseResut.setApiRet(JBoltApiRet.JWT_PARSE_FAIL(1,application));
				return jwtParseResut;
			}

		} catch (MalformedJwtException | SignatureException e) {
			// 签名错误或解析错误
			jwtParseResut.setApiRet(JBoltApiRet.JWT_PARSE_FAIL(2,application));
			return jwtParseResut;
		} catch (ExpiredJwtException e) {
			jwtParseResut.setExpired(true);
			// 过期
			jwtParseResut.setApiRet(JBoltApiRet.JWT_IS_EXPIRED);
			return jwtParseResut;
		} catch (Throwable ex) {
			// 其它
			String msg = ex.getMessage();
			jwtParseResut.setApiRet(JBoltApiRet.JWT_PARSE_FAIL(3,application,msg));
			return jwtParseResut;
		}
		String apiUserJson=claims.get("apiUser",String.class);
		if(StrKit.isBlank(apiUserJson)) {
			return jwtParseResut.setApiRet(JBoltApiRet.JWT_PARSE_FAIL(5, application, "jwt内未携带ApiUser信息"));
		}
		JBoltApiUserBean apiUser=JsonKit.parse(apiUserJson, JBoltApiUserBean.class);
		if(apiUser==null) {
			return jwtParseResut.setApiRet(JBoltApiRet.JWT_PARSE_FAIL(6, application, "jwt携带ApiUser信息无效"));
		}
		jwtParseResut.setApiUser(apiUser);
		return jwtParseResut;
	}

	/**
	 * 签发JWT
	 * 
	 * @param controller
	 */
	public void createJBoltApiTokenToResponse(Controller controller,Application application) {
		JBoltApiUser apiUser = JBoltApiKit.getApplyJwtUser();
		if(apiUser!=null) {
			// 创建
			String jwt = createJBoltApiToken(application, apiUser);
			JBoltControllerKit.setApiResponseJwt(controller,jwt);
		}
	}
}
