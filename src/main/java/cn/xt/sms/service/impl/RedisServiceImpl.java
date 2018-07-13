package cn.xt.sms.service.impl;

import cn.xt.sms.service.IRedisService;
import com.alibaba.fastjson.JSON;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
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
public class RedisServiceImpl<T> implements IRedisService<T> {

    public static final int EXIPRE_SECOND = 3600;

    @Autowired
    private JedisPool jedisPool;

    @Override
    public List<T> getCacheList(String key) {
        List<T> list = null;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            String result = jedis.get(key);
            if (result != null) {
                list = (List<T>) JSON.parseArray(result);
            }
        } catch (Exception e) {
            log.error(e.getMessage());
        } finally {
            if (jedis != null) jedis.close();
        }
        return list;
    }

    @Override
    public void setCache(String key, List<T> value, int expire) {
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

}
