package cn.highsuccess.web;

import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.data.serivce.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by prototype on 2017/5/10.
 */
@Controller
public class PayController extends HisuBaseControllerAdapter{
    @Autowired
    private OrderService orderService;

    @Autowired
    protected PayController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }


    @RequestMapping("/pay")
    public String pay(Model model){
        boolean flag =  orderService.payOrder();
        if (flag){
            return "/orderPaySuccess";
        }else {
            return "/orderPayFailed";
        }
    }
}
