package cn.jbolt.base.crossorigin;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
/**
  * 跨域注解  在Controller类上或者具体method上增加 可以支持跨域访问接口
 * @ClassName:  CrossOrigin   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2020年2月21日   
 */
@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface CrossOrigin {
 
}