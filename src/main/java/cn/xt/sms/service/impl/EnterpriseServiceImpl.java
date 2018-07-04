package cn.xt.sms.service.impl;

import cn.xt.sms.Result.MapResult;
import cn.xt.sms.Result.MyResult;
import cn.xt.sms.dao.IEnterpriseDao;
import cn.xt.sms.dao.ITradeGroupDao;
import cn.xt.sms.entity.*;
import cn.xt.sms.exception.NullCellValueException;
import cn.xt.sms.service.*;
import cn.xt.sms.Condition.EnterpriseCondition;
import cn.xt.sms.util.POIUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sun.misc.Cache;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static org.fusesource.jansi.Ansi.ansi;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/13
 */
@Service
public class EnterpriseServiceImpl implements IEnterpriseService {

    private final String CACHE_KEY = "ENTERPRISE_ID_AND_NAME";

    @Autowired
    private IEnterpriseDao enterpriseDao;
    @Autowired
    private IContactService contactService;
    @Autowired
    private ICooperationService cooperationService;
    @Autowired
    private IRedisService<MapResult> redisService;

    @Override
    public MyResult<Enterprise> getEnterpriseList(EnterpriseCondition enterpriseCondition, Integer currentPage, Integer pageSize) {
        /*计算偏移量*/
        pageSize = pageSize == null ? 10:pageSize;
        Integer offset = currentPage == null ? 0:(currentPage-1)*pageSize;
        offset = offset < 0 ? 0:offset;

        MyResult<Enterprise> enterpriseResult = new MyResult<Enterprise>();
        Integer count = enterpriseDao.selectEnterpriseCount(enterpriseCondition);

        /*判断偏移量是否超过总数，如果是，降低偏移量*/
        if (offset >= count) {
            offset = (count-1)/pageSize*pageSize;
        }

        List<Enterprise> enterpriseList = enterpriseDao.selectSimpleEnterprise(pageSize, offset, enterpriseCondition);
        if (enterpriseList != null && count != null) {
            enterpriseResult.setMsg("success");
            enterpriseResult.setCount(count);
            enterpriseResult.setRows(enterpriseList);
        } else {
            enterpriseResult.setMsg("error");
        }
        return enterpriseResult;
    }

    @Override
    public List<Enterprise> getEnterpriseList(Integer pageSize, Integer offset, EnterpriseCondition enterpriseCondition) {
        return enterpriseDao.selectEnterprise(pageSize, offset, enterpriseCondition);
    }

    @Override
    public Integer getEnterpriseCount(EnterpriseCondition enterpriseCondition) {
        return enterpriseDao.selectEnterpriseCount(enterpriseCondition);
    }


    @Override
    public Integer selectContactIdById(Integer id) {
        return enterpriseDao.selectContactIdById(id);
    }

    @Override
    @Transactional
    public String insertEnterprise(Enterprise enterprise) {
        /*1:添加企业联系人信息*/
        contactService.insertContact(enterprise.getContactId());
        /*2:添加企业信息*/
        enterprise.setEnterDate(new Date());
        enterpriseDao.addEnterprise(enterprise);
        /*3:添加联系人信息*/
        if (enterprise.getCooperationList() != null) {
            for (Cooperation cooperation : enterprise.getCooperationList()) {
                if (cooperation.isNotNull()) {
                    cooperation.setEnterpriseId(enterprise.getId());
                    cooperationService.insertCooperation(cooperation);
                }
            }
        }
        return "success";
    }

    @Override
    @Transactional
    public String deleteEnterprise(Integer id) {
        /*1:删除联系人信息*/
        Integer contactId = enterpriseDao.selectContactIdById(id);
        contactService.deleteContact(contactId);
        /*2:删除合作情况信息*/
        List<Integer> ids = cooperationService.selectIdByEnterpriseId(id);
        for (Integer cooperationId: ids) {
            cooperationService.deleteCooperation(cooperationId);
        }
        /*3:删除企业信息*/
        enterpriseDao.deleteEnterprise(id);
        return "success";
    }

    @Override
    @Transactional
    public String updateEnterprise(Enterprise enterprise) {
        /*1:更新联系人信息*/
        if (enterprise.getContactId() != null) {
            Integer contactId = enterpriseDao.selectContactIdById(enterprise.getId());
            enterprise.getContactId().setId(contactId);
            contactService.updateContact(enterprise.getContactId());
        }
        /*2:更新企业信息*/
        enterpriseDao.updateEnterprise(enterprise);
        /*3:更新合作情况*/
        /*3.1:查询已有的合作情况Id*/
        List<Integer> coopIds = cooperationService.selectIdByEnterpriseId(enterprise.getId());
        /*3.2:处理    分析情况 增加，删除，还是更新*/
        if (enterprise.getCooperationList() != null) {
            for (Cooperation cooperation : enterprise.getCooperationList()) {
                /*如果cooperation中有id，说明是不是要新增的*/
                if (cooperation.getId() != null) {
                    /*执行更新*/
                    cooperationService.updateCooperation(cooperation);
                    /*将已更新的id移出待处理id集合*/
                    coopIds.remove(cooperation.getId());
                } else {
                    cooperation.setEnterpriseId(enterprise.getId());
                    cooperationService.insertCooperation(cooperation);
                }
            }
        }
        /*3.3:coopIds中剩下的说明是要删除掉的*/
        for (Integer coopId: coopIds) {
            cooperationService.deleteCooperation(coopId);
        }
        return "success";
    }

    @Override
    public Enterprise getEnterpriseById(Integer id) {
        return enterpriseDao.getEnterpriseById(id);
    }

    @Override
    public UserDefinedFieldName getUserDefinedFieldName() {
        return enterpriseDao.getUserDefinedFieldName();
    }

    @Override
    public Integer getIdByFullName(String fullName) {
        return enterpriseDao.getIdByFullName(fullName);
    }

    @Override
    public List<Integer> getIdByTradeGroupId(Integer tradeGroupId) {
        return enterpriseDao.getIdByTradeGroupId(tradeGroupId);
    }

    @Override
    public List<MapResult> getEnterpriseIdAndName() {
        List<MapResult> list = redisService.getCacheList(CACHE_KEY);
        if (list == null) {
            synchronized (CACHE_KEY) {
                list = redisService.getCacheList(CACHE_KEY);
                if (list == null) {
                    list = enterpriseDao.getEnterpriseIdAndName();
                    redisService.setCache(CACHE_KEY, list, RedisServiceImpl.EXIPRE_SECOND);
                }
            }
        }
        return list;
    }

}
