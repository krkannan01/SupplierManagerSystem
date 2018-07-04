package cn.xt.sms.dao;

import cn.xt.sms.entity.Cooperation;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/14
 */
public interface ICooperationDao {

    /*根据id查询ContactId*/
    Integer selectContactIdById(Integer id);

    /*根据enterpriseId查询id*/
    List<Integer> selectIdByEnterpriseId(Integer enterpriseId);

    /*删除合作情况信息*/
    Integer deleteCooperation(Integer id);

    /*更新企业信息*/
    Integer updateCooperation(Cooperation cooperation);

    /*插入企业信息*/
    Integer insertCooperation(Cooperation cooperation);

}
