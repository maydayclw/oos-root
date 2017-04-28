package me.maydayclw.oos.controller;

import me.maydayclw.oos.dto.AjaxResult;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.SysRole;
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
import java.util.UUID;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/4/23 </p>
 * <p>Time: 16:49 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Controller
@RequestMapping(value = "/role")
public class RoleController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private SysService sysService;

    @RequestMapping(value = "/list")
    /*@RequiresPermissions("user:query")*/
    public String list() {
        return "/role/list";
    }

    @RequestMapping(value = "/data")
    @ResponseBody
    public PageResult<SysRole> data(Integer pageNumber, Integer pageSize) {
        return sysService.getSysRoleList(pageNumber, pageSize);
    }
    @RequestMapping(value = "/all_data")
    @ResponseBody
    public List<SysRole> data() {
        return sysService.getSysRoleList();
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public AjaxResult<Integer> add(SysRole sysRole) {
        UUID uuid = UUID.randomUUID();
        sysRole.setId(uuid.toString());
        boolean status = sysService.addSysRole(sysRole);
        if (status){
            return new AjaxResult<Integer>(true,"添加成功");
        }else{
            return new AjaxResult<Integer>(false,"添加失败");
        }
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult<Integer> update(SysRole sysRole){
        boolean status = sysService.updateSysRole(sysRole);
        if(status){
            return new AjaxResult<Integer>(true,"更新成功");
        }else{
            return new AjaxResult<Integer>(false,"更新失败");
        }
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public AjaxResult<Integer> delete(@RequestBody List<SysRole> sysRoleList){
        boolean status = sysService.deleteSysRoles(sysRoleList);
        if(status){
            return new AjaxResult<Integer>(true,"删除成功");
        }else{
            return new AjaxResult<Integer>(false,"删除失败");
        }
    }

}
