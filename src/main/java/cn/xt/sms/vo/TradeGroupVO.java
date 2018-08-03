package cn.xt.sms.vo;

import cn.xt.sms.entity.TradeGroup;
import com.fasterxml.jackson.databind.util.BeanUtil;
import jdk.internal.dynalink.beans.StaticClass;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.BeanUtils;

import java.util.List;

/**
 * @Auther: xietao
 * @Date: 2018/7/16
 * @Description: 供应商分组 视图对象
 */
@Getter
@Setter
public class TradeGroupVO { // DISCARD
    private Integer id;  // 分组id
    private String name;  // 分组名称
    private Integer parentId;  //
    private Integer count;  // 分组包含数量
    private List<TradeGroupVO> children;  // 分组子集

    public static TradeGroupVO transformToTradeGroupVO(TradeGroup tradeGroup) {
        TradeGroupVO tradeGroupVO = new TradeGroupVO();
        BeanUtils.copyProperties(tradeGroup, tradeGroupVO);
        return tradeGroupVO;
    }

    public static TradeGroup transformToTradeGroup(TradeGroupVO tradeGroupVO) {
        TradeGroup tradeGroup = new TradeGroup();
        BeanUtils.copyProperties(tradeGroupVO, tradeGroup);
        return tradeGroup;
    }

}
