package me.maydayclw.oos.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import me.maydayclw.oos.dto.AjaxResult;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.mapper.ContentCategoryMapper;
import me.maydayclw.oos.mapper.ContentCategoryMapperCustom;
import me.maydayclw.oos.mapper.ContentMapper;
import me.maydayclw.oos.mapper.ContentMapperCustom;
import me.maydayclw.oos.pojo.Content;
import me.maydayclw.oos.pojo.ContentCategory;
import me.maydayclw.oos.pojo.ContentCategoryExample;
import me.maydayclw.oos.pojo.ContentExample;
import me.maydayclw.oos.service.ContentService;
import me.maydayclw.oos.util.HttpClientUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/26 </p>
 * <p>Time: 22:56 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Service
public class ContentServiceImpl implements ContentService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private ContentCategoryMapper contentCategoryMapper;

    @Resource
    private ContentMapper contentMapper;

    @Resource
    private ContentCategoryMapperCustom contentCategoryMapperCustom;

    @Resource
    private ContentMapperCustom contentMapperCustom;

    @Value("${REST_BASE_URL}")
    private String REST_BASE_URL;
    @Value("${REST_CONTENT_SYNC_URL}")
    private String REST_CONTENT_SYNC_URL;
    @Value("${REST_PAGE_CONTENT_SYNC_URL}")
    private String REST_PAGE_CONTENT_SYNC_URL;

    @Override
    public PageResult<ContentCategory> getContentCategoryList(Integer pageNumber, Integer pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        ContentCategoryExample contentCategoryExample = new ContentCategoryExample();
        List<ContentCategory> contentCategoryList = contentCategoryMapper.selectByExample(contentCategoryExample);
        PageInfo<ContentCategory> pageInfo = new PageInfo<>(contentCategoryList);
        long total = pageInfo.getTotal();
        if (contentCategoryList != null) {
            return new PageResult<>(total, contentCategoryList);
        }
        return null;
    }

    @Override
    public List<ContentCategory> getContentCategoryListHasParent() {
        ContentCategoryExample contentCategoryExample = new ContentCategoryExample();
        ContentCategoryExample.Criteria criteria = contentCategoryExample.createCriteria();
        criteria.andIsParentEqualTo(true);
        List<ContentCategory> contentCategoryList = contentCategoryMapper.selectByExample(contentCategoryExample);
        if (contentCategoryList != null) {
            return contentCategoryList;
        }
        return null;
    }

    @Override
    public PageResult<Content> getContentListByCatId(Integer pageNumber, Integer pageSize, Long catId) {
        PageHelper.startPage(pageNumber, pageSize);
        ContentExample contentExample = new ContentExample();
        ContentExample.Criteria criteria = contentExample.createCriteria();
        criteria.andCategoryIdEqualTo(catId);
        List<Content> contentList = contentMapper.selectByExampleWithBLOBs(contentExample);
        PageInfo<Content> pageInfo = new PageInfo<>(contentList);
        long total = pageInfo.getTotal();
        if (contentList != null) {
            return new PageResult<>(total, contentList);
        }
        return null;
    }

    @Override
    public boolean deleteContentCategory(List<ContentCategory> contentCategoryList) throws Exception {
        //批量删除
        int deleteCount = contentCategoryMapperCustom.deleteContentCategorys(contentCategoryList);
        return deleteCount > 0;
    }

    @Override
    public boolean deleteContent(List<Content> contentList) throws Exception {
        //批量删除
        int deleteCount = contentMapperCustom.deleteContents(contentList);
        //同步缓存,批量删除的是同一类
        cacheClear(contentList.get(0).getCategoryId());
        return deleteCount > 0;
    }

    @Override
    public AjaxResult<Integer> createContentCategory(ContentCategory contentCategory) throws Exception {
        contentCategory.setCreated(new Date());
        contentCategory.setUpdated(new Date());
        int insert = contentCategoryMapper.insert(contentCategory);
        if (insert == 1) {
            return new AjaxResult<Integer>(true, "添加成功");
        } else {
            return new AjaxResult<Integer>(false, "添加失败");
        }
    }

    @Override
    public AjaxResult<Integer> createContent(Content content) throws Exception {
        content.setCreated(new Date());
        content.setUpdated(new Date());
        int insert = contentMapper.insert(content);
        if (insert == 1) {
            //同步缓存
            cacheClear(content.getCategoryId());
            return new AjaxResult<>(true, "添加成功");
        } else {
            return new AjaxResult<>(false, "添加失败");
        }
    }

    @Override
    public AjaxResult<Integer> updateContent(Content content) throws Exception {
        content.setUpdated(new Date());
        int update = contentMapper.updateByPrimaryKeySelective(content);
        if (update == 1) {
            //同步缓存
            cacheClear(content.getCategoryId());
            return new AjaxResult<>(true, "更新成功");
        } else {
            return new AjaxResult<>(false, "更新失败");
        }
    }

    private void cacheClear(long contentCatId) {
        try {
            if(contentCatId == 101){
                HttpClientUtil.doGet(REST_BASE_URL + REST_PAGE_CONTENT_SYNC_URL + contentCatId);
            }else{
                HttpClientUtil.doGet(REST_BASE_URL + REST_CONTENT_SYNC_URL + contentCatId);
            }
        } catch (Exception e) {
            logger.warn(e.getMessage());
        }
    }

    @Override
    public List<ContentCategory> getContentCatListByParentId(Long parentId) throws Exception {
        ContentCategoryExample contentCategoryExample = new ContentCategoryExample();
        ContentCategoryExample.Criteria criteria = contentCategoryExample.createCriteria();
        criteria.andParentIdEqualTo(parentId);
        return contentCategoryMapper.selectByExample(contentCategoryExample);
    }
}
