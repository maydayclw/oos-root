package me.maydayclw.oos.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import me.maydayclw.oos.dto.PageResult;
import me.maydayclw.oos.pojo.Content;
import me.maydayclw.oos.pojo.Item;

import java.util.List;

/**
 * <p>Description  </p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/5/12 </p>
 * <p>Time: 21:38 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public class JsonUtil {

    // 定义jackson对象
    private static final ObjectMapper MAPPER = new ObjectMapper();

    /**
     * 将对象转换成json字符串。
     * <p>Title: pojoToJson</p>
     * <p>Description: </p>
     * @param data 对象
     * @return json
     */
    public static String objectToJson(Object data) {
        try {
            return MAPPER.writeValueAsString(data);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将json结果集转化为对象
     *
     * @param jsonData json数据
     * @return pojo
     */
    public static <T> T jsonToPojo(String jsonData, Class<T> beanType) {
        try {
            return MAPPER.readValue(jsonData, beanType);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

 /**
     * 将json结果集转化为对象
     *
     * @param jsonData json数据
     * @return pojo
     */
    public static <T> T jsonToPageContent(String jsonData) {
        try {
            return MAPPER.readValue(jsonData, new TypeReference<PageResult<Content>>() {});
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 将json结果集转化为对象
     *
     * @param jsonData json数据
     * @return pojo
     */
    public static <T> T jsonToPageItem(String jsonData) {
        try {
            return MAPPER.readValue(jsonData, new TypeReference<PageResult<Item>>() {});
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将json数据转换成pojo对象list
     * <p>Title: jsonToList</p>
     * <p>Description: </p>
     * @param jsonData json
     * @param beanType 类型
     * @return List
     */
    public static <T>List<T> jsonToList(String jsonData, Class<T> beanType) {
        JavaType javaType = MAPPER.getTypeFactory().constructParametricType(List.class, beanType);
        try {
            return MAPPER.readValue(jsonData, javaType);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
