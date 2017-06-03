package cn.highsuccess.web.exception;

import java.util.Map;

/**
 * Created by showt on 2017/6/2.
 */
public class HisuFlashOperationExcetion extends HisuOperateException{

    private Map<String,Object> map;

    public HisuFlashOperationExcetion(String message) {
        super(message);
    }

    public HisuFlashOperationExcetion(String message,Map<String,Object> map){
        super(message);
        this.map = map;
    }

    public Map<String, Object> getMap() {
        return map;
    }
}
