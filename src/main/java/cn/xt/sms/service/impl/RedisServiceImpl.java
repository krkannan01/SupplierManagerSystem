package cn.xt.sms.service.impl;

import cn.xt.sms.service.IRedisService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.exceptions.JedisConnectionException;

import java.net.ConnectException;
import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/5/4
 */
@Service
public class RedisServiceImpl<T> implements IRedisService<T> {

    private Logger logger = Logger.getLogger(RedisServiceImpl.class);
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
            logger.error(e.getMessage());
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
            logger.error(e.getMessage());
        } finally {
            if (jedis != null) jedis.close();
        }
    }

}
