package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by prototype on 2017/5/21.
 */
@Controller
@RequestMapping(value = "/cardOperation")
public class cardOperationController extends HisuBaseControllerAdapter{

    @Autowired
    @Qualifier(value = "queryPersonalCenterInfo")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected cardOperationController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "",method = RequestMethod.GET)
    public String showCardOper(Model model,
                               @NotNull String cardNo,
                               @NotNull int operType){
        Map<String,Object> param = new HashMap<>();
        param.put("memberID", this.getJds().getUserName());
        excute(model, param, hisuMngDataGroupAndId);
        model.addAttribute("cardNo",cardNo);
        model.addAttribute("operType", operType);
        return "/cardOperation";
    }

    @RequestMapping(value = "",method = RequestMethod.POST)
    public String sendCardPas(Model model,
                              @NotNull String mobile,
                              @NotNull String cardNo){

        StringBuilder conditon = new StringBuilder();
        conditon.append("memberID=").append(this.getJds().getUserName()).append("|");
        conditon.append("cardNo=").append(cardNo).append("|");
        conditon.append("mobile=").append(mobile);
        this.getJavaOperate().service("jf_memberCenter","sendTooTotCardMsToMobile",conditon.toString());
        model.addAttribute("cardNo",cardNo);
        if (this.getJavaOperate().getResult()){
            return "/sendCardPswSuc";
        }else {
            return "/sendCardPswFail";
        }
    }
}
