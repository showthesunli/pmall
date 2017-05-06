package cn.highsuccess.web;

import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by prototype on 2017/5/6.
 */
@Controller
public class ShoppingCart extends HisuBaseControllerAdapter {

    @Autowired
    protected ShoppingCart(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "/shoppingCart" ,method = RequestMethod.GET)
    public String showCart(HttpServletRequest req,Model model,@CookieValue(value = "")String shoppingCartStr){

        return "/shoppingCart";
    }
}
