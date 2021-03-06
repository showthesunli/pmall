package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.config.systemproperties.HisuMngDataIdArgs;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.module.UserInfo;
import cn.highsuccess.module.UserReceiveInfoItem;
import com.alibaba.fastjson.JSON;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.*;

/**
 * Created by prototype on 2017/4/20.
 */
@Controller
public class PersonalCenterController extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier(value = "queryPersonalCenter")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected PersonalCenterController(JavaDataSet jds,JavaOperate javaOperate) {
        super(jds,javaOperate);
    }

    @GetMapping(value = "/member{matrix}")
    public String membershow(Model model,
    						@MatrixVariable(required = false,defaultValue = "1") int currentPage,
    						@MatrixVariable(required = false,defaultValue = "12") int numOfPerPage,
                             @MatrixVariable(required = false) Map<String,String> map) throws JSONException {
        logger.debug("personalCenterInfo procs");
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
        return "/member";
    }

}