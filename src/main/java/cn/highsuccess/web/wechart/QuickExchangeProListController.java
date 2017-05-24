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

import java.util.Map;

/**
 * Created by prototype on 2017/5/24.
 */
@Controller
public class QuickExchangeProListController extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier("queryShoppingCard")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected QuickExchangeProListController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "/quickExchangeProList{matrix}")
    public String showQuickExchangeProList(Model model,
                                           @MatrixVariable Map<String,Object> map){
        excute(model,map,hisuMngDataGroupAndId);
        return "/quickExchangeProList";
    }
}
