package me.maydayclw.oos.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.mapper.*;
import me.maydayclw.oos.pojo.*;
import me.maydayclw.oos.service.SysService;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class SysServiceImpl implements SysService {

    @Resource
    private SysUserMapper sysUserMapper;
    @Resource
    private SysRoleMapper sysRoleMapper;
    @Resource
    private SysPermissionMapper sysPermissionMapper;
    @Resource
    private SysUserRoleMapper sysUserRoleMapper;
    @Resource
    private SysRolePermissionMapper sysRolePermissionMapper;
    @Resource
    private SysPermissionMapperCustom sysPermissionMapperCustom;
    @Resource
    private SysUserMapperCustom sysUserMapperCustom;
    @Resource
    private SysRoleMapperCustom sysRoleMapperCustom;
    @Resource
    private SysUserRoleMapperCustom sysUserRoleMapperCustom;
    @Resource
    private SysRolePermissionMapperCustom sysRolePermissionMapperCustom;


    @Override
    public ActiveUser authenticat(String userCode, String password)
            throws Exception {
        /**
         认证过程：
         根据用户身份（账号）查询数据库，如果查询不到用户不存在
         对输入的密码 和数据库密码 进行比对，如果一致，认证通过
         */
        //根据用户账号查询数据库
        SysUser sysUser = this.findSysUserByUserCode(userCode);

        if (sysUser == null) {
            //抛出异常
            throw new RuntimeException("用户账号不存在");
        }

        //数据库密码 (md5密码 )
        String password_db = sysUser.getPassword();

        //对输入的密码 和数据库密码 进行比对，如果一致，认证通过
        //对页面输入的密码 进行md5加密
        String password_input_md5 =/* new MD5().getMD5ofStr(password)*/"";
        if (!password_input_md5.equalsIgnoreCase(password_db)) {
            //抛出异常
            throw new RuntimeException("用户名或密码 错误");
        }
        //得到用户id
        String userid = sysUser.getId();
        //根据用户id查询菜单
        List<SysPermission> menus = this.findMenuListByUserId(userid);

        //根据用户id查询权限url
        List<SysPermission> permissions = this.findPermissionListByUserId(userid);

        //认证通过，返回用户身份信息
        ActiveUser activeUser = new ActiveUser();
        activeUser.setUserid(sysUser.getId());
        activeUser.setUsercode(userCode);
        activeUser.setUsername(sysUser.getUsername());//用户名称

        //放入权限范围的菜单和url
        activeUser.setMenus(menus);
        activeUser.setPermissions(permissions);

        return activeUser;
    }

    //根据用户账号查询用户信息
    public SysUser findSysUserByUserCode(String userCode) throws Exception {
        SysUserExample sysUserExample = new SysUserExample();
        SysUserExample.Criteria criteria = sysUserExample.createCriteria();
        criteria.andUsercodeEqualTo(userCode);

        List<SysUser> list = sysUserMapper.selectByExample(sysUserExample);

        if (list != null && list.size() == 1) {
            return list.get(0);
        }

        return null;
    }

    @Override
    public SysPermission findSysPermissionById(Long id) throws Exception {
        SysPermissionExample sysPermissionExample = new SysPermissionExample();
        SysPermissionExample.Criteria criteria = sysPermissionExample.createCriteria();
        criteria.andIdEqualTo(id);

        List<SysPermission> list = sysPermissionMapper.selectByExample(sysPermissionExample);

        if (list != null && list.size() == 1) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public List<SysUser> findSysUserByIdOrEmail(SysUser sysUser) {
        SysUserExample sysUserExample = new SysUserExample();
        sysUserExample.or().andIdEqualTo(sysUser.getId());
        sysUserExample.or().andUsercodeEqualTo(sysUser.getUsercode());
        return sysUserMapper.selectByExample(sysUserExample);
    }

    @Override
    public SysRole findSysRoleById(SysRole sysRole) {
        return sysRoleMapper.selectByPrimaryKey(sysRole.getId());
    }

    @Override
    public PageResult<SysUser> getSysUserList(Integer pageNumber, Integer pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        SysUserExample sysUserExample = new SysUserExample();
        List<SysUser> sysUsers = sysUserMapper.selectByExample(sysUserExample);
        PageInfo<SysUser> pageInfo = new PageInfo<>(sysUsers);
        long total = pageInfo.getTotal();
        if (sysUsers != null) {
            return new PageResult<>(total, sysUsers);
        }
        return null;
    }

    @Override
    public PageResult<SysRole> getSysRoleList(Integer pageNumber, Integer pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        SysRoleExample sysRoleExample = new SysRoleExample();
        List<SysRole> sysRoles = sysRoleMapper.selectByExample(sysRoleExample);
        PageInfo<SysRole> pageInfo = new PageInfo<>(sysRoles);
        long total = pageInfo.getTotal();
        if (sysRoles != null) {
            return new PageResult<>(total, sysRoles);
        }
        return null;
    }

    @Override
    public PageResult<SysPermission> getSysPermissionList(Integer pageNumber, Integer pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        SysPermissionExample sysPermissionExample = new SysPermissionExample();
        List<SysPermission> sysPermissions = sysPermissionMapper.selectByExample(sysPermissionExample);
        PageInfo<SysPermission> pageInfo = new PageInfo<>(sysPermissions);
        long total = pageInfo.getTotal();
        if (sysPermissions != null) {
            return new PageResult<>(total, sysPermissions);
        }
        return null;
    }

    @Override
    public List<SysRole> getSysRoleList() {
        SysRoleExample sysRoleExample = new SysRoleExample();
        return sysRoleMapper.selectByExample(sysRoleExample);
    }

    @Override
    public List<SysPermission> getSysPermissionList() {
        SysPermissionExample sysPermissionExample = new SysPermissionExample();
        return sysPermissionMapper.selectByExample(sysPermissionExample);
    }

    @Override
    public List<SysPermission> findMenuListByUserId(String userid)
            throws Exception {

        return null;
    }

    @Override
    public List<SysPermission> findPermissionListByUserId(String userid)
            throws Exception {
        return sysPermissionMapperCustom.findPermissionListByUserId(userid);
    }

    @Override
    public boolean addSysUser(SysUser sysUser) {
        //更新用户表，更新用户角色表
        sysUser.setLocked("0");
        sysUser.setSalt("maydayclw");//TODO 修改为随机字符串
        SimpleHash simpleHash = new SimpleHash("md5", sysUser.getPassword(), "maydayclw", 1);
        sysUser.setPassword(simpleHash.toString());
        int count = sysUserMapper.insertSelective(sysUser);
        if (count == 1) {
            SysUserRole sysUserRole = new SysUserRole();
            //注册账户为普通会员角色
            UUID uuid = UUID.randomUUID();
            sysUserRole.setId(uuid.toString());
            sysUserRole.setSysUserId(sysUser.getId());
            sysUserRole.setSysRoleId("REGULAR_MEMBERS");
            int insert = sysUserRoleMapper.insert(sysUserRole);
            if (insert == 1) {
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean addSysRole(SysRole sysRole) {
        int count = sysRoleMapper.insertSelective(sysRole);
        return count == 1;
    }

    @Override
    public boolean addSysPermission(SysPermission sysPermission) {
        int count = sysPermissionMapper.insertSelective(sysPermission);
        return count == 1;
    }

    @Override
    public boolean deleteSysUsers(List<SysUser> sysUserList) {
        int count = sysUserMapperCustom.deleteByIds(sysUserList);
        return count == sysUserList.size();
    }

    @Override
    public boolean deleteSysRoles(List<SysRole> sysRoleList) {
        int count = sysRoleMapperCustom.deleteByIds(sysRoleList);
        return count == sysRoleList.size();
    }

    @Override
    public boolean deleteSysPermissions(List<SysPermission> sysPermissionList) {
        int count = sysPermissionMapperCustom.deleteByIds(sysPermissionList);
        return count == sysPermissionList.size();
    }


    @Override
    public boolean updateSysUser(SysUser sysUser) {
        int count = sysUserMapper.updateByPrimaryKeySelective(sysUser);
        return count == 1;
    }

    @Override
    public boolean updateSysRole(SysRole sysRole) {
        int count = sysRoleMapper.updateByPrimaryKeySelective(sysRole);
        return count == 1;
    }

    @Override
    public boolean updateSysPermission(SysPermission sysPermission) {
        int count = sysPermissionMapper.updateByPrimaryKeySelective(sysPermission);
        return count == 1;
    }

    @Override
    public boolean deleteSysUserRoles(List<SysUser> sysUserList) {
        int count = sysUserRoleMapperCustom.deleteByIds(sysUserList);
        return count == sysUserList.size();
    }

    @Override
    public boolean deleteSysRolePermissions(List<SysRole> sysRoleList) {
        int count = sysRolePermissionMapperCustom.deleteByIds(sysRoleList);
        return count == sysRoleList.size();
    }

    @Override
    public boolean addSysUserRole(SysUserRole sysUserRole) {

        return false;
    }

    @Override
    public boolean updateAllot(String userId, String[] roleArr) {
        List<SysUser> sysUsers = new ArrayList<>();
        SysUser sysUser = new SysUser();
        sysUser.setId(userId);
        sysUsers.add(sysUser);
        this.deleteSysUserRoles(sysUsers);
        int insert = 0;
        for (String aRoleArr : roleArr) {
            SysUserRole sysUserRole = new SysUserRole();
            UUID uuid = UUID.randomUUID();
            sysUserRole.setId(uuid.toString());
            sysUserRole.setSysUserId(userId);
            sysUserRole.setSysRoleId(aRoleArr);
            insert += sysUserRoleMapper.insert(sysUserRole);
        }
        return insert == roleArr.length;
    }
    @Override
    public boolean updateAuth(String roleId, String[] permissionArr) {
        List<SysRole> sysRoles = new ArrayList<>();
        SysRole sysRole = new SysRole();
        sysRole.setId(roleId);
        sysRoles.add(sysRole);
        this.deleteSysRolePermissions(sysRoles);
        int insert = 0;
        for (String aPermissionArr : permissionArr) {
            SysRolePermission sysRolePermission = new SysRolePermission();
            UUID uuid = UUID.randomUUID();
            sysRolePermission.setId(uuid.toString());
            sysRolePermission.setSysRoleId(roleId);
            sysRolePermission.setSysPermissionId(aPermissionArr);
            insert += sysRolePermissionMapper.insert(sysRolePermission);
        }
        return insert == permissionArr.length;
    }

}
