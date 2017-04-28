package me.maydayclw.oos.dto;

import java.io.Serializable;
import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/4/25 </p>
 * <p>Time: 23:46 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public class AllotDTO implements Serializable{
    private String userId;
    private List<String> roleArr;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public List<String> getRoleArr() {
        return roleArr;
    }

    public void setRoleArr(List<String> roleArr) {
        this.roleArr = roleArr;
    }
}
