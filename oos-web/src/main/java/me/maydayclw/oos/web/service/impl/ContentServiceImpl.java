package me.maydayclw.oos.web.service.impl;

import me.maydayclw.oos.dto.JsonResult;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.Content;
import me.maydayclw.oos.util.HttpClientUtil;
import me.maydayclw.oos.util.JsonUtil;
import me.maydayclw.oos.web.service.ContentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/31 </p>
 * <p>Time: 9:58 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Service
public class ContentServiceImpl implements ContentService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Value("${REST_BASE_URL}")
    private String REST_BASE_URL;
    @Value("${REST_INDEX_AD_URL}")
    private String REST_INDEX_AD_URL;
    @Value("${REST_INDEX_GLOBAL_URL}")
    private String REST_INDEX_GLOBAL_URL;
    @Value("${REST_INDEX_HOT_URL}")
    private String REST_INDEX_HOT_URL;
    @Value("${REST_INF_URL}")
    private String REST_INF_URL;
    @Value("${REST_CAT_AD_URL}")
    private String REST_CAT_AD_URL;

    @Override
    public String getContentList() {
        //调用服务层的服务
        String result = HttpClientUtil.doGet(REST_BASE_URL + REST_INDEX_AD_URL);
        return formatContent(result);

    }

    @Override
    public List<Content> getHotAdList() {
        //调用服务层的服务
        String result = HttpClientUtil.doGet(REST_BASE_URL + REST_INDEX_HOT_URL);
        JsonResult jsonResult = JsonResult.formatToList(result, Content.class);
        //取内容列表
        return (List<Content>) jsonResult.getData();
    }

    @Override
    public List<Content> getCatAdList() {
        //调用服务层的服务
        String result = HttpClientUtil.doGet(REST_BASE_URL + REST_CAT_AD_URL);
        JsonResult jsonResult = JsonResult.formatToList(result, Content.class);
        //取内容列表
        return (List<Content>) jsonResult.getData();
    }

    @Override
    public List<Content> getGlobalPriceList() {
        //调用服务层的服务
        String result = HttpClientUtil.doGet(REST_BASE_URL + REST_INDEX_GLOBAL_URL);
        JsonResult jsonResult = JsonResult.formatToList(result, Content.class);
        //取内容列表
        return (List<Content>) jsonResult.getData();
    }

    @Override
    public PageResult<Content> getInformationList(Integer pageSize, Integer pageNumber) {
        //调用服务层的服务
        String result = HttpClientUtil.doGet(REST_BASE_URL + REST_INF_URL + "?pageSize=" + pageSize + "&&pageNumber=" + pageNumber);
        return JsonUtil.jsonToPageContent(result);
    }

    private String formatContent(String result) {
        try {
            JsonResult jsonResult = JsonResult.formatToList(result, Content.class);
            //取内容列表
            List<Content> list = (List<Content>) jsonResult.getData();
            List<Map<String, Serializable>> resultList = new ArrayList<>();
            //创建一个jsp页码要求的pojo列表
            for (Content content : list) {
                Map<String, Serializable> map = new HashMap<>();
                map.put("src", content.getPic());
                map.put("href", content.getUrl());
                map.put("alt", content.getSubTitle());
                map.put("backgroundColor", content.getTitleDesc());
                resultList.add(map);
            }
            return JsonUtil.objectToJson(resultList);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return null;
    }
}
