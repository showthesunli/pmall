package cn.highsuccess.web.wechart;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.web.HisuBaseControllerAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.constraints.NotNull;
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

    @RequestMapping(value = "/quickExchangeTHCard",method = RequestMethod.POST)
    public String quickExchangeTHCard(Model model,
                                      @RequestParam @NotNull String cardNo,
                                      @RequestParam @NotNull String cardPinCiperUnderZPK,
                                      @RequestParam @NotNull String prdNo,
                                      @RequestParam(defaultValue = "1") String prdNum){
        StringBuilder condition = new StringBuilder();
        condition.append("cardNo=").append(cardNo).append("|");
        condition.append("cardPinCiperUnderZPK=").append(cardPinCiperUnderZPK).append("!");
        condition.append("prdNo=").append(prdNo).append("|");
        condition.append("prdNum=").append(prdNum);
        this.getJavaOperate().service("jf_wechat_quickExchangePage","exchangeGoodsByTooHotCard",condition.toString());
        if (this.getJavaOperate().getResult()){
            String billNo = this.getJavaOperate().getResponseData().optString("billNo");
            return "redirect:/myDetial?billNo="+billNo;
        }else {
            return "redirect:/quickExchangeTHCard;prdNo="+prdNo;
        }
    }
}
