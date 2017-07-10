package me.maydayclw.oos.rest.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.mapper.ContentMapper;
import me.maydayclw.oos.pojo.Content;
import me.maydayclw.oos.pojo.ContentExample;
import me.maydayclw.oos.rest.dao.JedisDao;
import me.maydayclw.oos.rest.service.ContentService;
import me.maydayclw.oos.util.JsonUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/31 </p>
 * <p>Time: 9:39 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Service
public class ContentServiceImpl implements ContentService{
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private ContentMapper contentMapper;

    @Resource
    private JedisDao jedisDao;

    @Value("${INDEX_CONTENT_REDIS_KEY}")
    private String INDEX_CONTENT_REDIS_KEY;
    @Override
    public List<Content> getContentList(long contentCid) {
        //从缓存中取内容
        try {
            String result = jedisDao.hget(INDEX_CONTENT_REDIS_KEY, contentCid +"");
            if (!StringUtils.isBlank(result)) {
                //把字符串转换成list
                return JsonUtil.jsonToList(result, Content.class);
            }
        } catch (Exception e) {
            logger.warn(e.getMessage());
        }
        //根据内容分类id查询内容列表
        ContentExample example = new ContentExample();
        ContentExample.Criteria criteria = example.createCriteria();
        criteria.andCategoryIdEqualTo(contentCid);
        //执行查询
        List<Content> contentList = contentMapper.selectByExample(example);
        //向缓存中添加内容
        try {
            //把list转换成字符串
            String cacheString = JsonUtil.objectToJson(contentList);
            jedisDao.hset(INDEX_CONTENT_REDIS_KEY, contentCid + "", cacheString);
        } catch (Exception e) {
            logger.warn(e.getMessage());
        }
        return contentList;

    }
    @Override
    public PageResult<Content> getContentList(long contentCid, Integer pageSize, Integer pageNumber) {
        //从缓存中取内容
        try {
            String result = jedisDao.hget(INDEX_CONTENT_REDIS_KEY+contentCid , pageNumber+"");
            if (!StringUtils.isBlank(result)) {
                //把字符串转换成list
                return JsonUtil.jsonToPageContent(result);
            }
        } catch (Exception e) {
            logger.warn(e.getMessage());
        }
        //设置分页参数
        PageHelper.startPage(pageNumber, pageSize);
        //根据内容分类id查询内容列表
        ContentExample example = new ContentExample();
        ContentExample.Criteria criteria = example.createCriteria();
        criteria.andCategoryIdEqualTo(contentCid);
        //执行查询
        List<Content> contentList = contentMapper.selectByExample(example);
        PageInfo<Content> pageInfo = new PageInfo<>(contentList);
        long total = pageInfo.getPages();
        PageResult<Content> pageResult = new PageResult<>();
        pageResult.setTotal(total);
        pageResult.setRows(contentList);
        //向缓存中添加内容
        try {
            //把list转换成字符串
            String cacheString = JsonUtil.objectToJson(pageResult);
            jedisDao.hset(INDEX_CONTENT_REDIS_KEY+contentCid,  pageNumber+ "", cacheString);
        } catch (Exception e) {
            logger.warn(e.getMessage());
        }
        return pageResult;

    }
}
