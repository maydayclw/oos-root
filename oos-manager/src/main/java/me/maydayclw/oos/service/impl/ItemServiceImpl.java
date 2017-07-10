package me.maydayclw.oos.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import me.maydayclw.oos.dto.AjaxResult;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.mapper.*;
import me.maydayclw.oos.pojo.*;
import me.maydayclw.oos.service.ItemService;
import me.maydayclw.oos.util.IDUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/19 </p>
 * <p>Time: 13:27 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Service
public class ItemServiceImpl implements ItemService {

    @Resource
    private ItemMapper itemMapper;

    @Resource
    private ItemDescMapper itemDescMapper;

    @Resource
    private ItemParamMapper itemParamMapper;

    @Resource
    private ItemMapperCustom itemMapperCustom;

    @Resource
    private ItemDescMapperCustom itemDescMapperCustom;

    @Resource
    private ItemParamMapperCustom itemParamMapperCustom;


    @Override
    public PageResult<Item> getItemList(Integer pageNumber, Integer pageSize, ItemQueryParams itemQueryParams) {
        if (itemQueryParams.getSortName().equals("sellPoint")) {
            itemQueryParams.setSortName("sell_point");
        }
        if (itemQueryParams.getSortName().equals("groupPrice")) {
            itemQueryParams.setSortName("group_price");
        }
        if (itemQueryParams.getSortName().equals("lowPrice")) {
            itemQueryParams.setSortName("low_price");
        }
        //设置分页参数
        PageHelper.startPage(pageNumber, pageSize);
        List<Item> itemList = itemMapperCustom.selectWithQueryAndOrder(itemQueryParams);
        PageInfo<Item> pageInfo = new PageInfo<>(itemList);
        long total = pageInfo.getTotal();
        if (itemList != null) {
            return new PageResult<>(total, itemList);
        }
        return null;
    }

    @Override
    public AjaxResult<Integer> createItem(Item item, String desc, String itemParams) throws Exception {
        long itemId = IDUtil.genItemId();
        item.setId(itemId);
        item.setStatus((byte) 1);//1-正常 2-下架 3-删除
        item.setCreated(new Date());
        item.setUpdated(new Date());
        itemMapper.insert(item);
        //添加商品描述
        boolean isSuccessInsertItemDesc = insertItemDesc(itemId, desc);
        if (!isSuccessInsertItemDesc) {
            throw new Exception("添加商品描述失败");
        }
        //添加规格参数
        boolean isSuccessInsertItemParams = insertItemParams(itemId, itemParams);
        if (!isSuccessInsertItemParams) {
            throw new Exception("添加规格参数失败");
        }
        return new AjaxResult<>(true, "ID为[" + itemId + "]的商品添加成功");
    }

    @Override
    public boolean deleteItems(List<Item> itemList) throws Exception {
        //批量删除商品
        int deleteCount = itemMapperCustom.deleteByIds(itemList);
        if (deleteCount > 0 && deleteCount == itemList.size()) {
            //批量删除商品描述
            itemDescMapperCustom.deleteByIds(itemList);
            //批量删除商品规格参数
            itemParamMapperCustom.deleteByIds(itemList);
            return true;
        }
        return false;
    }

    @Override
    public boolean updateItemsUp(List<Item> itemList) throws Exception {
        int updateCount = itemMapperCustom.updateItemsUpOrDown(itemList, (byte) 1);
        return updateCount == itemList.size();
    }

    @Override
    public boolean updateItemsDown(List<Item> itemList) throws Exception {
        int updateCount = itemMapperCustom.updateItemsUpOrDown(itemList, (byte) 2);
        return updateCount == itemList.size();
    }

    @Override
    public boolean updateItem(Item item) {
        int count = itemMapper.updateByPrimaryKeySelective(item);
        return count == 1;
    }

    /**
     * 添加商品描述
     *
     * @param itemId 商品ID
     * @param desc   商品描述
     * @return 是否成功
     */
    private boolean insertItemDesc(Long itemId, String desc) {
        ItemDesc itemDesc = new ItemDesc();
        itemDesc.setItemId(itemId);
        itemDesc.setItemDesc(desc);
        itemDesc.setCreated(new Date());
        itemDesc.setUpdated(new Date());
        int insertCount = itemDescMapper.insert(itemDesc);
        return insertCount == 1;
    }

    /**
     * 添加规格参数
     *
     * @param itemId     商品ID
     * @param itemParams 规格参数
     * @return 是否成功
     */
    private boolean insertItemParams(Long itemId, String itemParams) {
        ItemParam itemParam = new ItemParam();
        itemParam.setItemId(itemId);
        itemParam.setParamData(itemParams);
        itemParam.setCreated(new Date());
        itemParam.setUpdated(new Date());
        int insertCount = itemParamMapper.insert(itemParam);
        return insertCount == 1;
    }
}
