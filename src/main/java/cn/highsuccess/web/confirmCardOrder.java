package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.data.serivce.OrderService;
import cn.highsuccess.data.serivce.ShoppingCartService;
import cn.highsuccess.module.Order;
import com.alibaba.fastjson.JSON;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by showt on 2017/5/8.
 */
@Controller
public class confirmCardOrder extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier(value = "queryAddr")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    @Qualifier("queryOrder")
    private HisuMngDataGroupAndId queryOrder;

    @Autowired
    private ShoppingCartService shoppingCartService;

    @Autowired
    private OrderService orderService;

    @Autowired
    protected confirmCardOrder(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }


    @RequestMapping(value = "/confirmCardOrder{matrix}")
    public String showConfirmOrder(Model model,
                                   @MatrixVariable Map<String,Object> map){
        Map<String,Object> parm = new HashMap<String,Object>(map);
        parm.put("memberID", this.getJds().getUserName());
        excute(model, parm, hisuMngDataGroupAndId);

        model.addAttribute(shoppingCartService.getShoppingCart().getBuyerItemList("1"));
        model.addAttribute(shoppingCartService.countCardMoney());
        model.addAttribute(shoppingCartService.countCardNum());
        return "/confirmCardOrder";
    }

}
