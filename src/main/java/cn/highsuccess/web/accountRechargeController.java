package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.module.Card;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by showt on 2017/5/17.
 */
@Controller
public class AccountRechargeController extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier(value = "queryPersonalCenter")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected AccountRechargeController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "/accountRecharge{matrix}")
    public String accountRecharge(Model model,
                                  @RequestParam(required = false) String cardNo,
                                  @MatrixVariable(required = false) Map<String,String> map){
        Map<String,Object> param = new HashMap<>(map);
        param.put("memberID", this.getJds().getUserName());
        excute(model, param, hisuMngDataGroupAndId);
        if (cardNo != null){
            model.addAttribute("cardNo",cardNo);
        }
        return "/accountRecharge";
    }

    @RequestMapping(value = "/accountRecharge",method = RequestMethod.POST)
    public String recharge(Model model,
                           @Valid Card card,
                           Errors errors,
                           RedirectAttributes ra){
        if (errors.hasErrors()){
            handleError(model,errors);
        }
        StringBuilder condition = new StringBuilder();
        condition.append("cardNo=").append(card.getCardNo()).append("|");
        condition.append("cardPinCiperUnderZPK=").append(card.getCardPinCiperUnderZPK()).append("|");
        condition.append("memberID=").append(this.getJds().getUserName());
        this.getJavaOperate().service("jf_memberCenter", "rechargeForMemberAcc", condition.toString());
        JSONObject result = this.getJavaOperate().getResponseData();
        ra.addFlashAttribute("transAmt",result.optString("amountStr"));
        return "redirect:/member";
    }
}
