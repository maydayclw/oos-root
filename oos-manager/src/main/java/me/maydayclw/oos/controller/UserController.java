package me.maydayclw.oos.controller;

import me.maydayclw.oos.dto.AjaxResult;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.SysUser;
import me.maydayclw.oos.service.SysService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/4/18 </p>
 * <p>Time: 15:05 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private SysService sysService;

    @RequestMapping(value = "/list")
    /*@RequiresPermissions("user:query")*/
    public String list(){
        return "/user/list";
    }
    @RequestMapping(value = "/data")
    @ResponseBody
    public PageResult<SysUser> data(Integer pageNumber, Integer pageSize){
        return sysService.getSysUserList(pageNumber,pageSize);
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public AjaxResult<Integer> delete(@RequestBody List<SysUser> sysUserList){
        boolean status = sysService.deleteSysUsers(sysUserList);
        if(status){
            return new AjaxResult<>(true, "删除成功");
        }else{
            return new AjaxResult<>(false, "删除失败");
        }
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult<Integer> update(SysUser sysUser){
        boolean status = sysService.updateSysUser(sysUser);
        if(status){
            return new AjaxResult<Integer>(true,"更新成功");
        }else{
            return new AjaxResult<Integer>(false,"更新失败");
        }
    }

}
