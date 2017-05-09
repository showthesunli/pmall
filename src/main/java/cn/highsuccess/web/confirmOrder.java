package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.data.serivce.OrderService;
import cn.highsuccess.data.serivce.ShoppingCartService;
import cn.highsuccess.module.Order;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
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
    @Qualifier("queryOrder")
    private HisuMngDataGroupAndId queryOrder;

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
            return "redirect:/confirmOrder";
        }

        order.setItemList(shoppingCartService.getShoppingCart().getBuyerItemList());

        orderService.initOrder(order);
        boolean ordFlag = orderService.placeOrder();
        if (ordFlag){
            Map<String,Object> param = new HashMap<>();
            param.put("billNo",orderService.getOrder().getOrderNo());
            excute(model,param,queryOrder);
            //返回购买确认页面
            return "/buycfm";
        }else {
            //返回下单出错页面
            return "redirect:/";
        }
    }

    @RequestMapping(value = "/buycfm{matrix}",method = RequestMethod.GET)
    public String buyCfm(Model model,
                         @MatrixVariable Map<String,Object> map){
        if (map.get("billNo") != null){
            excute(model,map,queryOrder);
        }else {
            Map<String,Object> param = new HashMap<>();
            param.put("billNo",orderService.getOrder().getOrderNo());
            excute(model,param,queryOrder);
        }
        orderService.payOrder();
        //返回购买确认页面
        return "/buycfm";
    }

    @RequestMapping(value = "/queryorder{matrix}",produces = "application/json;charset=UTF-8;")
    @ResponseBody
    public String queryOrderInfo(Model model,
                               @MatrixVariable Map<String,Object> map){
        excute(model,map,queryOrder);
        Map<String,Object> retMap = new HashMap<>(model.asMap());
        JSONObject jo = new JSONObject(retMap);
        logger.debug(jo.toString());
        return jo.toString();
    }

    //删除送货地址
    @RequestMapping(value = "/deleteAddr",method = RequestMethod.POST)
    public String deleteAddr(Model model,
                                  @RequestParam String objectID
                                  ){
        logger.debug("/deleteAddr : post");
        logger.debug("objectID :" + objectID);
        StringBuilder condition = new StringBuilder();
        condition.append("objectID=").append(objectID).append("|");
        this.getJavaOperate().service("jf_memberCenter","btnDelUserAddr",condition.toString());

        return "redirect:/myInformation";
    }
    
    //增加送货地址
    @RequestMapping(value = "/addAddr",method = RequestMethod.POST)
    public String addAddr(Model model,
                                  @RequestParam String memberID,
                                  @RequestParam String mobile,
                                  @RequestParam String email,
                                  @RequestParam String gender
                                  ){
        logger.debug("/deleteAddr : post");
        logger.debug("memberID :" + memberID);
        logger.debug("mobile :" + mobile);
        StringBuilder condition = new StringBuilder();
        condition.append("memberID=").append(memberID).append("|");
        condition.append("mobile=").append(mobile).append("|");
        condition.append("email=").append(email).append("|");
        condition.append("gender=").append(gender).append("|");
        this.getJavaOperate().service("jf_memberCenter","btnAddUserAddr",condition.toString());

        return "redirect:/myInformation";
    }
}
