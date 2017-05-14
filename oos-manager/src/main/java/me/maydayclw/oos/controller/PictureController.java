package me.maydayclw.oos.controller;

import me.maydayclw.oos.service.PictureService;
import me.maydayclw.oos.util.JsonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.Map;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/12 </p>
 * <p>Time: 21:29 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Controller
@RequestMapping("/pic")
public class PictureController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private PictureService pictureService;

    @RequestMapping(value = "/upload")
    @ResponseBody
    public String pictureUpload(MultipartFile uploadFile){
        Map result =  pictureService.uploadPicture(uploadFile);
        //解决兼容性
        return JsonUtil.objectToJson(result);
    }
}
