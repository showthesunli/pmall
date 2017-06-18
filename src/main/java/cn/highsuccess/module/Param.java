package cn.highsuccess.module;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by prototype on 2017/6/18.
 */
public class Param {

    private Map<String,Object> param;

    public Param() {
        this.param = new HashMap<>();
    }

    public Map<String, Object> getParam() {
        return param;
    }
}
