package me.maydayclw.oos.service;

import me.maydayclw.oos.dto.AjaxResult;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.Item;
import me.maydayclw.oos.pojo.ItemQueryParams;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/19 </p>
 * <p>Time: 13:25 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public interface ItemService {

    /**
     * 获取商品列表
     * @param pageNumber 页码
     * @param pageSize 每页多少条数据
     * @return 分页结果
     */
    PageResult<Item> getItemList(Integer pageNumber, Integer pageSize,ItemQueryParams itemQueryParams) ;
    /**
     * 添加商品
     * @param item 商品
     * @param desc 商品描述
     * @param itemParams 商品对应的规格参数
     * @return 添加json结果
     */
    AjaxResult<Integer> createItem(Item item,String desc,String itemParams) throws Exception;
    /**
     * 根据用户ID批量删除商品
     * @param itemList 商品列表
     * @return 是否删除成功
     */
    boolean deleteItems(List<Item> itemList) throws Exception;

    /**
     * 批量上架
     * @param itemList 商品列表
     * @return 是否成功
     * @throws Exception 异常
     */
    boolean updateItemsUp(List<Item> itemList) throws Exception;

    /**
     * 批量下架
     * @param itemList 商品列表
     * @return 是否成功
     * @throws Exception 异常
     */
    boolean updateItemsDown(List<Item> itemList) throws Exception;

    /**
     * 更新商品
     * @param item 商品
     * @return 是否更新成功
     */
    boolean updateItem(Item item);
}
