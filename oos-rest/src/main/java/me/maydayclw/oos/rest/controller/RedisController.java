package me.maydayclw.oos.rest.controller;

import me.maydayclw.oos.dto.JsonResult;
import me.maydayclw.oos.rest.service.RedisService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/6/6 </p>
 * <p>Time: 14:34 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Controller
@RequestMapping("/cache/sync")
public class RedisController {
    @Resource
    private RedisService redisService;

    @RequestMapping("/content/{contentCid}")
    @ResponseBody
    public JsonResult contentCacheSync(@PathVariable Long contentCid) {
        return redisService.syncContent(contentCid);
    }
    @RequestMapping("/page/content/{contentCid}")
    @ResponseBody
    public JsonResult pageContentCacheSync(@PathVariable Long contentCid) {
        return redisService.syncPageContent(contentCid);
    }

}
