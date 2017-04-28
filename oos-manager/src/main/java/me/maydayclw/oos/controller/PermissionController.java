package me.maydayclw.oos.controller;

import me.maydayclw.oos.dto.AjaxResult;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.SysPermission;
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
 * <p>Date: 2017/4/23 </p>
 * <p>Time: 16:49 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@Controller
@RequestMapping(value = "/permission")
public class PermissionController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private SysService sysService;

    @RequestMapping(value = "/list")
    /*@RequiresPermissions("user:query")*/
    public String list() {
        return "/permission/list";
    }

    @RequestMapping(value = "/data")
    @ResponseBody
    public PageResult<SysPermission> data(Integer pageNumber, Integer pageSize) {
        return sysService.getSysPermissionList(pageNumber, pageSize);
    }
    @RequestMapping(value = "/all_data")
    @ResponseBody
    public List<SysPermission> data() {
        return sysService.getSysPermissionList();
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public AjaxResult<Integer> add(SysPermission sysPermission) {
        try {
            SysPermission sysPermissionById = sysService.findSysPermissionById(sysPermission.getId());
            if(sysPermissionById != null){
                return new AjaxResult<>(false, "资源ID已经存在");
            }
        } catch (Exception e) {
            return new AjaxResult<>(false, "操作失败");
        }
        boolean status = sysService.addSysPermission(sysPermission);
        if (status){
            return new AjaxResult<>(true, "添加成功");
        }else{
            return new AjaxResult<>(false, "添加失败");
        }
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult<Integer> update(SysPermission sysPermission){
        boolean status = sysService.updateSysPermission(sysPermission);
        if(status){
            return new AjaxResult<>(true, "更新成功");
        }else{
            return new AjaxResult<>(false, "更新失败");
        }
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public AjaxResult<Integer> delete(@RequestBody List<SysPermission> sysPermissionList){
        boolean status = sysService.deleteSysPermissions(sysPermissionList);
        if(status){
            return new AjaxResult<>(true, "删除成功");
        }else{
            return new AjaxResult<>(false, "删除失败");
        }
    }

}
