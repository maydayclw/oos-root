package me.maydayclw.oos.service.impl;

import me.maydayclw.oos.mapper.ItemCatMapper;
import me.maydayclw.oos.pojo.ItemCat;
import me.maydayclw.oos.pojo.ItemCatExample;
import me.maydayclw.oos.service.ItemCatService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/12 </p>
 * <p>Time: 17:03 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Service
public class ItemCatServiceImpl implements ItemCatService {
    @Resource
    private ItemCatMapper itemCatMapper;
    @Override
    public List<ItemCat> getItemCatList(Long parentId) throws Exception {
        ItemCatExample example = new ItemCatExample();
        //设置查询条件
        ItemCatExample.Criteria criteria = example.createCriteria();
        //根据parentId查询子节点
        criteria.andParentIdEqualTo(parentId);
        //返回子节点列表
        return itemCatMapper.selectByExample(example);

    }

    @Override
    public ItemCat getItemCat(Long id) throws Exception {
        return itemCatMapper.selectByPrimaryKey(id);
    }
}
