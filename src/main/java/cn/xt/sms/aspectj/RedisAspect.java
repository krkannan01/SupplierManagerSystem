package cn.xt.sms.aspectj;

import cn.xt.sms.annotation.EvictCache;
import cn.xt.sms.annotation.GetCache;
import cn.xt.sms.annotation.Log;
import cn.xt.sms.dto.MapDTO;
import cn.xt.sms.service.IRedisService;
import cn.xt.sms.service.impl.RedisServiceImpl;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.apache.poi.ss.formula.functions.T;
import org.apache.xmlbeans.impl.xb.xsdschema.Annotated;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.JedisPool;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

/**
 * @Auther: xietao
 * @Date: 2018/8/21
 * @Description:
 */
@Log4j
@Aspect
@Component
public class RedisAspect {

    @Autowired
    private IRedisService redisService;

    @Pointcut("@annotation(cn.xt.sms.annotation.GetCache)")
    public void getCache() {}
    @Pointcut("@annotation(cn.xt.sms.annotation.EvictCache)")
    public void evictCache() {}

    //存取缓存
    @Around("getCache()")
    public Object getCacheDoAround (JoinPoint jp)
    {
        GetCache getCache = null;
        try {
            getCache = getGetCache(jp);
        } catch (Exception e) {
            log.error("获取注解信息失败！");
            return null;
        }

        String key = getCache.key();
        int expire = getCache.expire();

        Object obj = null;
        obj = redisService.getCacheList(key);
        if (obj == null) {
            synchronized (key) {
                obj = redisService.getCacheList(key);
                if (obj == null) {
                    try {
                        obj = ((ProceedingJoinPoint) jp).proceed();
                    } catch (Throwable throwable) {
                        throwable.printStackTrace();
                    }
                    redisService.setCache(key, obj, expire);
                }
            }
        }

        return obj;

    }

    //前置由于数据库数据变更  清理redis缓存
    @Before("evictCache()")
    public void evictCacheDoBefore (JoinPoint jp)
    {
        try{
            EvictCache evictCache = getEvictCache(jp);
            String key = evictCache.key();
            // 清除对应缓存
            redisService.del(key);
        }catch (Exception e) {
            e.printStackTrace();
            log.error("缓存服务器出现问题...");
        }
    }


    /**
     * 是否存在注解，如果存在就获取
     */
    private static EvictCache getEvictCache(JoinPoint joinPoint) throws Exception
    {
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        Method method = methodSignature.getMethod();

        if (method != null)
        {
            return method.getAnnotation(EvictCache.class);
        }
        return null;
    }

    private static GetCache getGetCache(JoinPoint joinPoint) throws Exception
    {
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        Method method = methodSignature.getMethod();

        if (method != null)
        {
            return method.getAnnotation(GetCache.class);
        }
        return null;
    }

}
