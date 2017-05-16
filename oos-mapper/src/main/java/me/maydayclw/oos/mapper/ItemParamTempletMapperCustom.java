package me.maydayclw.oos.mapper;

import me.maydayclw.oos.pojo.ItemParamTempletDto;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/15 </p>
 * <p>Time: 16:54 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */

public interface ItemParamTempletMapperCustom {
    /**
     * 根据ID批量删除
     * @param itemParamTempletList 规格参数列表
     * @return 删除行数
     */
    int deleteByIds(List<ItemParamTempletDto> itemParamTempletList);
}
