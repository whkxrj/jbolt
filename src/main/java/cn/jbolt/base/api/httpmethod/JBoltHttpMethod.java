package cn.jbolt.base.api.httpmethod;

  import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import cn.jbolt.base.api.HttpMethod;
/**
 * JBolt平台API接口访问 Controller中action注解
  * 限定request访问的method类型 默认只允许get
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
public @interface JBoltHttpMethod {
	HttpMethod[] value() default {HttpMethod.GET};
}