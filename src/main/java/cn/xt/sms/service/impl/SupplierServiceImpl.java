package cn.xt.sms.service.impl;

import cn.xt.sms.dto.MapDTO;
import cn.xt.sms.response.DataResponse;
import cn.xt.sms.dao.ISupplierDao;
import cn.xt.sms.entity.*;
import cn.xt.sms.service.*;
import cn.xt.sms.condition.SupplierCondition;
import cn.xt.sms.util.NOUtil;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.ServletContext;
import java.util.Date;
import java.util.List;

import static org.fusesource.jansi.Ansi.ansi;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/13
 */
@Log4j
@Service
public class SupplierServiceImpl implements ISupplierService {

    private final String CACHE_KEY = "SUPPLIER_ID_AND_NAME";

    @Autowired
    private ISupplierDao supplierDao;
    @Autowired
    private IContactService contactService;
    @Autowired
    private ICooperationService cooperationService;
    @Autowired
    private IRedisService redisService;

    @Override
    public DataResponse<Supplier> getSupplierList(SupplierCondition supplierCondition, Integer currentPage, Integer pageSize) {
        /*计算偏移量*/
        pageSize = pageSize == null ? 10:pageSize;
        Integer offset = currentPage == null ? 0:(currentPage-1)*pageSize;
        offset = offset < 0 ? 0:offset;

        Integer count = supplierDao.selectSupplierCount(supplierCondition);

        /*判断偏移量是否超过总数，如果是，降低偏移量*/
        if (offset >= count) {
            offset = (count-1)/pageSize*pageSize;
        }

        List<Supplier> supplierList = supplierDao.selectSimpleSupplier(pageSize, offset, supplierCondition);

        if (supplierList != null && count != null)
            return new DataResponse<Supplier>().setSuccess(supplierList, count);
        else
            return new DataResponse<Supplier>().setError();
    }

    @Override
    public List<Supplier> getSupplierList(Integer pageSize, Integer offset, SupplierCondition supplierCondition) {
        return supplierDao.selectSupplier(pageSize, offset, supplierCondition);
    }

    @Override
    public Integer getSupplierCount(SupplierCondition supplierCondition) {
        return supplierDao.selectSupplierCount(supplierCondition);
    }


    @Override
    public Integer selectContactIdById(Integer id) {
        return supplierDao.selectContactIdById(id);
    }

    @Override
    @Transactional
    public String insertSupplier(ServletContext context, Supplier supplier) {
        /*1:添加企业联系人信息*/
        contactService.insertContact(supplier.getContactId());
        /*2:添加企业信息*/
        supplier.setEnterDate(new Date());
        supplier.setNo(NOUtil.getSupplierNo(context));
        supplierDao.addSupplier(supplier);
        /*3:添加合作情况信息*/
        if (supplier.getCooperationList() != null) {
            for (Cooperation cooperation : supplier.getCooperationList()) {
                if (cooperation.isNotNull()) {
                    cooperation.setSupplierId(supplier.getId());
                    cooperationService.insertCooperation(cooperation);
                }
            }
        }
        return "success";
    }

    @Override
    @Transactional
    public String deleteSupplier(Integer id) {
        /*1:删除联系人信息*/
        Integer contactId = supplierDao.selectContactIdById(id);
        contactService.deleteContact(contactId);
        /*2:删除合作情况信息*/
        List<Integer> ids = cooperationService.selectIdBySupplierId(id);
        for (Integer cooperationId: ids) {
            cooperationService.deleteCooperation(cooperationId);
        }
        /*3:删除企业信息*/
        supplierDao.deleteSupplier(id);
        return "success";
    }

    @Override
    @Transactional
    public String updateSupplier(Supplier supplier) {
        /*1:更新联系人信息*/
        if (supplier.getContactId() != null) {
            Integer contactId = supplierDao.selectContactIdById(supplier.getId());
            supplier.getContactId().setId(contactId);
            contactService.updateContact(supplier.getContactId());
        }
        /*2:更新企业信息*/
        supplierDao.updateSupplier(supplier);
        /*3:更新合作情况*/
        /*3.1:查询已有的合作情况Id*/
        List<Integer> coopIds = cooperationService.selectIdBySupplierId(supplier.getId());
        /*3.2:处理    分析情况 增加，删除，还是更新*/
        if (supplier.getCooperationList() != null) {
            for (Cooperation cooperation : supplier.getCooperationList()) {
                /*如果cooperation中有id，说明是不是要新增的*/
                if (cooperation.getId() != null) {
                    /*执行更新*/
                    cooperationService.updateCooperation(cooperation);
                    /*将已更新的id移出待处理id集合*/
                    coopIds.remove(cooperation.getId());
                } else {
                    cooperation.setSupplierId(supplier.getId());
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
    public Supplier getSupplierById(Integer id) {
        return supplierDao.getSupplierById(id);
    }

    @Override
    public UserDefinedFieldName getUserDefinedFieldName() {
        return supplierDao.getUserDefinedFieldName();
    }

    @Override
    public Integer getIdByFullName(String fullName) {
        return supplierDao.getIdByFullName(fullName);
    }

    @Override
    public List<Integer> getIdByTradeGroupId(Integer tradeGroupId) {
        return supplierDao.getIdByTradeGroupId(tradeGroupId);
    }

    @Override
    public List<MapDTO> getSupplierIdAndName() {
        List<MapDTO> list = null;
        try {
            list = (List<MapDTO>) (List) redisService.getCacheList(CACHE_KEY);
        } catch (ClassCastException e) {
            log.warn("获取到的缓存无法转换类型！");
        }
        if (list == null) {
            synchronized (CACHE_KEY) {
                try {
                    list = (List<MapDTO>) (List) redisService.getCacheList(CACHE_KEY);
                } catch (ClassCastException e) {
                    log.warn("获取到的缓存无法转换类型！");
                }
                if (list == null) {
                    list = supplierDao.getSupplierIdAndName();
                    redisService.setCache(CACHE_KEY, list, RedisServiceImpl.EXIPRE_SECOND);
                }
            }
        }
        return list;
    }

    @Override
    public String getMaxNo() {
        return supplierDao.getMaxNo();
    }

}
