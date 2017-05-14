package me.maydayclw.oos.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/14 </p>
 * <p>Time: 14:31 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public class DateUtil {

    /**
     * 日期转换成字符串
     *
     * @param date   日期
     * @param format 格式
     * @return 日期字符串
     */
    public static String toString(Date date, String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }

    /**
     * 当前日期转换成字符串
     *
     * @param format 格式
     * @return 日期字符串
     */
    public static String toString(String format) {
        return toString(new Date(), format);
    }
}
