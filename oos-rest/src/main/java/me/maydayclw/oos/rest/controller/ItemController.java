package me.maydayclw.oos.rest.controller;

import me.maydayclw.oos.dto.CatPageDto;
import me.maydayclw.oos.dto.JsonResult;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.Item;
import me.maydayclw.oos.rest.service.ItemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/6/7 </p>
 * <p>Time: 0:06 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Controller
@RequestMapping("/item")
public class ItemController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private ItemService itemService;

    @RequestMapping("/catPage/list")
    @ResponseBody
    public JsonResult getItemCatPage() {
        try {
            List<CatPageDto> catPageList = itemService.getCatPage();
            return JsonResult.ok(catPageList);
        } catch (Exception e) {
            logger.error(e.getMessage());
            return JsonResult.build(500,e.getMessage());
        }
    }

    @RequestMapping("/list/page")
    @ResponseBody
    public PageResult<Item> getItemPageListByCatId(Long catId, Integer pageSize, Integer pageNumber) {
        try {
            return itemService.getItemPageListByCatId(catId, pageSize, pageNumber);
        } catch (Exception e) {
            logger.error(e.getMessage());
            return null;
        }
    }
}
