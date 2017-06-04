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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by prototype on 2017/5/27.
 */
@Controller
public class QuickSearchController extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier("queryQuickExOrder")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected QuickSearchController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "/quickSearchOrder")
    public String showQucikSearch(Model model,
                                  @RequestParam @NotNull String mobile){
        Map<String,Object> param = new HashMap<>();
        param.put("memberID", mobile);
        excute(model,param,hisuMngDataGroupAndId);
        return "/quickSearchOrder";
    }
}