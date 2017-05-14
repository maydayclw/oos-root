package me.maydayclw.oos.service;

import me.maydayclw.oos.pojo.ItemCat;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/12 </p>
 * <p>Time: 17:01 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public interface ItemCatService {
    /**
     * 根据父ID获取类目列表
     * @param parentId 父ID
     * @return 类目列表
     * @throws Exception 异常
     */
    List<ItemCat> getItemCatList(Long parentId) throws Exception;

    /**
     * 根据ID查询类目
     * @param id id
     * @return 类目
     * @throws Exception 异常
     */
    ItemCat getItemCat(Long id) throws Exception;
}
