package cn.xt.sms.dao;

import cn.xt.sms.entity.DocumentType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Auther: xietao
 * @Date: 2018/7/31
 * @Description: 文档类型 数据接口层
 */
public interface IDocumentTypeDao {

    // 添加文档类型
    Integer insertDocumentType(DocumentType type);

    // 删除文档类型
    Integer deleteDocumentType(Integer[] ids);

    // 获取文档类型集合
    List<DocumentType> getDocumentTypeList();

    // 修改使用频率
    Integer updateUseFrequency(@Param("id") Integer id,
                               @Param("increment") Integer increment);

}
