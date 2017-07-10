package me.maydayclw.oos.service.impl;

import me.maydayclw.oos.mapper.ItemDescMapperCustom;
import me.maydayclw.oos.pojo.Item;
import me.maydayclw.oos.service.ItemDescService;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/22 </p>
 * <p>Time: 18:47 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public class ItemDescServiceImpl implements ItemDescService {

    @Resource
    private ItemDescMapperCustom itemDescMapperCustom;

    @Override
    public boolean deleteItemDescs(List<Item> itemList) throws Exception {
        int deleteCount = itemDescMapperCustom.deleteByIds(itemList);
        return deleteCount > 0;
    }
}
