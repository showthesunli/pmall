package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by showt on 2017/5/17.
 */
@Controller
public class accountRechargeController extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier(value = "queryPersonalCenter")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected accountRechargeController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }


    @RequestMapping(value = "/accountRecharge{matrix}")
    public String accountRecharge(Model model,
                                  @MatrixVariable(required = false) Map<String,String> map){
        Map<String,Object> param = new HashMap<>(map);
        param.put("memberID", this.getJds().getUserName());
        excute(model, param, hisuMngDataGroupAndId);
        return "/accountRecharge";
    }
}
