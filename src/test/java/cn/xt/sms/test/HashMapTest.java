package cn.xt.sms.test;

import java.util.HashMap;
import java.util.Map;

/**
 * @Auther: xietao
 * @Date: 2018/7/17
 * @Description:
 */
public class HashMapTest {

    public static void main(String[] args) {
        Map<String, String> map1 = new HashMap<>();
        Map<String, String> map2 = new HashMap<>();
        for (int i = 0; i < 1000000; i ++) {
            map1.put(i + "", i + "");
        }
        for (int i = 0; i < 10000; i ++) {
            map2.put(i + "", i + "");
        }

        long start = System.currentTimeMillis();
        for (int i = 0; i < 100; i ++) {
            map1.get("10001");
        }
        long end = System.currentTimeMillis();
        System.out.println("map1查找耗时：" + (end - start) + "ms!");
        start = end;
        for (int i = 0; i < 100; i ++) {
            map2.get("10001");
        }
        end = System.currentTimeMillis();
        System.out.println("map2查找耗时：" + (end - start) + "ms!");

    }

}
