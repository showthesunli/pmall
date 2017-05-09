package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.config.systemproperties.HisuMngDataIdArgs;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import com.alibaba.fastjson.JSON;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.MatrixVariable;

import java.util.*;

/**
 * Created by prototype on 2017/4/20.
 */
@Controller
public class PersonalCardController extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier(value = "queryPensonalCenterCard")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected PersonalCardController(JavaDataSet jds,JavaOperate javaOperate) {
        super(jds,javaOperate);
    }

    @GetMapping(value = "/myCard{matrix}")
    public String showMemberCard(Model model,
                                  @MatrixVariable(required = false,defaultValue = "1") int currentPage,
                                  @MatrixVariable(required = false,defaultValue = "12") int numOfPerPage,
                                  @MatrixVariable(required = false) Map<String,String> map) throws JSONException {
        logger.debug("showMemberCard process");
        Map<String,Object> param = new HashMap<>(map);
        param.put("memberID", this.getJds().getUserName()); 
        if (param.get("currentPage") == null){
            param.put("currentPage",currentPage);
        }
        if (param.get("numOfPerPage") == null){
            param.put("numOfPerPage",numOfPerPage);
        }
        excute(model, param, hisuMngDataGroupAndId);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("numOfPerPage",numOfPerPage);
        return "/myCard";
    }

}
