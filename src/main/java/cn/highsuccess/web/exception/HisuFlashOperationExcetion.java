package cn.highsuccess.web.exception;

import java.util.Map;

/**
 * Created by showt on 2017/6/2.
 */
public class HisuFlashOperationExcetion extends HisuOperateException{

    private String redirectUrl;
    private Map<String,Object> map;

    public HisuFlashOperationExcetion(String message){
        super(message);
    }
    /**
     * @param redirectUrl 错误重定向url
     * @param message 错误信息
     * @param map url参数
     */
    public HisuFlashOperationExcetion(String redirectUrl,String message,Map<String,Object> map){
        super(message);
        this.redirectUrl = redirectUrl;
        this.map = map;
    }

    public String getRedirectUrl() {
        return redirectUrl;
    }

    public Map<String, Object> getMap() {
        return map;
    }
}
