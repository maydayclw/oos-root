package me.maydayclw.oos.mapper;

import me.maydayclw.oos.pojo.Item;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/22 </p>
 * <p>Time: 18:36 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public interface ItemDescMapperCustom {
    /**
     * 根据ID批量删除
     * @param itemList 商品列表
     * @return 删除行数
     */
    int deleteByIds(List<Item> itemList);
}
