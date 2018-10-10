package cn.xt.sms.service;

import com.alibaba.fastjson.JSONArray;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/5/4
 */
public interface IRedisService extends IRedisBasicService {

    JSONArray getCacheList(String key);

    void setCache(String key, Object value, int expire);

    void delCache(String key);

}
