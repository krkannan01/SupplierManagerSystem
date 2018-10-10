package cn.xt.sms.annotation;

import java.lang.annotation.*;

/**
 * @Auther: xietao
 * @Date: 2018/8/21
 * @Description:
 */
@Target({ ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface GetCache {
    /** 键 */
    String key();
    /** 有效时间 s 默认一个小时 */
    int expire() default 3600;
}
