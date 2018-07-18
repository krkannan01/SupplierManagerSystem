package cn.xt.sms.entity;

import lombok.Data;

/**
 * @Auther: xietao
 * @Date: 2018/7/14
 * @Description: 供应商种类
 */
@Data
public class SupplierCategory {
    /*`id` int(10) NOT NULL COMMENT 'ID',
  `name` varchar(20) NOT NULL COMMENT '供应商种类名称',
  `description` varchar(225) DEFAULT NULL COMMENT '描述',*/
    private Integer id;  // 种类ID
    private String name;  // 供应商种类名称
    private String description;  // 描述

}
