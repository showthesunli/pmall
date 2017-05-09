package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.config.systemproperties.HisuMngDataIdArgs;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.module.BuyerItem;
import cn.highsuccess.module.User;
import cn.highsuccess.service.util.HisuOperatePasswd;

import com.alibaba.fastjson.JSON;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.UnsupportedEncodingException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

/**
 * Created by prototype on 2017/4/20.
 */
@Controller
public class PersonalInfoController extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier(value = "queryPersonalCenterInfo")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected PersonalInfoController(JavaDataSet jds,JavaOperate javaOperate) {
        super(jds,javaOperate);
    }

    @GetMapping(value = "/myInformation{matrix}")
    public String showMemberInfo(Model model,
                                  @MatrixVariable(required = false) Map<String,String> map) throws JSONException {
        logger.debug("personalCenterInfo process");
        Map<String,Object> param = new HashMap<>(map);
        param.put("memberID", this.getJds().getUserName());        
        excute(model, param, hisuMngDataGroupAndId);
        return "/myInformation";
    }
    
    //修改个人信息
    @RequestMapping(value = "/modifyMemberInfo",method = RequestMethod.POST)
    public String modifyMemberInfo(Model model,
                                  @RequestParam String memberID,
                                  @RequestParam String mobile,
                                  @RequestParam String email,
                                  @RequestParam String gender
                                  ){
        logger.debug("/modifyMemberInfo : post");
        logger.debug("memberID :" + memberID);
        logger.debug("mobile :" + mobile);
        StringBuilder condition = new StringBuilder();
        condition.append("memberID=").append(memberID).append("|");
        condition.append("mobile=").append(mobile).append("|");
        condition.append("email=").append(email).append("|");
        condition.append("gender=").append(gender).append("|");
        this.getJavaOperate().service("w_mmbCenterPage","cytModMmbInfo",condition.toString());

        return "redirect:/myInformation";
    }

}
