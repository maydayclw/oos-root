package me.maydayclw.oos.mapper;

import me.maydayclw.oos.pojo.ItemDesc;
import me.maydayclw.oos.pojo.ItemDescExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ItemDescMapper {
    int countByExample(ItemDescExample example);

    int deleteByExample(ItemDescExample example);

    int deleteByPrimaryKey(Long itemId);

    int insert(ItemDesc record);

    int insertSelective(ItemDesc record);

    List<ItemDesc> selectByExampleWithBLOBs(ItemDescExample example);

    List<ItemDesc> selectByExample(ItemDescExample example);

    ItemDesc selectByPrimaryKey(Long itemId);

    int updateByExampleSelective(@Param("record") ItemDesc record, @Param("example") ItemDescExample example);

    int updateByExampleWithBLOBs(@Param("record") ItemDesc record, @Param("example") ItemDescExample example);

    int updateByExample(@Param("record") ItemDesc record, @Param("example") ItemDescExample example);

    int updateByPrimaryKeySelective(ItemDesc record);

    int updateByPrimaryKeyWithBLOBs(ItemDesc record);

    int updateByPrimaryKey(ItemDesc record);
}