package me.maydayclw.oos.mapper;

import me.maydayclw.oos.pojo.ItemParamTemplet;
import me.maydayclw.oos.pojo.ItemParamTempletExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ItemParamTempletMapper {
    int countByExample(ItemParamTempletExample example);

    int deleteByExample(ItemParamTempletExample example);

    int deleteByPrimaryKey(Long id);

    int insert(ItemParamTemplet record);

    int insertSelective(ItemParamTemplet record);

    List<ItemParamTemplet> selectByExampleWithBLOBs(ItemParamTempletExample example);

    List<ItemParamTemplet> selectByExample(ItemParamTempletExample example);

    ItemParamTemplet selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") ItemParamTemplet record, @Param("example") ItemParamTempletExample example);

    int updateByExampleWithBLOBs(@Param("record") ItemParamTemplet record, @Param("example") ItemParamTempletExample example);

    int updateByExample(@Param("record") ItemParamTemplet record, @Param("example") ItemParamTempletExample example);

    int updateByPrimaryKeySelective(ItemParamTemplet record);

    int updateByPrimaryKeyWithBLOBs(ItemParamTemplet record);

    int updateByPrimaryKey(ItemParamTemplet record);
}