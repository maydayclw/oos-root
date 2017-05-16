package me.maydayclw.oos.controller;

import me.maydayclw.oos.dto.AjaxResult;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.ItemParamTemplet;
import me.maydayclw.oos.pojo.ItemParamTempletDto;
import me.maydayclw.oos.pojo.ParamTempletDataDto;
import me.maydayclw.oos.service.ItemParamTempletService;
import me.maydayclw.oos.util.DateUtil;
import me.maydayclw.oos.util.JsonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/14 </p>
 * <p>Time: 13:27 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Controller
@RequestMapping("/paramTemplet")
public class ItemParamTempletController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private ItemParamTempletService itemParamTempletService;

    @RequestMapping(value = "/list")
    public String list() {
        return "/item/param-templet-list";
    }

    @RequestMapping(value = "/data")
    @ResponseBody
    public PageResult<ItemParamTempletDto> data(Integer pageNumber, Integer pageSize) {
        PageResult<ItemParamTemplet> itemParamTempletList = itemParamTempletService.getItemParamTempletList(pageNumber, pageSize);
        return changeType(itemParamTempletList);
    }

    @RequestMapping(value = "/query", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult<ItemParamTemplet> query(Long itemCatId) {
        ItemParamTemplet itemParamTemplet = itemParamTempletService.getItemParamTempletByCid(itemCatId);
        if (itemParamTemplet == null) {
            return new AjaxResult<>(false, "没有对应记录");
        }
        return new AjaxResult<>(true, itemParamTemplet);
    }

    @RequestMapping(value = "/save/{cid}")
    @ResponseBody
    public AjaxResult<Integer> save(@PathVariable Long cid, String paramData) {
        ItemParamTemplet itemParamTemplet = new ItemParamTemplet();
        itemParamTemplet.setItemCatId(cid);
        itemParamTemplet.setParamData(paramData);
        try {
            int count = itemParamTempletService.insertItemParamTemplet(itemParamTemplet);
            if (count != 1) {
                return new AjaxResult<>(false, "保存失败");
            }
            return new AjaxResult<>(true, "保存成功");
        } catch (Exception e) {
            logger.error(e.getMessage());
            return new AjaxResult<>(false, "保存异常");
        }
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public AjaxResult<Integer> delete(@RequestBody List<ItemParamTempletDto> itemParamTempletList){
        boolean isDelete = itemParamTempletService.deleteItemParamTemplet(itemParamTempletList);
        if(isDelete){
            return new AjaxResult<>(true, "删除成功");
        }else{
            return new AjaxResult<>(false, "删除失败");
        }
    }

    /**
     * 转换显示类型
     *
     * @param itemParamTempletList 规格参数列表
     * @return 页面显示列表
     */
    private PageResult<ItemParamTempletDto> changeType(PageResult<ItemParamTemplet> itemParamTempletList) {
        PageResult<ItemParamTempletDto> pageResult = new PageResult<>();
        List<ItemParamTempletDto> itemParamTempletDtoList = new ArrayList<>();
        List<ItemParamTemplet> rows = itemParamTempletList.getRows();
        for (ItemParamTemplet itemParamTemplet : rows) {
            String format = "yyyy-MM-dd HH:mm:ss";
            Date created = itemParamTemplet.getCreated();
            Date updated = itemParamTemplet.getUpdated();
            String paramData = itemParamTemplet.getParamData();
            ItemParamTempletDto itemParamTempletDto = new ItemParamTempletDto();
            itemParamTempletDto.setId(itemParamTemplet.getId());
            itemParamTempletDto.setItemCatId(itemParamTemplet.getItemCatId());
            itemParamTempletDto.setCreated(DateUtil.toString(created, format));
            itemParamTempletDto.setUpdated(DateUtil.toString(updated, format));
            List<ParamTempletDataDto> paramTempletDataDtoList = JsonUtil.jsonToList(paramData, ParamTempletDataDto.class);
            if (paramTempletDataDtoList != null) {
                StringBuilder paramDataGroupOnly = new StringBuilder();
                for (ParamTempletDataDto paramTempletDataDto : paramTempletDataDtoList) {
                    String group = paramTempletDataDto.getGroup();
                    paramDataGroupOnly.append(group).append(",");
                }
                //规格(只显示分组名称)
                itemParamTempletDto.setParamData(paramDataGroupOnly.toString());
            }
            itemParamTempletDtoList.add(itemParamTempletDto);
        }
        pageResult.setTotal(itemParamTempletList.getTotal());
        pageResult.setRows(itemParamTempletDtoList);
        return pageResult;
    }
}
