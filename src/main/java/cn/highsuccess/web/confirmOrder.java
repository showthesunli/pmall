package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.data.serivce.OrderService;
import cn.highsuccess.data.serivce.ShoppingCartService;
import cn.highsuccess.module.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by showt on 2017/5/8.
 */
@Controller
public class confirmOrder extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier(value = "queryAddr")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    private ShoppingCartService shoppingCartService;

    @Autowired
    private OrderService orderService;

    @Autowired
    protected confirmOrder(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }


    @RequestMapping(value = "/confirmOrder{matrix}")
    public String showConfirmOrder(Model model,
                                   @MatrixVariable Map<String,Object> map){
        Map<String,Object> parm = new HashMap<String,Object>(map);
        parm.put("memberID", this.getJds().getUserName());
        excute(model, parm, hisuMngDataGroupAndId);

        model.addAttribute(shoppingCartService.getShoppingCart().getBuyerItemList());
        model.addAttribute(shoppingCartService.countProMoney());
        model.addAttribute(shoppingCartService.countProNum());
        return "/confirmOrder";
    }

    @RequestMapping(value = "/buycfm",method = RequestMethod.POST)
    public String processOrder(Model model,
                               @Valid Order order,
                               Errors errors) throws UnsupportedEncodingException {

        logger.debug(order.getAddr());
        if (errors.hasErrors()){
            handleError(model,errors);
            return "redict:/confirmOrder";
        }

        order.setItemList(shoppingCartService.getShoppingCart().getBuyerItemList());

        orderService.initOrder(order);
        orderService.placeOrder();
        return "/buycfm";
    }
}
