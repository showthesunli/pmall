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
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by prototype on 2017/5/27.
 */
@Controller
public class QucikSearchDetialController extends HisuBaseControllerAdapter {
    @Autowired
    @Qualifier("queryQuickExOrderDetail")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    @Qualifier("queryQuickExOrder")
    private HisuMngDataGroupAndId queryQuickExOrder;

    @Autowired
    protected QucikSearchDetialController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "/quickSearchDetial")
    public String quickSearchDetial(Model model,
                                    @RequestParam @NotNull String billNo){
        Map<String,Object> param = new HashMap<>();
        param.put("billNo",billNo);
        excute(model,param,hisuMngDataGroupAndId);
        excute(model,param,queryQuickExOrder);
        return "/quickSearchDetial";
    }
}
