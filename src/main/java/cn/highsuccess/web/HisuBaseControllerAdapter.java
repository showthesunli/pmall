package cn.highsuccess.web;

import cn.highsuccess.data.impl.JavaDataSet;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by prototype on 2017/3/24.
 */
public abstract class HisuBaseControllerAdapter {
    @Autowired
    protected JavaDataSet jds;

    public JavaDataSet getJds() {
        return jds;
    }
}
