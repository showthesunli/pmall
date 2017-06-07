package cn.highsuccess.web.wechart;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.web.HisuBaseControllerAdapter;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.misc.resources.Messages_pt_BR;

import java.util.HashMap;
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
                                           @MatrixVariable(required = false,defaultValue = "1") int currentPage,
                                           @MatrixVariable(required = false,defaultValue = "6") int numOfPerPage,
                                           @MatrixVariable Map<String,Object> map){
        Map<String,Object> param = new HashMap<>(map);
        param.put("currentPage",currentPage);
        param.put("numOfPerPage",numOfPerPage);
        excute(model, param, hisuMngDataGroupAndId);
        return "/quickExchangeProList";
    }

    @RequestMapping(value = "/quickExchangeProListForJSON{matrix}",method = RequestMethod.GET,produces = "application/json;charset=UTF-8;")
    @ResponseBody
    public String quickExchangeProList(Model model,
                                       @MatrixVariable(required = false,defaultValue = "1") int currentPage,
                                       @MatrixVariable(required = false,defaultValue = "6") int numOfPerPage,
                                       @MatrixVariable Map<String,Object> map){
        Map<String,Object> param = new HashMap<>(map);
        param.put("currentPage",currentPage);
        param.put("numOfPerPage",numOfPerPage);
        excute(model, param, hisuMngDataGroupAndId);
        return JSON.toJSONString(model.asMap());
    }
}
