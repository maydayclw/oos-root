package me.maydayclw.oos.controller;

import me.maydayclw.oos.dto.AjaxResult;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.Content;
import me.maydayclw.oos.pojo.ContentCategory;
import me.maydayclw.oos.service.ContentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/26 </p>
 * <p>Time: 22:29 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Controller
@RequestMapping("/content")
public class ContentController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private ContentService contentService;

    @RequestMapping("/list")
    public String list(){
        return "/content/list";
    }
    @RequestMapping("/cat/list")
    public String catList(){
        return "/content/cat-list";
    }

    @RequestMapping(value = "/cat/data")
    @ResponseBody
    public PageResult<ContentCategory> data(Integer pageNumber, Integer pageSize){
        return contentService.getContentCategoryList(pageNumber,pageSize);
    }
    @RequestMapping(value = "/data")
    @ResponseBody
    public PageResult<Content> data(Integer pageNumber, Integer pageSize, @RequestParam(value="catId", defaultValue="0")Long catId){
        return contentService.getContentListByCatId(pageNumber,pageSize,catId);
    }

    @RequestMapping(value = "/cat/delete",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public AjaxResult<Integer> delete(@RequestBody List<ContentCategory> contentCategoryList){
        boolean status;
        try {
            status = contentService.deleteContentCategory(contentCategoryList);
        } catch (Exception e) {
            return new AjaxResult<>(false, "删除异常");
        }
        if(status){
            return new AjaxResult<>(true, "删除成功");
        }else{
            return new AjaxResult<>(false, "删除失败");
        }
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public AjaxResult<Integer> deleteContent(@RequestBody List<Content> contentList){
        boolean status;
        try {
            status = contentService.deleteContent(contentList);
        } catch (Exception e) {
            return new AjaxResult<>(false, "删除异常");
        }
        if(status){
            return new AjaxResult<>(true, "删除成功");
        }else{
            return new AjaxResult<>(false, "删除失败");
        }
    }


    @RequestMapping(value = "/cat/parent")
    @ResponseBody
    public AjaxResult<List<ContentCategory>> hasParent(){
        List<ContentCategory> contentCategoryListHasParent = contentService.getContentCategoryListHasParent();
        return new AjaxResult<>(true, contentCategoryListHasParent);
    }

    @RequestMapping(value = "/cat/add")
    @ResponseBody
    public AjaxResult<Integer> add(ContentCategory contentCategory){
        AjaxResult<Integer> result;
        try {
            result = contentService.createContentCategory(contentCategory);
        } catch (Exception e) {
            logger.error(e.getMessage());
            return new AjaxResult<Integer>(false,"添加异常");
        }
        return result;
    }
    @RequestMapping(value = "/save")
    @ResponseBody
    public AjaxResult<Integer> add(Content content){
        AjaxResult<Integer> result;
        try {
            result = contentService.createContent(content);
        } catch (Exception e) {
            logger.error(e.getMessage());
            return new AjaxResult<>(false, "添加异常");
        }
        return result;
    }
    @RequestMapping(value = "/update")
    @ResponseBody
    public AjaxResult<Integer> update(Content content){
        AjaxResult<Integer> result;
        try {
            if(content.getPic().equals("")){
                content.setPic(null);
            }
            result = contentService.updateContent(content);
        } catch (Exception e) {
            logger.error(e.getMessage());
            return new AjaxResult<>(false, "更新异常");
        }
        return result;
    }

    @RequestMapping("/cat/list/tree")
    @ResponseBody
    public List<Map<String, Object>> categoryList(@RequestParam(value="id", defaultValue="0") Long parentId){
        ArrayList<Map<String, Object>> catList = new ArrayList<>();
        List<ContentCategory> list;
        try {
            list = contentService.getContentCatListByParentId(parentId);
            for (ContentCategory contentCategory : list) {
                Map<String,Object> node = new HashMap<>();
                node.put("id", contentCategory.getId());
                node.put("name", contentCategory.getName());
                node.put("pId", contentCategory.getParentId());
                node.put("isParent", contentCategory.getIsParent());
                catList.add(node);
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return catList;
    }

}
