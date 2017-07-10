package me.maydayclw.oos.rest.service;

import me.maydayclw.oos.dto.JsonResult;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/6/6 </p>
 * <p>Time: 14:30 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public interface RedisService {
    /**
     * 同步缓存
     * @param contentCid 内容类目ID
     * @return JsonResult
     */
    JsonResult syncContent(long contentCid);
    JsonResult syncPageContent(long contentCid);
}
