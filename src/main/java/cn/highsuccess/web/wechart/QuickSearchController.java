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
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping(value = "/quickSearchOrder{matrix}")
    public String showQucikSearch(Model model,
                                  @RequestParam @NotNull String mobile,
                                  @MatrixVariable(required = false,defaultValue = "1") String currentPage,
                                  @MatrixVariable(required = false,defaultValue = "6") String numOfPerPage){
        Map<String,Object> param = new HashMap<>();
        param.put("memberID", mobile);
        param.put("currentPage",currentPage);
        param.put("numOfPerPage",numOfPerPage);
        excute(model, param, hisuMngDataGroupAndId);
        return "/quickSearchOrder";
    }

    @RequestMapping(value = "/quickSearchOrderList{matrix}",method = RequestMethod.GET,produces = "application/json;charset=UTF-8;")
    @ResponseBody
    public String quickSearchList(Model model,
                                  @RequestParam @NotNull String mobile,
                                  @MatrixVariable(required = false,defaultValue = "1") String currentPage,
                                  @MatrixVariable(required = false,defaultValue = "6") String numOfPerPage,
                                  @MatrixVariable Map<String,Object> map){
        Map<String,Object> param = new HashMap<>(map);
        param.put("memberID", mobile);
        excute(model, param, hisuMngDataGroupAndId);
        return JSON.toJSONString(model.asMap());
    }
}