package cn.xt.sms.test;

import lombok.Data;

/**
 * @Auther: xietao
 * @Date: 2018/7/11
 * @Description:
 */
public class LobmokTest {
    public static void main(String[] args) {
        System.out.println(new Student().getAge());
    }
}

@Data
class Student {
    private Integer id;
    private String name;
    private Integer age;
}