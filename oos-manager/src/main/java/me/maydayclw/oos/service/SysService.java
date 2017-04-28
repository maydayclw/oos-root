package me.maydayclw.oos.service;

import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.*;

import java.util.List;

public interface SysService {
	
	//根据用户的身份和密码 进行认证，如果认证通过，返回用户身份信息
	ActiveUser authenticat(String userCode, String password) throws Exception;
	
	//根据用户账号查询用户信息
	SysUser findSysUserByUserCode(String userCode)throws Exception;

	//根据资源ID查询资源信息
	SysPermission findSysPermissionById(Long id)throws Exception;

	//根据用户ID或者邮件ID查询用户列表
	List<SysUser> findSysUserByIdOrEmail(SysUser sysUser);
	//根据ID查找角色
	SysRole findSysRoleById(SysRole sysRole);
	//获取用户列表
	PageResult<SysUser> getSysUserList(Integer pageNumber, Integer pageSize);
	//获取角色列表[分页]
	PageResult<SysRole> getSysRoleList(Integer pageNumber, Integer pageSize);
	//获取资源列表[分页]
	PageResult<SysPermission> getSysPermissionList(Integer pageNumber, Integer pageSize);
	//获取角色列表
	List<SysRole> getSysRoleList();
	//获取资源列表
	List<SysPermission> getSysPermissionList();
	//根据用户id查询权限范围的菜单
	List<SysPermission> findMenuListByUserId(String userid) throws Exception;
	
	//根据用户id查询权限范围的url
	List<SysPermission> findPermissionListByUserId(String userid) throws Exception;
	//添加用户
	boolean addSysUser(SysUser sysUser);
	//添加角色
	boolean addSysRole(SysRole sysRole);
	//添加资源
	boolean addSysPermission(SysPermission sysPermission);

	/**
	 * 根据用户ID批量删除用户
	 * @param sysUserList 用户列表
	 * @return 是否删除成功
	 */
	boolean deleteSysUsers(List<SysUser> sysUserList);
	/**
	 * 根据角色ID批量删除角色
	 * @param sysRoleList 角色列表
	 * @return 是否删除成功
	 */
	boolean deleteSysRoles(List<SysRole> sysRoleList);
	/**
	 * 根据资源ID批量删除资源
	 * @param sysPermissionList 角色列表
	 * @return 是否删除成功
	 */
	boolean deleteSysPermissions(List<SysPermission> sysPermissionList);

	/**
	 * 更新用户
	 * @param sysUser 系统用户
	 * @return 是否更新成功
	 */
	boolean updateSysUser(SysUser sysUser);
	/**
	 * 更新角色
	 * @param sysRole 系统角色
	 * @return 是否更新成功
	 */
	boolean updateSysRole(SysRole sysRole);
	/**
	 * 更新资源
	 * @param sysPermission 系统资源
	 * @return 是否更新成功
	 */
	boolean updateSysPermission(SysPermission sysPermission);

	/**
	 * 根据用户ID批量删除用户-角色关系
	 * @param sysUserList 用户列表
	 * @return 是否删除成功
	 */
	boolean deleteSysUserRoles(List<SysUser> sysUserList);
	/**
	 * 根据用户ID批量删除角色-资源关系
	 * @param sysRoleList 角色列表
	 * @return 是否删除成功
	 */
	boolean deleteSysRolePermissions(List<SysRole> sysRoleList);

	//添加用户角色关联
	boolean addSysUserRole(SysUserRole sysUserRole);

	//分配角色
	boolean updateAllot(String userId,String[] roleArr);
	//授权
	boolean updateAuth(String roleId,String[] permissionArr);

}
