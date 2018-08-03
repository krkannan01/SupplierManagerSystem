package cn.xt.sms.test;

import cn.xt.sms.dto.MapDTO;
import com.alibaba.fastjson.JSON;

import java.util.Timer;
import java.util.TimerTask;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/28
 */
public class Main {
    public static void main(String[] args) {
//        System.out.println(-1/10);
//        setTask("1");
//        setTask("2");

//        Long startTime = System.currentTimeMillis();
//        for (int i=0; i<100000; i++) {
//            Supplier supplier = new Supplier();
//        }
//        System.out.println("实例化100000个Supplier耗时:" + (System.currentTimeMillis() - startTime) + "毫秒!");
//        //13ms
//
//        startTime = System.currentTimeMillis();
//        for (int i=0; i<100000; i++) {
//            ProductBrand productBrand = new ProductBrand();
//        }
//        System.out.println("实例化100000个ProductBrand耗时:" + (System.currentTimeMillis() - startTime) + "毫秒!");
//        //6ms

//        System.out.println(ansi().eraseScreen().render("@|red java|@"));

        MapDTO result = new MapDTO("message", "出现错误");
        System.out.println(JSON.toJSONString(result));

    }
    public static void setTask(String s) {
        new Timer().schedule(new TimerTask() {
            @Override
            public void run() {
                System.out.println(s);
            }
        }, 10000);
    }
}
