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

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by prototype on 2017/5/19.
 */
@Controller
public class myAddressController extends HisuBaseControllerAdapter{

    @Autowired
    private ReceiveInfoService receiveInfoService;

    @Autowired
    @Qualifier("queryPersonalAdress")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected myAddressController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

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
                          @Valid UserReceiveInfoItem userReceiveInfoItem){
        logger.debug("/addAddr : post");
        StringBuilder condition = new StringBuilder();
        condition.append("addr=").append(userReceiveInfoItem.getAddr()).append("|");
        condition.append("zip=").append(userReceiveInfoItem.getZipCode()).append("|");
        condition.append("name=").append(userReceiveInfoItem.getReceiverName()).append("|");
        condition.append("phone=").append(userReceiveInfoItem.getPhone()).append("|");
        condition.append("isDefault=").append(userReceiveInfoItem.getIsDefault());
        this.getJavaOperate().service("jf_memberCenter","btnAddUserAddr",condition.toString());
        return "redirect:/myAddress";
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
