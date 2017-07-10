package me.maydayclw.oos.controller;

import me.maydayclw.oos.dto.AjaxResult;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.Item;
import me.maydayclw.oos.pojo.ItemQueryParams;
import me.maydayclw.oos.service.ItemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/12 </p>
 * <p>Time: 10:53 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Controller
@RequestMapping("/item")
public class ItemController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private ItemService itemService;

    @RequestMapping(value = "/list")
    private String list(){
        return "/item/list";
    }

    @RequestMapping(value = "/data")
    @ResponseBody
    public PageResult<Item> data(Integer pageNumber, Integer pageSize, ItemQueryParams itemQueryParams){
        return itemService.getItemList(pageNumber,pageSize,itemQueryParams);
    }

    @RequestMapping(value = "/add")
    public String itemForm() {
        return "item/item-add";
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult<Integer> itemSave(Item item, String desc, String itemParams) {
        try {
            return itemService.createItem(item, desc, itemParams);
        } catch (Exception e) {
            logger.error("添加失败", e);
            return new AjaxResult<>(false, "添加失败");
        }
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public AjaxResult<Integer> delete(@RequestBody List<Item> itemList){
        boolean status;
        try {
            status = itemService.deleteItems(itemList);
        } catch (Exception e) {
            return new AjaxResult<>(false, "删除异常");
        }
        if(status){
            return new AjaxResult<>(true, "删除成功");
        }else{
            return new AjaxResult<>(false, "删除失败");
        }
    }
    @RequestMapping(value = "/upOrDown",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public AjaxResult<Integer> upOrDown(@RequestBody List<Item> itemList){
        boolean status = false;
        try {
            if(itemList.get(0).getStatus() != (byte)1){//需要上架
                status = itemService.updateItemsUp(itemList);
            }else if(itemList.get(0).getStatus() != (byte)2){//需要下架
                status  = itemService.updateItemsDown(itemList);
            }
        } catch (Exception e) {
            return new AjaxResult<>(false, "更新异常");
        }
        if(status){
            return new AjaxResult<>(true, "更新成功");
        }else{
            return new AjaxResult<>(false, "更新失败");
        }
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult<Integer> update(Item item){
        boolean status = itemService.updateItem(item);
        if(status){
            return new AjaxResult<>(true, "更新成功");
        }else{
            return new AjaxResult<>(false, "更新失败");
        }
    }
}
