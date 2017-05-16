package me.maydayclw.oos.service;

import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.ItemParamTemplet;
import me.maydayclw.oos.pojo.ItemParamTempletDto;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/14 </p>
 * <p>Time: 13:45 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public interface ItemParamTempletService {

    //获取规格参数模板列表
    PageResult<ItemParamTemplet> getItemParamTempletList(Integer pageNumber, Integer pageSize);

    /**
     * 根据类目id查询对应的模板
     * @param itemCatId 类目ID
     * @return 模板
     */
    ItemParamTemplet getItemParamTempletByCid(Long itemCatId);

    /**
     * 保存规格参数模板
     * @param itemParamTemplet 规格参数模板
     * @return 影响行数
     */
    int insertItemParamTemplet(ItemParamTemplet itemParamTemplet) throws Exception;
    /**
     * 根据用户ID批量删除规格参数模板
     * @param itemParamTempletList 规格参数列表
     * @return 是否删除成功
     */
    boolean deleteItemParamTemplet(List<ItemParamTempletDto> itemParamTempletList);
}
