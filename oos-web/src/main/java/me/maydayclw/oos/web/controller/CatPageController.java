package me.maydayclw.oos.web.controller;

import me.maydayclw.oos.dto.CatPageDto;
import me.maydayclw.oos.pojo.Content;
import me.maydayclw.oos.web.service.ContentService;
import me.maydayclw.oos.web.service.ItemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/6/7 </p>
 * <p>Time: 0:11 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Controller
public class CatPageController {

    @Resource
    private ItemService itemService;
    @Resource
    private ContentService contentService;
    @RequestMapping("/cat")
    public String showIndex(Model model) {
        List<CatPageDto> catPageList = itemService.getCatPage();
        List<Content> catAdList = contentService.getCatAdList();
        //类目列表
        model.addAttribute("catList", catPageList);
        model.addAttribute("catAdList", catAdList);
        return "cat";
    }
}
