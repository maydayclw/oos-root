package me.maydayclw.oos.service.impl;

import me.maydayclw.oos.service.PictureService;
import me.maydayclw.oos.util.FtpUtil;
import me.maydayclw.oos.util.IDUtil;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/12 </p>
 * <p>Time: 21:01 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Service
public class PictureServiceImpl implements PictureService {

    @Value("${FTP.ADDRESS}")
    private String FTP_ADDRESS;

    @Value("${FTP.PORT}")
    private int FTP_PORT;

    @Value("${FTP.USERNAME}")
    private String FTP_USERNAME;

    @Value("${FTP.PASSWORD}")
    private String FTP_PASSWORD;

    @Value("${FTP.BASE.PATH}")
    private String FTP_BASE_PATH;

    @Value("${IMG.BASE.URL}")
    private String IMG_BASE_URL;

    @Override
    public Map uploadPicture(MultipartFile multipartFile) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            //原文件名
            String originalFilename = multipartFile.getOriginalFilename();
            //生成新文件名
            String imageName = IDUtil.genImageName();
            imageName = imageName + originalFilename.substring(originalFilename.lastIndexOf("."));
            //图片上传
            String imagesPath = new DateTime().toString("/yyyy/MM/dd");
            boolean result = FtpUtil.uploadFile(FTP_ADDRESS, FTP_PORT, FTP_USERNAME, FTP_PASSWORD, FTP_BASE_PATH,
                    imagesPath, imageName, multipartFile.getInputStream()
            );
            if (!result) {
                resultMap.put("error", 1);
                resultMap.put("message", "图片上传失败");
                return resultMap;
            }
            resultMap.put("error", 0);
            resultMap.put("url", IMG_BASE_URL + imagesPath + "/" + imageName);
            return resultMap;
        } catch (IOException e) {
            resultMap.put("error", 1);
            resultMap.put("message", "图片上传发生异常");
            return resultMap;
        }
    }
}
