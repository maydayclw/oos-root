package me.maydayclw.oos.util;

import org.junit.Test;

import java.io.File;
import java.io.FileInputStream;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/9 </p>
 * <p>Time: 21:04 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public class FtpUtilTest {
    @Test
    public void uploadFile() throws Exception {
        FileInputStream in = new FileInputStream(new File("E://1.jpg"));
        boolean isSuccess = FtpUtil.uploadFile("192.168.139.101", 21, "ftpuser", "111111",
                "/home/ftpuser/www/images", "test1", "test1.jpg", in);
        System.out.println(isSuccess);
    }

    @Test
    public void downloadFile() throws Exception {
        boolean isSuccess = FtpUtil.downloadFile("192.168.139.101", 21, "ftpuser", "111111",
                "/home/ftpuser/www/images/test1", "test1.jpg", "E:");
        System.out.println(isSuccess);
    }

}