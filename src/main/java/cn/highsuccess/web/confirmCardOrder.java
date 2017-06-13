package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.data.serivce.OrderService;
import cn.highsuccess.data.serivce.ShoppingCartService;
import cn.highsuccess.module.BuyerItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by showt on 2017/5/8.
 */
@Controller
public class ConfirmCardOrder extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier(value = "queryAddr")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;
    
    @Autowired
    @Qualifier("queryInvoice")
    private HisuMngDataGroupAndId queryInvoice;

    @Autowired
    @Qualifier("queryOrder")
    private HisuMngDataGroupAndId queryOrder;

    @Autowired
    @Qualifier("queryPayerForCards")
    private HisuMngDataGroupAndId queryPayerForCards;

    @Autowired
    private ShoppingCartService shoppingCartService;

    @Autowired
    private OrderService orderService;

    @Autowired
    protected ConfirmCardOrder(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }


    @RequestMapping(value = "/confirmCardOrder{matrix}")
    public String showConfirmOrder(Model model,
                                   @MatrixVariable Map<String,Object> map){
        Map<String,Object> parm = new HashMap<String,Object>(map);
        parm.put("memberID", this.getJds().getUserName());
        excute(model, parm, hisuMngDataGroupAndId);
        excute(model, parm, queryInvoice);
        excute(model,parm,queryPayerForCards);
        model.addAttribute(shoppingCartService.getShoppingCart().getBuyerItemList("1"));
        model.addAttribute(shoppingCartService.countCardMoney());
        model.addAttribute(shoppingCartService.countCardNum());
        return "/confirmCardOrder";
    }

    @RequestMapping(value = "/confirmCardOrderNow{matrix}")
    public String showConfirmCardOrderNow(Model model,
                                      BuyerItem buyerItem,
                                          @MatrixVariable Map<String,Object> map) throws UnsupportedEncodingException {
        Map<String,Object> parm = new HashMap<String,Object>(map);
        parm.put("memberID", this.getJds().getUserName());
        excute(model, parm, hisuMngDataGroupAndId);
        excute(model, parm, queryInvoice);
        excute(model,parm,queryPayerForCards);

        ArrayList<BuyerItem> list = new ArrayList<BuyerItem>();
        list.add(buyerItem);
        shoppingCartService.getShoppingCart().setBuyerItemList(list);
        model.addAttribute(list);
        int  prdNum = 0;
        double prdMoney = 0.00;
        if (buyerItem.getPrdType().equals("1")) {
            prdNum = buyerItem.getAmount();
            prdMoney = buyerItem.getMoney()*buyerItem.getAmount();
        }
        model.addAttribute(prdMoney);
        model.addAttribute(prdNum);
        return "/confirmCardOrder";
    }
}
