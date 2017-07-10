package me.maydayclw.oos.rest.service.impl;

import me.maydayclw.oos.dto.JsonResult;
import me.maydayclw.oos.rest.dao.JedisDao;
import me.maydayclw.oos.rest.service.RedisService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/6/6 </p>
 * <p>Time: 14:31 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Service
public class RedisServiceImpl implements RedisService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private JedisDao jedisDao;
    @Value("${INDEX_CONTENT_REDIS_KEY}")
    private String INDEX_CONTENT_REDIS_KEY;

    @Override
    public JsonResult syncContent(long contentCid) {
        try {
            jedisDao.hdel(INDEX_CONTENT_REDIS_KEY, contentCid + "");
        } catch (Exception e) {
            logger.warn(e.getMessage());
            return JsonResult.build(500, e.getMessage());
        }
        return JsonResult.ok();
    }

    @Override
    public JsonResult syncPageContent(long contentCid) {
        try {
            jedisDao.del(INDEX_CONTENT_REDIS_KEY+contentCid + "");
        } catch (Exception e) {
            logger.warn(e.getMessage());
            return JsonResult.build(500, e.getMessage());
        }
        return JsonResult.ok();
    }
}
