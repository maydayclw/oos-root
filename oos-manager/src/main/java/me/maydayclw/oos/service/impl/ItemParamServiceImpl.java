package me.maydayclw.oos.service.impl;

import me.maydayclw.oos.mapper.ItemParamMapperCustom;
import me.maydayclw.oos.pojo.Item;
import me.maydayclw.oos.service.ItemParamService;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/22 </p>
 * <p>Time: 18:59 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public class ItemParamServiceImpl implements ItemParamService {
    @Resource
    private ItemParamMapperCustom itemParamMapperCustom;

    @Override
    public boolean deleteItemParams(List<Item> itemList) throws Exception {
        int deleteCount = itemParamMapperCustom.deleteByIds(itemList);
        return deleteCount > 0;
    }
}
