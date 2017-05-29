package cn.highsuccess.web;

import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.data.serivce.OrderService;
import cn.highsuccess.data.serivce.PayService;
import cn.highsuccess.module.OrderPaySsn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

/**
 * Created by prototype on 2017/5/10.
 */
@Controller
public class PayController extends HisuBaseControllerAdapter{
    @Autowired
    private OrderService orderService;

    @Autowired
    private PayService payService;

    @Autowired
    protected PayController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping("/pay")
    public String pay(Model model,
                      @NotNull String termID,
                      @Valid OrderPaySsn orderPaySsn,
                      Errors errors){
        if (errors.hasErrors()){
            handleError(model,errors);
        }
        //初始化paySsn
        payService.perPayInitPaySsn(orderPaySsn.getOrderNo(),orderPaySsn.getPayer());

        //支付订单
//        payService.payOrder();

        model.addAttribute("termID",termID);
        model.addAttribute("memberID",this.getJds().getUserName());
        model.addAttribute("payer",this.payService.getOrderPaySsn().getPayer());
        model.addAttribute("paySsn",this.payService.getOrderPaySsn().getPaySsn());
        model.addAttribute("noticeurl", "http://localhost:8080/pmall/notice");
        model.addAttribute("payAmt",payService.getOrderPaySsn().getTotalAmt());
        return "/payToGateWay";
    }

    @RequestMapping(value = "/notice")
    public String notice(Model model,
                         @RequestParam @Valid @NotNull String orderNumber,
                         @RequestParam @Valid @NotNull int retCode,
                         @RequestParam @Valid @NotNull String payer,
                         @RequestParam String retMsg){

        logger.debug("orderNumber="+orderNumber);
        logger.debug("retCode="+retCode);
        logger.debug("payer="+payer);
        payService.perNoticInitPaySsn(orderNumber, payer);
        if (retCode<0){
            payService.noticeOrder(false);
            return "/orderPayFailed";
        }else {
            payService.noticeOrder(true);
            return "/orderPaySuccess";
        }
    }
}
