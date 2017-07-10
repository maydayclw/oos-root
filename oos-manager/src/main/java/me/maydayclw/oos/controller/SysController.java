package me.maydayclw.oos.controller;

import me.maydayclw.oos.dto.AjaxResult;
import me.maydayclw.oos.dto.RegisterResult;
import me.maydayclw.oos.pojo.ActiveUser;
import me.maydayclw.oos.pojo.SysUser;
import me.maydayclw.oos.service.SysService;
import me.maydayclw.oos.shiro.realm.CustomRealm;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/4/17 </p>
 * <p>Time: 16:24 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Controller
@RequestMapping("/sys")
public class SysController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private SysService sysService;

    @Resource
    private CustomRealm customRealm;

    @RequestMapping("/login")
    public String login(HttpServletRequest request) throws Exception {

        //如果登陆失败从request中获取认证异常信息
        String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
        //根据shiro返回的异常类路径判断，抛出指定异常信息
        if (exceptionClassName != null) {
            if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
                //最终会抛给异常处理器
                //throw new CustomException("账号不存在");
                request.setAttribute("error", "账户不存在!");
            } else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
                request.setAttribute("error", "用户名/密码错误!");
            } else if ("randomCodeError".equals(exceptionClassName)) {
                request.setAttribute("error", "验证码错误!");
            } else {
                throw new Exception();//最终在异常处理器生成未知错误
            }
        }
        //登陆失败还到login页面
        return "login";
    }

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String index(Model model) {
        Subject subject = SecurityUtils.getSubject();
        ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
        model.addAttribute("activeUser", activeUser);
        return "main";
    }

    @RequestMapping(value = "/register",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public AjaxResult<RegisterResult> register(SysUser sysUser) {
        //判断Email和用户ID是否已经存在
        List<SysUser> sysUserList = sysService.findSysUserByIdOrEmail(sysUser);
        int size = sysUserList.size();
        if (size != 0) {//id重复或者Email重复
            for (SysUser sysUserInDB : sysUserList) {
                if (sysUser.getId().equals(sysUserInDB.getId())) {
                    return new AjaxResult<RegisterResult>(false, "用户名已存在");
                }
                if (sysUser.getUsercode().equals(sysUserInDB.getUsercode())) {
                    return new AjaxResult<RegisterResult>(false, "邮箱已存在");
                }
            }
        }
        boolean success = sysService.addSysUser(sysUser);
        if (success) {
            RegisterResult registerResult = new RegisterResult();
            registerResult.setUsercode(sysUser.getUsercode());
            registerResult.setRole("普通会员");
            return new AjaxResult<RegisterResult>(true, registerResult);
        } else {
            return new AjaxResult<RegisterResult>(false, "操作失败");
        }
    }

    @RequestMapping(value = "/allot", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult<Integer> allot(@RequestParam("userId") String userId, @RequestParam("roleArr[]") String[] roleArr) {
        boolean status = sysService.updateAllot(userId, roleArr);
        if (status) {
            return new AjaxResult<>(true, "分配成功");
        }
        return new AjaxResult<>(false, "分配失败");
    }

    @RequestMapping(value = "/auth", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult<Integer> auth(@RequestParam("roleId") String roleId, @RequestParam("permissionArr[]") String[] permissionArr) {
        boolean status = sysService.updateAuth(roleId, permissionArr);
        if (status) {
            return new AjaxResult<>(true, "授权成功");
        }
        return new AjaxResult<>(false, "授权失败");
    }

    /**
     * 清空Shiro缓存
     *
     * @return json
     */
    @RequestMapping(value = "/clearShiroCache", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult<Integer> clearShiroCache() {
        try {
            customRealm.clearCached();
        } catch (Exception e) {
            logger.error("清除缓存失败", e);
            return new AjaxResult<Integer>(false, "清除缓存失败");
        }
        return new AjaxResult<Integer>(true, "清除缓存成功");
    }
}
