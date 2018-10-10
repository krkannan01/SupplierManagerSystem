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
public @interface EvictCache {
    String key();
}
