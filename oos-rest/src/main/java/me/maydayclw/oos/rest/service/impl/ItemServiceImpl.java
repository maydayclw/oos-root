package me.maydayclw.oos.rest.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import me.maydayclw.oos.dto.CatPageDto;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.mapper.ItemCatMapper;
import me.maydayclw.oos.mapper.ItemMapper;
import me.maydayclw.oos.pojo.*;
import me.maydayclw.oos.rest.dao.JedisDao;
import me.maydayclw.oos.rest.service.ItemService;
import me.maydayclw.oos.util.JsonUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/6/6 </p>
 * <p>Time: 23:30 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Service
public class ItemServiceImpl implements ItemService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private ItemCatMapper itemCatMapper;
    @Resource
    private ItemMapper itemMapper;
    @Resource
    private JedisDao jedisDao;

    @Value("${CAT_PAGE_REDIS_KEY}")
    private String CAT_PAGE_REDIS_KEY;

    @Override
    public List<CatPageDto> getCatPage() {
        //从缓存中取内容
        try {
            String result = jedisDao.get(CAT_PAGE_REDIS_KEY);
            if (!StringUtils.isBlank(result)) {
                //把字符串转换成list
                return JsonUtil.jsonToList(result, CatPageDto.class);
            }
        } catch (Exception e) {
            logger.warn(e.getMessage());
        }
        List<CatPageDto> resultList = new ArrayList<>();
        ItemCatExample itemCatExample = new ItemCatExample();
        List<ItemCat> itemCatList = itemCatMapper.selectByExample(itemCatExample);
        List<ItemCat> parentCatList = new ArrayList<>();
        for (ItemCat itemCat: itemCatList){
            if (itemCat.getParentId() == 0){
                parentCatList.add(itemCat);
            }
        }
        for(ItemCat itemCat : parentCatList){
            CatPageDto catPageDto = new CatPageDto();
            catPageDto.setPatentCat(itemCat.getName());
            List<ItemCat> hasLeafList = new ArrayList<>();
            List<ItemCat> isLeafList = new ArrayList<>();
            for(ItemCat cat: itemCatList){
                if(cat.getParentId() != 0){
                    if(cat.getIsParent() &&
                            cat.getParentId().equals(itemCat.getId())){
                        hasLeafList.add(cat);
                    }
                }
            }
            if(hasLeafList.size()>10){
                hasLeafList = hasLeafList.subList(0,10);
            }
            catPageDto.setHasLeaf(hasLeafList);
            for(ItemCat itemCatTwo: hasLeafList){
                for(ItemCat itemCat1 : itemCatList){
                    if(itemCat1.getParentId().equals(itemCatTwo.getId()) && !itemCat1.getIsParent()){
                        isLeafList.add(itemCat1);
                    }
                }
            }
            if(isLeafList.size()>8){
                isLeafList = isLeafList.subList(0,8);
            }
            catPageDto.setIsLeaf(isLeafList);
            resultList.add(catPageDto);
        }
        //向缓存中添加内容
        try {
            //把list转换成字符串
            String cacheString = JsonUtil.objectToJson(resultList);
            jedisDao.set(CAT_PAGE_REDIS_KEY, cacheString);
        } catch (Exception e) {
            logger.warn(e.getMessage());
        }
        return resultList;
    }

    @Override
    public PageResult<Item> getItemPageListByCatId(Long catId, Integer pageSize, Integer pageNumber) {
        //设置分页参数
        PageHelper.startPage(pageNumber, pageSize);
        //根据内容分类id查询内容列表
        ItemExample example = new ItemExample();
        ItemExample.Criteria criteria = example.createCriteria();
        criteria.andCidEqualTo(catId);
        //执行查询
        List<Item> itemList = itemMapper.selectByExample(example);
        PageInfo<Item> pageInfo = new PageInfo<>(itemList);
        long total = pageInfo.getPages();
        PageResult<Item> pageResult = new PageResult<>();
        pageResult.setTotal(total);
        pageResult.setRows(itemList);
        return pageResult;
    }
}
