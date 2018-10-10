package cn.xt.sms.util;

//import cn.xt.sms.websocket.WebSocket;

import cn.xt.sms.websocket.WebSocket;

import java.util.HashMap;
import java.util.Map;

/**
 * 实现存放在线信息的Map集合管理
 * @author xietao.x@qq.com
 * @date 2018/4/10
 */
public class DeadlineUtil {

    // <String, Long> key存放用户名信息， value存放过期时间信息
    private static Map<String, Long> states = new HashMap<String, Long>();

    //设置值, key键值  millisecond设置多少毫秒后过期
    public static void set(String key, Long millisecond) {
        states.put(key, System.currentTimeMillis() + millisecond);
    }

    /*返回该值是否过期*/
    public static boolean expire(String key) {
        Long time = states.get(key);
//        Long time = (Long) WebSocket.onlineUserMap.get(key);
        if (time != null) {
            //如果没有到过期时间
            if (time > System.currentTimeMillis()) {
                return false;
            } else {
//                WebSocket.onlineUserMap.remove(key);
                states.remove(key);
            }
        }
        return true;
    }

}