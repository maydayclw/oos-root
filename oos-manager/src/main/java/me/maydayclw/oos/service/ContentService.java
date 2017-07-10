package me.maydayclw.oos.service;

import me.maydayclw.oos.dto.AjaxResult;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.Content;
import me.maydayclw.oos.pojo.ContentCategory;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/26 </p>
 * <p>Time: 22:55 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public interface ContentService {

    //分页获取内容类目列表
    PageResult<ContentCategory> getContentCategoryList(Integer pageNumber, Integer pageSize);
    //获取内容类目列表
    List<ContentCategory> getContentCategoryListHasParent();

    PageResult<Content> getContentListByCatId(Integer pageNumber, Integer pageSize,Long catId);

    /**
     * 根据用户ID批量删除内容类目
     * @param contentCategoryList 内容类目列表
     * @return 是否删除成功
     */
    boolean deleteContentCategory(List<ContentCategory> contentCategoryList) throws Exception;
    /**
     * 根据用户ID批量删除内容
     * @param contentList 内容列表
     * @return 是否删除成功
     */
    boolean deleteContent(List<Content> contentList) throws Exception;

    /**
     * 添加内容类目
     * @return 添加json结果
     */
    AjaxResult<Integer> createContentCategory(ContentCategory contentCategory) throws Exception;
    /**
     * 添加内容
     * @return 添加json结果
     */
    AjaxResult<Integer> createContent(Content content) throws Exception;
    /**
     * 更新内容
     * @return 添加json结果
     */
    AjaxResult<Integer> updateContent(Content content) throws Exception;
    /**
     * 根据父ID获取内容类目列表
     * @param parentId 父ID
     * @return 内容类目列表
     * @throws Exception 异常
     */
    List<ContentCategory> getContentCatListByParentId(Long parentId) throws Exception;
}
