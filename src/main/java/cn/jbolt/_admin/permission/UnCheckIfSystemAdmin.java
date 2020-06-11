package cn.jbolt._admin.permission;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
/**
 * 如果是SuperAdmin就不检测
 * @ClassName:  UnCheckIfSuperAdmin   
 * @author: JFinal学院-小木 QQ：909854136 
 * @date:   2019年10月28日   
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE, ElementType.METHOD})
public @interface UnCheckIfSystemAdmin {

}
