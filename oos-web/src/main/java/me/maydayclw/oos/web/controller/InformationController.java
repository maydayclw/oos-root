package me.maydayclw.oos.web.controller;

import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.Content;
import me.maydayclw.oos.web.service.ContentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class InformationController {

    @Resource
    private ContentService contentService;

    @RequestMapping("/information")
    public String showInformation(Model model,
                                  @RequestParam(value="pageSize", defaultValue="8")Integer pageSize,
                                  @RequestParam(value="pageNumber", defaultValue="1") Integer pageNumber) {
        PageResult<Content> pageResult = contentService.getInformationList(pageSize, pageNumber);
        model.addAttribute("informationList",pageResult.getRows());
        model.addAttribute("currentPage",pageNumber);
        model.addAttribute("totalPages",pageResult.getTotal());
        return "information";
    }

}
