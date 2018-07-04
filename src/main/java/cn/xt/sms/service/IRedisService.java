package cn.xt.sms.service;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/5/4
 */
public interface IRedisService<T> {

    List<T> getCacheList(String key);

    void setCache(String key, List<T> value, int expire);

}
