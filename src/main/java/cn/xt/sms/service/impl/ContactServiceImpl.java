package cn.xt.sms.service.impl;

import cn.xt.sms.dao.IContactDao;
import cn.xt.sms.entity.Contact;
import cn.xt.sms.service.IContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/23
 */
@Service
public class ContactServiceImpl implements IContactService {

    @Autowired
    private IContactDao contactDao;

    @Override
    public Integer insertContact(Contact contact) {
        Integer result = 1;
        if (contact != null && contact.isNotNull())
            result = contactDao.insertContact(contact);
        return result;
    }

    @Override
    public Integer updateContact(Contact contact) {
        Integer result = 1;
        if (contact != null && contact.isNotNull()) {
            result = contactDao.updateContact(contact);
        }
        return result;
    }

    @Override
    public Integer deleteContact(Integer contactId) {
        return contactDao.deleteContact(contactId);
    }
}
