package cn.xt.sms.service.impl;

import cn.xt.sms.dao.IContactDao;
import cn.xt.sms.dao.ICooperationDao;
import cn.xt.sms.entity.Cooperation;
import cn.xt.sms.service.IContactService;
import cn.xt.sms.service.ICooperationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/23
 */
@Service
public class CooperationServiceImpl implements ICooperationService {

    @Autowired
    private ICooperationDao cooperationDao;
    @Autowired
    private IContactService contactService;

    @Override
    public Integer selectContactIdById(Integer id) {
        return cooperationDao.selectContactIdById(id);
    }

    @Override
    public List<Integer> selectIdByEnterpriseId(Integer enterpriseId) {
        return cooperationDao.selectIdByEnterpriseId(enterpriseId);
    }

    @Override
    @Transactional
    public Integer deleteCooperation(Integer id) {
        /*1:根据Id查询联系人Id*/
        Integer contactId = cooperationDao.selectContactIdById(id);
        /*2:根据ContactId删除联系人信息*/
        contactService.deleteContact(contactId);
        /*3:删除合作情况信息*/
        return cooperationDao.deleteCooperation(id);
    }

    @Override
    @Transactional
    public Integer updateCooperation(Cooperation cooperation) {
        Integer result = 1;
        if (cooperation.isNotNull()) {
            if (cooperation.getContactId() != null) {
                /*1:根据CooperationId查询联系人Id*/
                Integer contactId = cooperationDao.selectContactIdById(cooperation.getId());
                /*2:根据ContactId更新联系人信息*/
                cooperation.getContactId().setId(contactId);
                contactService.updateContact(cooperation.getContactId());
            }
            /*3:更新合作情况信息*/
            result = cooperationDao.updateCooperation(cooperation);
        }
        return result;
    }

    @Override
    @Transactional
    public Integer insertCooperation(Cooperation cooperation) {
        Integer result = 1;
        if (cooperation.isNotNull()) {
            /*1:插入Contact信息*/
            contactService.insertContact(cooperation.getContactId());
            /*2:插入Cooperation信息*/
            result = cooperationDao.insertCooperation(cooperation);
        }
        return result;
    }

}
