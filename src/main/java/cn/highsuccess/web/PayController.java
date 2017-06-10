package cn.highsuccess.web;

import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.data.serivce.OrderService;
import cn.highsuccess.data.serivce.PayService;
import cn.highsuccess.module.OrderPaySsn;
import cn.highsuccess.security.pay.PayCommonUtil;
import cn.highsuccess.web.exception.HisuPaySignException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.SortedMap;
import java.util.TreeMap;

/**
 * Created by prototype on 2017/5/10.
 */
@Controller
public class PayController extends HisuBaseControllerAdapter{
    private static final String PAY_WEB_KEY = "uwhc1jv4j8vpa97ozoftq1su73kqmeou";
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
        payService.perPayInitPaySsn(orderPaySsn.getOrderNo(), orderPaySsn.getPayer());

        model.addAttribute("termID",termID);
        model.addAttribute("memberID",this.getJds().getUserName());
        model.addAttribute("payer", this.payService.getOrderPaySsn().getPayer());
        model.addAttribute("paySsn", this.payService.getOrderPaySsn().getPaySsn());
        model.addAttribute("noticeurl", "http://localhost:8080/pmall/notice");
        model.addAttribute("payAmt", payService.getOrderPaySsn().getTotalAmt());
        model.addAttribute("payDate",this.payService.getOrderPaySsn().getBusiPayDate()+this.payService.getOrderPaySsn().getBusiPayTime());

        //增加签名摘要
        SortedMap<Object,Object> signParams = new TreeMap<Object,Object>();
        signParams.put("payer", this.payService.getOrderPaySsn().getPayer());
        signParams.put("payAmt", String.format("%.2f",payService.getOrderPaySsn().getTotalAmt()));
        signParams.put("paySsn", this.payService.getOrderPaySsn().getPaySsn());
        signParams.put("payDate", this.payService.getOrderPaySsn().getBusiPayDate()+this.payService.getOrderPaySsn().getBusiPayTime());
        String sign = PayCommonUtil.createSign("UTF-8", signParams, PAY_WEB_KEY);

        model.addAttribute("sign",sign);

        return "/payToGateWay";
    }

    @RequestMapping(value = "/notice")
    public String notice(Model model,
                         @RequestParam @Valid @NotNull String orderNumber,
                         @RequestParam @Valid @NotNull int retCode,
                         @RequestParam @Valid @NotNull String payer,
                         @RequestParam @NotNull String sign,
                         @RequestParam String retMsg){
        logger.debug("orderNumber="+orderNumber);
        logger.debug("retCode="+retCode);
        logger.debug("payer="+payer);
        logger.debug("sign="+sign);
        //验证签名
        SortedMap<Object,Object> signParams = new TreeMap<Object,Object>();
        signParams.put("orderNumber",orderNumber);
        signParams.put("retCode", retCode);
        signParams.put("payer", payer);
        signParams.put("sign", sign);
        boolean isSign = PayCommonUtil.isTenpaySign("UTF-8",signParams,PAY_WEB_KEY);
        if (isSign){
            payService.perNoticInitPaySsn(orderNumber, payer);
            if (retCode<0){
                payService.noticeOrder(false);
                return "/orderPayFailed";
            }else {
                payService.noticeOrder(true);
                return "/orderPaySuccess";
            }
        }else {
            throw new HisuPaySignException("支付通知验证签名失败!");
        }
    }
}
