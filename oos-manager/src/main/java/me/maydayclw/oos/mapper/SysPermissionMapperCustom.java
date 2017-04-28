package me.maydayclw.oos.mapper;


import me.maydayclw.oos.pojo.SysPermission;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysPermissionMapperCustom {

	//根据用户id查询权限
	public List<SysPermission> findPermissionListByUserId(String userid)throws Exception;
	/**
	 * 根据ID批量删除
	 * @param sysPermissionList 资源列表
	 * @return 删除行数
	 */
	int deleteByIds(List<SysPermission> sysPermissionList);
}
