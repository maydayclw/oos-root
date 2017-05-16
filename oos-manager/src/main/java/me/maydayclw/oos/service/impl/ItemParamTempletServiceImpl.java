package me.maydayclw.oos.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.mapper.ItemParamTempletMapper;
import me.maydayclw.oos.mapper.ItemParamTempletMapperCustom;
import me.maydayclw.oos.pojo.ItemParamTemplet;
import me.maydayclw.oos.pojo.ItemParamTempletDto;
import me.maydayclw.oos.pojo.ItemParamTempletExample;
import me.maydayclw.oos.service.ItemParamTempletService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/14 </p>
 * <p>Time: 13:47 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Service
public class ItemParamTempletServiceImpl implements ItemParamTempletService {

    @Resource
    private ItemParamTempletMapper itemParamTempletMapper;
    @Resource
    private ItemParamTempletMapperCustom itemParamTempletMapperCustom;

    @Override
    public PageResult<ItemParamTemplet> getItemParamTempletList(Integer pageNumber, Integer pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        ItemParamTempletExample itemParamTempletExample = new ItemParamTempletExample();
        List<ItemParamTemplet> itemParamTempletList = itemParamTempletMapper.selectByExampleWithBLOBs(itemParamTempletExample);
        PageInfo<ItemParamTemplet> pageInfo = new PageInfo<>(itemParamTempletList);
        long total = pageInfo.getTotal();
        if (itemParamTempletList != null) {
            return new PageResult<>(total, itemParamTempletList);
        }
        return null;
    }

    @Override
    public ItemParamTemplet getItemParamTempletByCid(Long itemCatId) {
        ItemParamTempletExample itemParamTempletExample = new ItemParamTempletExample();
        ItemParamTempletExample.Criteria criteria = itemParamTempletExample.createCriteria();
        //查询条件
        criteria.andItemCatIdEqualTo(itemCatId);
        List<ItemParamTemplet> itemParamTempletList = itemParamTempletMapper.selectByExampleWithBLOBs(itemParamTempletExample);
        if(itemParamTempletList !=null && itemParamTempletList.size()!=0){
            return itemParamTempletList.get(0);
        }
        return null;
    }

    @Override
    public int insertItemParamTemplet(ItemParamTemplet itemParamTemplet) throws Exception{
        itemParamTemplet.setCreated(new Date());
        itemParamTemplet.setUpdated(new Date());
        return itemParamTempletMapper.insert(itemParamTemplet);
    }

    @Override
    public boolean deleteItemParamTemplet(List<ItemParamTempletDto> itemParamTempletList) {
        int count = itemParamTempletMapperCustom.deleteByIds(itemParamTempletList);
        return count == itemParamTempletList.size();
    }
}
