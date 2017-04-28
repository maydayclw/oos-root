package me.maydayclw.oos.mapper;

import me.maydayclw.oos.pojo.SysRole;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/4/23 </p>
 * <p>Time: 18:16 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Repository
public interface SysRolePermissionMapperCustom {
    /**
     * 根据ID批量删除
     * @param sysRoleList 角色列表
     * @return 删除行数
     */
    int deleteByIds(List<SysRole> sysRoleList);
}
