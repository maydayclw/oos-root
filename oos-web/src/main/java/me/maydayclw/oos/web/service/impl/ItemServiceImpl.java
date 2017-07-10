package me.maydayclw.oos.web.service.impl;

import me.maydayclw.oos.dto.CatPageDto;
import me.maydayclw.oos.dto.JsonResult;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.Item;
import me.maydayclw.oos.util.HttpClientUtil;
import me.maydayclw.oos.util.JsonUtil;
import me.maydayclw.oos.web.service.ItemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/6/7 </p>
 * <p>Time: 0:13 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Service
public class ItemServiceImpl implements ItemService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Value("${REST_BASE_URL}")
    private String REST_BASE_URL;
    @Value("${REST_CAT_LIST_URL}")
    private String REST_CAT_LIST_URL;
    @Value("${REST_ITEM_PAGE_LIST_URL}")
    private String REST_ITEM_PAGE_LIST_URL;
    @Override
    public List<CatPageDto> getCatPage() {
        //调用服务层的服务
        String result = HttpClientUtil.doGet(REST_BASE_URL + REST_CAT_LIST_URL);
        JsonResult jsonResult = JsonResult.formatToList(result, CatPageDto.class);
        //取内容列表
        return (List<CatPageDto>) jsonResult.getData();
    }

    @Override
    public PageResult<Item> getItemListByCatId(Long catId, Integer pageSize, Integer pageNumber) {
        //调用服务层的服务
        String result = HttpClientUtil.doGet(REST_BASE_URL + REST_ITEM_PAGE_LIST_URL+ "?catId="+catId+"&&pageSize=" + pageSize + "&&pageNumber=" + pageNumber);
        return JsonUtil.jsonToPageItem(result);
    }
}
