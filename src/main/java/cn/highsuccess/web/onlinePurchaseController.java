package cn.highsuccess.web;

import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by prototype on 2017/5/10.
 */
@Controller
public class OnlinePurchaseController extends HisuBaseControllerAdapter{

    @Autowired
    protected OnlinePurchaseController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "/onlinePurchase")
    public String onlinePurchaseShow(){

        return "/onlinePurchase";
    }
}
