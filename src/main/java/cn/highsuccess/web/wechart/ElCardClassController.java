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
 * Created by prototype on 2017/5/29.
 */
@Controller
public class ElCardClassController extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier("elCardClass")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected ElCardClassController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "/elCardClass")
    public String showSecondLevel(Model model){
        Map<String,Object> param = new HashMap<>();
        excute(model,param,hisuMngDataGroupAndId);
        return "/elCardClass";
    }
}
