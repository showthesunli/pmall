package cn.highsuccess.web.wechart;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.service.util.HisuOperatePasswd;
import cn.highsuccess.web.HisuBaseControllerAdapter;
import cn.highsuccess.web.exception.HisuFlashOperationExcetion;
import cn.highsuccess.web.exception.HisuOperateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by prototype on 2017/5/24.
 */
@Controller
public class QuickExchangeTHCardController extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier("quickExchangeTHCard")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected QuickExchangeTHCardController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "/quickExchangeTHCard{matrix}",method = RequestMethod.GET)
    public String showQucikExchangeTHCard(Model model,
                                          @MatrixVariable Map<String,Object> map){

        excute(model,map,hisuMngDataGroupAndId);
        return "/quickExchangeTHCard";
    }

    /**
     * TODO 密码加密被注释
     * @param model
     * @param cardNo
     * @param cardPinCiperUnderZPK
     * @param prdNo
     * @param mobile
     * @param prdNum
     * @return
     */
    @RequestMapping(value = "/quickExchangeTHCard",method = RequestMethod.POST)
    public String quickExchangeTHCard(Model model,
                                      RedirectAttributes rModel,
                                      @RequestParam @NotNull String cardNo,
                                      @RequestParam @NotNull String cardPinCiperUnderZPK,
                                      @RequestParam @NotNull String prdNo,
                                      @RequestParam @NotNull String mobile,
                                      @RequestParam(defaultValue = "1") String prdNum){
        StringBuilder condition = new StringBuilder();
        condition.append("mobile=").append(mobile).append("|");
        condition.append("cardNo=").append(cardNo).append("|");
//        cardPinCiperUnderZPK = HisuOperatePasswd.hisuEncPasswd(cardPinCiperUnderZPK);
        condition.append("cardPinCiperUnderZPK=").append(cardPinCiperUnderZPK).append("|");
        condition.append("prdNo=").append(prdNo).append("|");
        condition.append("prdNum=").append(prdNum);
        try {
            this.getJavaOperate().service("jf_wechat_quickExchangePage","exchangeGoodsByTooHotCard",condition.toString());
        }catch (HisuOperateException e){
            Map<String,Object> map = new HashMap<>();
            map.put("prdNo",prdNo);
            throw new HisuFlashOperationExcetion(e.getMessage(),map);
        }
        String billNo = this.getJavaOperate().getResponseData().optString("billNo");
        rModel.addFlashAttribute("billNo",billNo);
        return "redirect:/quickExchangeSuccess";
    }
}
