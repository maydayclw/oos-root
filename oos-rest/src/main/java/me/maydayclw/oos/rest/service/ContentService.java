package me.maydayclw.oos.rest.service;

import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.Content;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/31 </p>
 * <p>Time: 9:31 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public interface ContentService {
    /**
     * 根据类目ID查找内容
     * @param contentCid 类目ID
     * @return 内容列表
     */
    List<Content> getContentList(long contentCid);
    PageResult<Content> getContentList(long contentCid, Integer pageSize, Integer pageNumber);
}
