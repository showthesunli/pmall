package cn.highsuccess.web;

import cn.highsuccess.data.impl.JavaDataSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by prototype on 2017/3/24.
 */
@Controller
public class ProductController extends HisuBaseControllerAdapter{

    @Override
    @Autowired
    public void setJds(JavaDataSet jds) {
        this.jds = jds;
    }

    public String productList(){

        return null;
    }
}
