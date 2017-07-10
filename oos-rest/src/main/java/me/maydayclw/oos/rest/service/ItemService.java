package me.maydayclw.oos.rest.service;

import me.maydayclw.oos.dto.CatPageDto;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.Item;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/6/6 </p>
 * <p>Time: 23:27 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public interface ItemService {
    List<CatPageDto> getCatPage();
    PageResult<Item> getItemPageListByCatId(Long catId, Integer pageSize, Integer pageNumber);

}
