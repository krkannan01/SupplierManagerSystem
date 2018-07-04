package cn.xt.sms.dao;

import cn.xt.sms.entity.Contact;
import org.apache.ibatis.annotations.Param;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/14
 */
public interface IContactDao {

    /*插入联系人信息*/
    Integer insertContact(Contact contact);

    /*修改联系人信息*/
    Integer updateContact(Contact contact);

    /*删除联系人信息*/
    Integer deleteContact(Integer id);

}
