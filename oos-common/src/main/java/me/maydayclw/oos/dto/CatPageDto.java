package me.maydayclw.oos.dto;

import me.maydayclw.oos.pojo.ItemCat;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/6/6 </p>
 * <p>Time: 23:34 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public class CatPageDto {
    private String patentCat;
    private List<ItemCat> hasLeaf;
    private List<ItemCat> isLeaf;

    public String getPatentCat() {
        return patentCat;
    }

    public void setPatentCat(String patentCat) {
        this.patentCat = patentCat;
    }

    public List<ItemCat> getHasLeaf() {
        return hasLeaf;
    }

    public void setHasLeaf(List<ItemCat> hasLeaf) {
        this.hasLeaf = hasLeaf;
    }

    public List<ItemCat> getIsLeaf() {
        return isLeaf;
    }

    public void setIsLeaf(List<ItemCat> isLeaf) {
        this.isLeaf = isLeaf;
    }
}
