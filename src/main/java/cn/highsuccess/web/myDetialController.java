package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by prototype on 2017/5/20.
 */
@Controller
public class myDetialController extends HisuBaseControllerAdapter {
    @Autowired
    @Qualifier("queryOrder")
    private HisuMngDataGroupAndId queryOrder;

    @Autowired
    @Qualifier("queryOrderDtl")
    private HisuMngDataGroupAndId queryOrderDtl;

    @Autowired
    protected myDetialController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "/myDetial",method = RequestMethod.GET)
    public String showOrder(Model model,
                            @NotNull @RequestParam String billNo){
        Map<String,Object> param = new HashMap<>();
        param.put("billNo", billNo);
        excute(model,param,queryOrder);
        excute(model,param,queryOrderDtl);
        return "/myDetial";
    }
}
