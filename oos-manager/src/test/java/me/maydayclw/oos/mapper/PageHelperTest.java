package me.maydayclw.oos.mapper;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import me.maydayclw.oos.pojo.SysUser;
import me.maydayclw.oos.pojo.SysUserExample;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/4/18 </p>
 * <p>Time: 15:38 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext-*.xml")
public class PageHelperTest {
    @Resource
    private SysUserMapper sysUserMapper;

    @Test
    public void testPageHelper(){
        PageHelper.startPage(1,2);
        SysUserExample sysUserExample = new SysUserExample();
        List<SysUser> sysUsers = sysUserMapper.selectByExample(sysUserExample);
        PageInfo<SysUser> pageInfo = new PageInfo<>(sysUsers);
        System.out.println("总记录数:"+pageInfo.getTotal());
        System.out.println("总页数:"+pageInfo.getPages());
        System.out.println("页大小:"+pageInfo.getPageSize());
        for (SysUser sysUser : sysUsers){
            System.out.println(sysUser.getUsername());
        }
    }
}
