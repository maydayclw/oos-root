package me.maydayclw.oos.dto;

/**
 * <p>Description  统一Ajax返回数据</p>
 * <p>User: DAV5 </p>
 * <p>Date: 2017/4/19 </p>
 * <p>Time: 13:58 </p>
 * <p>E-mail: maydayclw@foxmail.com </p>
 * <p>Company: www.fingard.com.cn </p>
 */
public class AjaxResult<T> {
    private boolean success;
    private T data;
    private String message;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public AjaxResult(boolean success, T data) {
        this.success = success;
        this.data = data;
    }

    public AjaxResult(boolean success, String message) {
        this.success = success;
        this.message = message;
    }
}
