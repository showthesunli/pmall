package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.data.serivce.ReceiveInfoService;
import cn.highsuccess.module.InvoiceInfoItem;
import cn.highsuccess.module.UserReceiveInfoItem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Saviour on 2017/6/1.
 */
@Controller
public class MyInvoiceController extends HisuBaseControllerAdapter{

    @Autowired
    private ReceiveInfoService receiveInfoService;

    @Autowired
    @Qualifier("queryInvoice")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected MyInvoiceController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "/myInvoice",method = RequestMethod.GET)
    public String showInvoice(Model model){
        Map<String ,Object> param = new HashMap<>();
        param.put("memberID",this.getJds().getUserName());
        excute(model,param,hisuMngDataGroupAndId);
        return "/myInvoice";
    }

    //删除送货地址
    @RequestMapping(value = "/deleteInvoice",method = RequestMethod.POST)
    public String deleteInvoice(Model model,
                             @Valid InvoiceInfoItem invoiceInfoItem){
        String condition = "billTag="+invoiceInfoItem.getBillTag();
        this.getJavaOperate().service("jf_memberCenter", "delInvoice", condition);
        return "redirect:/myInvoice";
    }
    //增加送货地址
    @RequestMapping(value = "/addInvoice",method = RequestMethod.POST)
    public String addInvoice(Model model,
                          @Valid InvoiceInfoItem invoiceInfoItem,
                          @RequestParam String forword){
        logger.debug("/addInvoice : post");
        logger.debug("forword=" + forword);
        StringBuilder condition = new StringBuilder();
        condition.append("billTag=").append(invoiceInfoItem.getBillTag()).append("|");
        condition.append("rcptTitle=").append(invoiceInfoItem.getRcptTitle()).append("|");
        condition.append("receiptType=").append(invoiceInfoItem.getReceiptType()).append("|");
        condition.append("rcptContent=").append(invoiceInfoItem.getRcptContent()).append("|");
        condition.append("mobile=").append(invoiceInfoItem.getMobile()).append("|");
        condition.append("billReceiverMail=").append(invoiceInfoItem.getBillReceiverMail()).append("|");
        condition.append("taxpayerID=").append(invoiceInfoItem.getTaxpayerID()).append("|");
        condition.append("isDefault=").append(invoiceInfoItem.getIsDefault());
        this.getJavaOperate().service("jf_memberCenter","addInvoice",condition.toString());
        if (forword == null){
            return "redirect:/myInvoice";
        }else {
            return "redirect:/"+forword;
        }
    }

    @RequestMapping(value = "/modInvoice",method = RequestMethod.POST)
    public String modInvoice(Model model,
                          @Valid InvoiceInfoItem invoiceInfoItem){
        StringBuilder condition = new StringBuilder();
        condition.append("billTag=").append(invoiceInfoItem.getBillTag()).append("|");
        condition.append("rcptTitle=").append(invoiceInfoItem.getRcptTitle()).append("|");
        condition.append("receiptType=").append(invoiceInfoItem.getReceiptType()).append("|");
        condition.append("rcptContent=").append(invoiceInfoItem.getRcptContent()).append("|");
        condition.append("mobile=").append(invoiceInfoItem.getMobile()).append("|");
        condition.append("billReceiverMail=").append(invoiceInfoItem.getBillReceiverMail()).append("|");
        condition.append("taxpayerID=").append(invoiceInfoItem.getTaxpayerID()).append("|");
        condition.append("isDefault=").append(invoiceInfoItem.getIsDefault());
        this.getJavaOperate().service("jf_memberCenter","modInvoice",condition.toString());
        return "redirect:/myInvoice";
    }
}
