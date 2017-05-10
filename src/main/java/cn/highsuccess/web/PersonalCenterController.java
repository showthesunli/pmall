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
                             @MatrixVariable(required = false) Map<String,String> map) throws JSONException {
        logger.debug("personalCenterInfo process");
        Map<String,Object> param = new HashMap<>(map);
        param.put("memberID", this.getJds().getUserName());
        excute(model, param, hisuMngDataGroupAndId);
        return "/member";
    }
}