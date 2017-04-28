package me.maydayclw.oos.mapper;

import me.maydayclw.oos.pojo.SysUser;
import me.maydayclw.oos.pojo.SysUserExample;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 * Created by DAV5 on 2017/4/16.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext-*.xml")
public class SysUserMapperTest {

    @Autowired
    private SysUserMapper sysUserMapper;
    @Test
    public void countByExample() throws Exception {
        SysUserExample sysUserExample = new SysUserExample();
        SysUserExample.Criteria criteria = sysUserExample.createCriteria();
        criteria.andLockedEqualTo("0");
        int i = sysUserMapper.countByExample(sysUserExample);
        System.out.println(i);
    }

    @Test
    public void deleteByExample() throws Exception {

    }

    @Test
    public void deleteByPrimaryKey() throws Exception {

    }

    @Test
    public void insert() throws Exception {
        SysUser sysUser = new SysUser();
        sysUser.setId("dave");
        sysUser.setLocked("0");
        sysUser.setPassword("fasdfasdfasf");
        sysUser.setSalt("fdasfsa");
        sysUser.setUsercode("fdsafsadf");
        sysUser.setUsername("maydayclw");
        int insert = sysUserMapper.insert(sysUser);
        if(insert == 1){
            System.out.println("insert success");
        }else{
            System.out.println("error");
        }
    }

    @Test
    public void insertSelective() throws Exception {

    }

    @Test
    public void selectByExample() throws Exception {

    }

    @Test
    public void selectByPrimaryKey() throws Exception {

    }

    @Test
    public void updateByExampleSelective() throws Exception {

    }

    @Test
    public void updateByExample() throws Exception {

    }

    @Test
    public void updateByPrimaryKeySelective() throws Exception {

    }

    @Test
    public void updateByPrimaryKey() throws Exception {

    }

}