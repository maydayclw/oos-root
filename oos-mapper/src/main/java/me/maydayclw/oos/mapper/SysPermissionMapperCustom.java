package me.maydayclw.oos.mapper;


import me.maydayclw.oos.pojo.SysPermission;

import java.util.List;

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
