package me.maydayclw.oos.service;

import me.maydayclw.oos.pojo.Item;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/22 </p>
 * <p>Time: 18:46 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public interface ItemDescService {
    /**
     * 根据用户ID批量删除商品描述
     * @param itemList 商品列表
     * @return 是否删除成功
     */
    boolean deleteItemDescs(List<Item> itemList) throws Exception;
}
