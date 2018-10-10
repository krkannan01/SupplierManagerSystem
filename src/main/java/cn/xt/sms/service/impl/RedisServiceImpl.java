package cn.xt.sms.service.impl;

import cn.xt.sms.service.IRedisService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.net.ConnectException;
import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/5/4
 */
@Service
@Log4j
public class RedisServiceImpl extends RedisBasicServiceImpl implements IRedisService {

    public static final int EXIPRE_SECOND = 3600;

    @Autowired
    private JedisPool jedisPool;

    @Override
    public JSONArray getCacheList(String key) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            String result = jedis.get(key);
            if (result != null) {
                return JSON.parseArray(result);
            }
        } catch (Exception e) {
            log.error(e.getMessage());
        } finally {
            if (jedis != null) jedis.close();
        }
        return null;
    }

    @Override
    public void setCache(String key, Object value, int expire) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.set(key, JSON.toJSONString(value));
            jedis.expire(key, expire);
        } catch (Exception e) {
            log.error(e.getMessage());
        } finally {
            if (jedis != null) jedis.close();
        }
    }

    @Override
    public void delCache(String key) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.del(key);
        } catch (Exception e) {
            log.error(e.getMessage());
        } finally {
            if (jedis != null) jedis.close();
        }
    }

}
