package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.module.UserReceiveInfoItem;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

import javax.validation.Valid;

/**
 * Created by prototype on 2017/4/20.
 */
@Controller
public class PersonalOrderController extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier(value = "queryPensonalCenterOrder")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected PersonalOrderController(JavaDataSet jds,JavaOperate javaOperate) {
        super(jds,javaOperate);
    }

    @GetMapping(value = "/myOrder{matrix}")
    public String showMemberOrder(Model model,
                                  @MatrixVariable(required = false,defaultValue = "1") int currentPage,
                                  @MatrixVariable(required = false,defaultValue = "12") int numOfPerPage,
                                  @MatrixVariable(required = false) Map<String,String> map) throws JSONException {
        logger.debug("queryMemberOrder process");
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
        return "/myOrder";
    }

    //删除订单
    @RequestMapping(value = "/deleteOrder")
    public String deleteAddr(Model model,
    						@RequestParam String billNo){
        String condition = "billNo="+billNo;
        this.getJavaOperate().service("jf_memberCenter", "cancelOrder", condition);
        return "redirect:/myOrder";
    }
}
