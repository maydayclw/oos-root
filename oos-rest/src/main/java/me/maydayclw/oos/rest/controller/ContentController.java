package me.maydayclw.oos.rest.controller;

import me.maydayclw.oos.dto.JsonResult;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.Content;
import me.maydayclw.oos.rest.service.ContentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/31 </p>
 * <p>Time: 9:46 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Controller
@RequestMapping("/content")
public class ContentController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private ContentService contentService;

    @RequestMapping("/list/{contentCategoryId}")
    @ResponseBody
    public JsonResult getContentList(@PathVariable Long contentCategoryId) {
        try {
            List<Content> list = contentService.getContentList(contentCategoryId);
            return JsonResult.ok(list);
        } catch (Exception e) {
            logger.error(e.getMessage());
            return JsonResult.build(500,e.getMessage());
        }
    }
    @RequestMapping("/list/page/{contentCategoryId}")
    @ResponseBody
    public PageResult<Content> getContentList(@PathVariable Long contentCategoryId,Integer pageSize, Integer pageNumber) {
        try {
            return contentService.getContentList(contentCategoryId, pageSize, pageNumber);
        } catch (Exception e) {
            logger.error(e.getMessage());
            return null;
        }
    }

}
