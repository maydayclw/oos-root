package me.maydayclw.oos.mapper;

import me.maydayclw.oos.pojo.Item;
import me.maydayclw.oos.pojo.ItemQueryParams;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/20 </p>
 * <p>Time: 17:14 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public interface ItemMapperCustom {
    List<Item> selectWithQueryAndOrder(ItemQueryParams itemQueryParams);
    /**
     * 根据ID批量删除
     * @param itemList 商品列表
     * @return 删除行数
     */
    int deleteByIds(List<Item> itemList);

    int updateItemsUpOrDown(@Param("list") List<Item> itemList, @Param("st") Byte status);
}
