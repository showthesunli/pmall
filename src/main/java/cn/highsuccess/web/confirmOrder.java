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
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
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
    @Qualifier("queryPayerForGoods")
    private HisuMngDataGroupAndId queryPayerForGoods;

    @Autowired
    @Qualifier("queryPayerForCards")
    private HisuMngDataGroupAndId queryPayerForCards;

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

        excute(model,parm,queryPayerForGoods);
        model.addAttribute(shoppingCartService.getShoppingCart().getBuyerItemList("0"));
        model.addAttribute(shoppingCartService.countProMoney());
        model.addAttribute(shoppingCartService.countProNum());
        return "/confirmOrder";
    }

    @RequestMapping(value = "/buycfm",method = RequestMethod.POST)
    public String processOrder(Model model,
                               HttpServletResponse rsp,
                               @Valid Order order,
                               Errors errors) throws UnsupportedEncodingException {

        logger.debug(order.getAddr());
        if (errors.hasErrors()){
            handleError(model,errors);
            return "redirect:/confirmOrder";
        }

        order.setItemList(shoppingCartService.getShoppingCart().getBuyerItemList(order.getOrderType()));

        orderService.initOrder(order);
        boolean ordFlag = orderService.placeOrder();
        if (ordFlag){
            if (order.getOrderType().equals("0")){
                shoppingCartService.delPrdItemFromShoppingCart();
            }else {
                shoppingCartService.delCardItemFromShoppingCart();
            }
            writBuyerItemsToCookie(rsp,shoppingCartService);
            Map<String,Object> param = new HashMap<>();
            param.put("billNo",orderService.getOrder().getOrderNo());
            excute(model,param,queryOrder);
            model.addAttribute("payer",orderService.getOrder().getPayToolIDList());
            //返回购买确认页面
            return "/buycfm";
        }else {
            //返回下单出错页面
            return "redirect:/placeOrderFailed";
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
        com.alibaba.fastjson.JSONArray ja = (com.alibaba.fastjson.JSONArray)model.asMap().get("queryMemberOrder");
        com.alibaba.fastjson.JSONObject jo  = (com.alibaba.fastjson.JSONObject)ja.get(0);
        String saleOrderPrdType = jo.getString("saleOrderPrdType");
        logger.debug("saleOrderPrdType = " + saleOrderPrdType);
        if (saleOrderPrdType.equals("0")){
            excute(model,map,queryPayerForGoods);
        }else {
            excute(model,map,queryPayerForCards);
        }
        //返回购买确认页面
        return "/paytoolsBuycfm";
    }

    @RequestMapping(value = "/queryorder{matrix}",produces = "application/json;charset=UTF-8;")
    @ResponseBody
    public String queryOrderInfo(Model model,
                               @MatrixVariable Map<String,Object> map) throws JSONException {
        excute(model, map, queryOrder);
        Map<String,Object> retMap = new HashMap<>(model.asMap());
        String retString = JSON.toJSONString(retMap);
        logger.debug(JSON.toJSONString(retMap));
        JSONObject jsonObject = new JSONObject(retString);
        JSONArray ja = jsonObject.optJSONArray("queryMemberOrder");
        JSONObject jo = ja.optJSONObject(0);
        String orderStatus = jo.optString("orderStatus");
//        JSONObject jo = new JSONObject(retMap);
//        JSONArray ja = (JSONArray)retMap.get("queryMemberOrder");
//        logger.debug(jo.optJSONObject("queryMemberOrder").optString("orderStatus"));
//        logger.debug(ja.optJSONObject(0).optString("orderStatus"));

        String status="";
        String errorMsg="";
        switch (orderStatus){
            case "等待支付": status="1";break;
            case "提交失败": status="2";errorMsg=jo.optString("remark");break;
            case "已提交": status="0";break;
            default: status="3";
        }
        return "status=" + status + "*-*" + errorMsg;
    }

}
