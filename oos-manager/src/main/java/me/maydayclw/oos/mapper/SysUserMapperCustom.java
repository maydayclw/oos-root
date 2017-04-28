package me.maydayclw.oos.mapper;

import me.maydayclw.oos.pojo.SysUser;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/4/22 </p>
 * <p>Time: 20:04 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Repository
public interface SysUserMapperCustom {

    /**
     * 根据ID批量删除
     * @param sysUserList 用户列表
     * @return 删除行数
     */
    int deleteByIds(List<SysUser> sysUserList);
}
