package me.maydayclw.oos.web.service;

import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.Content;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/31 </p>
 * <p>Time: 9:57 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public interface ContentService {
    /**
     * 请求oos-rest得到内容列表json字符串
     * @return json字符串
     */
    String getContentList();
    /**
     * 请求oos-rest得到内容列表json字符串
     * @return json字符串
     */
    List<Content> getHotAdList();
    /**
     * 请求oos-rest得到内容列表json字符串
     * @return json字符串
     */
    List<Content> getCatAdList();
    /**
     * 请求oos-rest得到内容列表json字符串
     * @return json字符串
     */
    List<Content> getGlobalPriceList();
    /**
     * 请求oos-rest得到内容列表json字符串
     * @return json字符串
     */
    PageResult<Content> getInformationList(Integer pageSize, Integer pageNumber);
}
