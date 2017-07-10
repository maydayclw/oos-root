package me.maydayclw.oos.web.controller;

import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.Item;
import me.maydayclw.oos.web.service.ItemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/31 </p>
 * <p>Time: 10:23 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Controller
public class ItemController {

    @Resource
    private ItemService itemService;

    @RequestMapping("/item/{catId}")
    public String showItemList(Model model,@PathVariable Long catId,
                               @RequestParam(value="pageSize", defaultValue="20")Integer pageSize,
                               @RequestParam(value="pageNumber", defaultValue="1") Integer pageNumber) {
        PageResult<Item> pageResult = itemService.getItemListByCatId(catId, pageSize, pageNumber);
        model.addAttribute("itemList",pageResult.getRows());
        model.addAttribute("currentPage",pageNumber);
        model.addAttribute("totalPages",pageResult.getTotal());
        model.addAttribute("catId",catId);
        return "itemList";
    }

}
