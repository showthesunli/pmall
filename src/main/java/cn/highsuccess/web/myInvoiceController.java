package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.data.serivce.ReceiveInfoService;
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
 * Created by prototype on 2017/5/19.
 */
@Controller
public class myInvoiceController extends HisuBaseControllerAdapter{

    @Autowired
    private ReceiveInfoService receiveInfoService;

    @Autowired
    @Qualifier("queryPersonalAdress")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected myInvoiceController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    /*char attr128LenValue1[128]; //发票标签
	char attr128LenValue2[128]; //发票抬头
	int intAttrValue1; //发票类型
	int intAttrValue2; //发票内容
	char attr128LenValue3[128]; //收票人手机
	char attr128LenValue4[128]; //收票人邮箱
	char attr128LenValue5[128]; //公司纳税人识别号
*/
    @RequestMapping(value = "/myAddress",method = RequestMethod.GET)
    public String showAddress(Model model){
        Map<String ,Object> param = new HashMap<>();
        param.put("memberID",this.getJds().getUserName());
        excute(model,param,hisuMngDataGroupAndId);
        return "/myAddress";
    }

    //删除送货地址
    @RequestMapping(value = "/deleteAddr",method = RequestMethod.POST)
    public String deleteAddr(Model model,
                             @Valid UserReceiveInfoItem userReceiveInfoItem){
        String condition = "objectID="+userReceiveInfoItem.getObjectID();
        this.getJavaOperate().service("jf_memberCenter", "btnDelUserAddr", condition);
        return "redirect:/myAddress";
    }
    //增加送货地址
    @RequestMapping(value = "/addAddr",method = RequestMethod.POST)
    public String addAddr(Model model,
                          @Valid UserReceiveInfoItem userReceiveInfoItem,
                          @RequestParam String forword){
        logger.debug("/addAddr : post");
        logger.debug("forword=" + forword);
        StringBuilder condition = new StringBuilder();
        condition.append("addr=").append(userReceiveInfoItem.getAddr()).append("|");
        condition.append("zip=").append(userReceiveInfoItem.getZipCode()).append("|");
        condition.append("name=").append(userReceiveInfoItem.getReceiverName()).append("|");
        condition.append("phone=").append(userReceiveInfoItem.getPhone()).append("|");
        condition.append("isDefault=").append(userReceiveInfoItem.getIsDefault());
        this.getJavaOperate().service("jf_memberCenter","btnAddUserAddr",condition.toString());
        if (forword == null){
            return "redirect:/myAddress";
        }else {
            return "redirect:/"+forword;
        }
    }

    @RequestMapping(value = "/modAddr",method = RequestMethod.POST)
    public String modAddr(Model model,
                          @Valid UserReceiveInfoItem userReceiveInfoItem){
        StringBuilder condition = new StringBuilder();
        condition.append("objectID=").append(userReceiveInfoItem.getObjectID()).append("|");
        condition.append("addr=").append(userReceiveInfoItem.getAddr()).append("|");
        condition.append("zip=").append(userReceiveInfoItem.getZipCode()).append("|");
        condition.append("name=").append(userReceiveInfoItem.getReceiverName()).append("|");
        condition.append("phone=").append(userReceiveInfoItem.getPhone()).append("|");
        condition.append("isDefault=").append(userReceiveInfoItem.getIsDefault());
        this.getJavaOperate().service("jf_memberCenter","btnModUserAddr",condition.toString());
        return "redirect:/myAddress";
    }
}
