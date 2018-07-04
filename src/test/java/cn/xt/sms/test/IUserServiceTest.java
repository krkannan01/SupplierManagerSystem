package cn.xt.sms.test;

import cn.xt.sms.Result.MyResult;
import cn.xt.sms.entity.User;
import cn.xt.sms.service.IUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import static org.junit.Assert.*;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/28
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
@Transactional
@TransactionConfiguration(defaultRollback = false)
public class IUserServiceTest {

    @Autowired
    private IUserService userService;

    @Test
    public void testGetUserList() throws Exception {
        MyResult<User> userResult = userService.getUserList("xie", 1, 10);
        System.out.println(123);
    }

    @Test
    public void testInsertUser() throws Exception {
        User user = new User();
        user.setUsername("测试账户02");
        user.setPassword("123456");
        userService.insertUser(user);
    }

}