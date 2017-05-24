package cn.highsuccess.web.wechart;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.web.HisuBaseControllerAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by prototype on 2017/5/23.
 */
@Controller
public class QuickExchangeProIndController extends HisuBaseControllerAdapter {
    @Autowired
    @Qualifier("queryIndustry")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected QuickExchangeProIndController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "/quickExchangeProInd")
    public String showIndustry(Model model){
        Map<String,Object> map = new HashMap<>();
        excute(model,map,hisuMngDataGroupAndId);
        return "/quickExchangeProInd";
    }
}
