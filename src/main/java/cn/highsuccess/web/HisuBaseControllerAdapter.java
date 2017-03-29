package cn.highsuccess.web;

import cn.highsuccess.data.impl.JavaDataSet;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by prototype on 2017/3/24.
 */
public abstract class HisuBaseControllerAdapter {
    protected JavaDataSet jds;

    public JavaDataSet getJds() {
        return jds;
    }

    public abstract void  setJds(JavaDataSet jds);
}
