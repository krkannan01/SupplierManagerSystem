package cn.xt.sms.test;

import cn.xt.sms.dto.MapDTO;
import cn.xt.sms.service.ISupplierService;
import cn.xt.sms.service.IRedisService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.concurrent.CountDownLatch;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/28
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
@Transactional(transactionManager = "transactionManager")
@Rollback(false)
public class RedisServiceTest {

    @Autowired
    private IRedisService<MapDTO> redisService;
    @Autowired
    private ISupplierService supplierService;
//    @Autowired
//    private JedisPool jedisPool;

    @Test
    public void testGetRedis() {
//        Jedis jedis = jedisPool.getResource();
//        String result = jedis.get("supplier_id_and_name");
//        System.out.println("\n\n"+result+"\n\n");
//        jedis.close();
        List<MapDTO> list = redisService.getCacheList("supplier_id_and_name");
        if (list != null && list.size() > 0) {
            for (int i=0; i<list.size(); i++) {
                System.out.println(list.get(i));
            }
        } else {
            System.out.println("\n\nnull\n\n");
        }
    }

    @Test
    public void testSetRedis() {
        List<MapDTO> list = supplierService.getSupplierIdAndName();
        redisService.setCache("supplier_id_and_name", list, 120);
        System.out.println("设置缓存成功");
    }

    @Test
    public void testGetSupplierIdAndName() {
//        for (int i=0; i<5; i++) {
//            read();
//        }
        CountDownLatch count = new CountDownLatch(1);
        for (int i=0; i<5; i++) {
            new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        count.await();
                        read();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }).start();
        }
        count.countDown();
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private void read() {
        List<MapDTO> list = redisService.getCacheList("SUPPLIER_ID_AND_NAME");
        if (list == null) {
            synchronized ("SUPPLIER_ID_AND_NAME") {
                list = redisService.getCacheList("SUPPLIER_ID_AND_NAME");
                if (list == null) {
                    list = supplierService.getSupplierIdAndName();
                    redisService.setCache("SUPPLIER_ID_AND_NAME", list, 180);
                    System.out.println("\n Read in mysql \n");
                } else {
                    System.out.println("\n Read in cache \n");
                }
            }
        } else {
            System.out.println("\n Read in cache \n");
        }

        if (list != null && list.size() > 0) {
            for (int i=0; i<10; i++) {
                System.out.println(list.get(i));
            }
        } else {
            System.out.println("\n\nnull\n\n");
        }
    }


}