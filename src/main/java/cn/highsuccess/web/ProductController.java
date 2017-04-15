package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by prototype on 2017/3/24.
 */
@Controller
public class ProductController extends HisuBaseControllerAdapter{

    @Autowired
    protected ProductController(JavaDataSet jds, HisuMngDataGroupAndId hisuMngDataGroupAndId) {
        super(jds, hisuMngDataGroupAndId);
    }

    public String productList(){

        return null;
    }
}
