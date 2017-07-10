package me.maydayclw.oos.web.controller;

import me.maydayclw.oos.pojo.Content;
import me.maydayclw.oos.web.service.ContentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/31 </p>
 * <p>Time: 10:23 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Controller
public class IndexController {

    @Resource
    private ContentService contentService;

    @RequestMapping("/index")
    public String showIndex(Model model) {
        String adJson = contentService.getContentList();
        List<Content> hotAdList = contentService.getHotAdList();
        List<Content> globalPriceList = contentService.getGlobalPriceList();
        //轮播
        model.addAttribute("carouselAd", adJson);
        //热门推荐
        model.addAttribute("hotAd", hotAdList);
        //全球比价
        model.addAttribute("globalPrice", globalPriceList);
        return "index";
    }

}
