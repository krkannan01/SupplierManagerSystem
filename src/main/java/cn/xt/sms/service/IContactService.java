package cn.xt.sms.service;

import cn.xt.sms.entity.Contact;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/23
 */
public interface IContactService {
    Integer insertContact(Contact contact);
    Integer updateContact(Contact contact);
    Integer deleteContact(Integer contactId);
}
