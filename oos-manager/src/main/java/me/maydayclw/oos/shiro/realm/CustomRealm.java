package me.maydayclw.oos.shiro.realm;

import me.maydayclw.oos.pojo.ActiveUser;
import me.maydayclw.oos.pojo.SysPermission;
import me.maydayclw.oos.pojo.SysUser;
import me.maydayclw.oos.service.SysService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/4/21 </p>
 * <p>Time: 16:08 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Service
public class CustomRealm extends AuthorizingRealm {

    //注入service
    @Resource
    private SysService sysService;

    // 设置realm的名称
    @Override
    public void setName(String name) {
        super.setName(this.getClass().getName());
    }

    //realm的认证方法，从数据库查询用户信息
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken token) throws AuthenticationException {

        // 从token中取出用户名
        String userCode = (String) token.getPrincipal();
        // 第二步：根据用户输入的userCode从数据库查询
        SysUser sysUser = null;
        try {
            sysUser = sysService.findSysUserByUserCode(userCode);
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        // 如果查询不到返回null
        if(sysUser==null){
            return null;
        }
        // 从数据库查询到密码
        String password =sysUser.getPassword();
        //盐
        String salt = sysUser.getSalt();

        // 如果查询到返回认证信息AuthenticationInfo
        ActiveUser activeUser = new ActiveUser();
        activeUser.setUserid(sysUser.getId());
        activeUser.setUsercode(sysUser.getUsercode());
        activeUser.setUsername(sysUser.getUsername());
        //将activeUser设置simpleAuthenticationInfo
        return new SimpleAuthenticationInfo(activeUser, password, ByteSource.Util.bytes(salt), this.getName());
    }


    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        //从 principals获取主身份信息
        //将getPrimaryPrincipal方法返回值转为真实身份类型（在上边的doGetAuthenticationInfo认证通过填充到SimpleAuthenticationInfo中身份类型），
        ActiveUser activeUser =  (ActiveUser) principals.getPrimaryPrincipal();
        //从数据库获取到权限数据
        List<SysPermission> permissionList = null;
        try {
            permissionList = sysService.findPermissionListByUserId(activeUser.getUserid());
        } catch (Exception e) {
            e.printStackTrace();
        }
        //单独定一个集合对象
        List<String> permissions = new ArrayList<>();
        if(permissionList!=null){
            for(SysPermission sysPermission:permissionList){
                permissions.add(sysPermission.getPercode());
            }
        }
        //查到权限数据，返回授权信息(要包括 上边的permissions)
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        //将上边查询到授权信息填充到simpleAuthorizationInfo对象中
        simpleAuthorizationInfo.addStringPermissions(permissions);

        return simpleAuthorizationInfo;
    }

    //清除缓存
    public void clearCached() throws Exception{
        PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
        super.clearCache(principals);
    }


}
