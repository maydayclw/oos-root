package me.maydayclw.oos.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/12 </p>
 * <p>Time: 20:58 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public interface PictureService {
    /**
     * 上传图片
     * @param multipartFile 图片文件
     * @return 上传状态map
     */
    Map uploadPicture(MultipartFile multipartFile);
}
