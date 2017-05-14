package me.maydayclw.oos.controller;

import me.maydayclw.oos.dto.AjaxResult;
import me.maydayclw.oos.pojo.ItemCat;
import me.maydayclw.oos.service.ItemCatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/12 </p>
 * <p>Time: 17:05 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Controller
@RequestMapping("/itemCat")
public class ItemCatController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private ItemCatService itemCatService;

    @RequestMapping("/list")
    @ResponseBody
    public List<Map<String, Object>> categoryList(@RequestParam(value="id", defaultValue="0") Long parentId){
        ArrayList<Map<String, Object>> catList = new ArrayList<>();
        List<ItemCat> list;
        try {
            list = itemCatService.getItemCatList(parentId);
            for (ItemCat itemCat : list) {
                Map<String,Object> node = new HashMap<>();
                node.put("id", itemCat.getId());
                node.put("name", itemCat.getName());
                node.put("pId", itemCat.getParentId());
                node.put("isParent", itemCat.getIsParent());
                catList.add(node);
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return catList;
    }

    @RequestMapping(value = "/query",method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult<ItemCat> query(ItemCat itemCat){
        try {
            ItemCat catInDB = itemCatService.getItemCat(itemCat.getId());
            if(catInDB == null){
                return new AjaxResult<>(false, "不存在ID为:" + itemCat.getId() + "的类目");
            }
            return new AjaxResult<>(true, catInDB);
        } catch (Exception e) {
            logger.error(e.getMessage());
            return new AjaxResult<>(false, "查询异常");
        }
    }

}
