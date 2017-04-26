package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.MatrixVariable;

import java.util.Map;

/**
 * Created by prototype on 2017/4/26.
 */
@Controller
public class ProShowController extends HisuBaseControllerAdapter {
    @Autowired
    @Qualifier(value = "showProdetail")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected ProShowController(JavaDataSet jds) {
        super(jds);
    }

    @GetMapping(value = "/proshow{matrix}")
    public String proDetailShow(Model model,@MatrixVariable Map<String,String> map){
        excute(model,map,hisuMngDataGroupAndId);
        return "/proshow";
    }
}
