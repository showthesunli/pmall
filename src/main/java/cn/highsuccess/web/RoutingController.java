package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.config.systemproperties.HisuMngDataIdArgs;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.sms.SendSms;
import cn.highsuccess.transform.HisuTransform;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by prototype on 2017/4/17.
 */
@Controller
public class RoutingController extends HisuBaseControllerAdapter{
    @Autowired
    private HisuTransform htf;

    @Autowired
    private SendSms sendSms;

    @Autowired
    protected RoutingController(JavaDataSet jds,JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @GetMapping(value = "/{path}/**?numPage=*&currentPage=*")
    public String processGetWithParam(@PathVariable String path,
                             Model model,
                             @RequestParam(required = true) int numPage,
                             @RequestParam(required = true) int currentPage){
        logger.debug("path :" + path);
        logger.debug("numPage :"+numPage);
        logger.debug("currentPage :" + currentPage);
        if (null == path || path.equals("")) return "index";
        return path;
    }

    @GetMapping(value = "/{path}")
    public String processGetWithNoParam(@PathVariable String path,
                                        Model model){
        logger.debug("processGetWithNoParam path: "+path);
        return path;
    }

    @GetMapping("/")
    public String index(Model model){
        logger.debug("/ path: index");
        return processGetWithNoParam("index", model);
    }

    @ResponseBody
    @RequestMapping(value = "/ajaxGetimg")
    public String getImg(String dataGrpJson,HttpServletRequest request) throws JSONException {
        logger.debug("/ajaxGetimg");
        logger.debug("dataGrpJson :"+dataGrpJson);
        String path=request.getSession().getServletContext().getRealPath("/imgsrc/");
        logger.debug("path :" + path);
        JSONObject jo = new JSONObject(dataGrpJson);
        String fileName = jo.optString("fileName");
        boolean flag = this.htf.downloadImages(this.getJds().getUserDetails().getRemoteAddress(), this.getJds().getUserName(), path, fileName);
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("retCode", flag ? 1 : 0);
        jsonResponse.put("responseRemark", "");
        return jsonResponse.toString();
    }

    @ResponseBody
    @RequestMapping(value = "/sendMcode",produces = "application/json;charset=UTF-8;")
    public String sendMcode(Model model,
                            HttpServletRequest req,
                            @MatrixVariable Map<String,String> map,
                            @RequestParam(defaultValue = "30") int effectiveTimeLong,
                            @RequestParam  String mobile) throws Exception {
        logger.debug("/sendMcode");
        logger.debug("mobile :" + mobile);
//        handleError(model, errors);
        Map<String,Object> param = new HashMap<>(map);
        param.put("mobile",mobile);
        param.put("effectiveTimeLong",effectiveTimeLong);
        ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(req.getServletContext());
        HisuMngDataGroupAndId hisuMngDataGroupAndId = (HisuMngDataGroupAndId) ac.getBean("sendMcode");
//        excute(model, param, hisuMngDataGroupAndId);
        excuteOperate(model, param, hisuMngDataGroupAndId);

        if (((Map<String,String>)model.asMap().get("mobileAuthcode")).get("authCode") != null){
            this.sendSms.sendMcode(mobile, "您本次的验证码为 ："+((Map<String,String>)model.asMap().get("mobileAuthcode")).get("authCode"));
            return ((Map<String,String>)model.asMap().get("mobileAuthcode")).get("authCode");
        }
        return  this.getJavaOperate().getResponseData().toString();
    }
    
    
    @ResponseBody
    @RequestMapping(value = "/sendForgotPasswordCode",produces = "application/json;charset=UTF-8;")
    public String sendForgotPasswordCode(Model model,
                            HttpServletRequest req,
                            @MatrixVariable Map<String,String> map,
                            @RequestParam(defaultValue = "30") int effectiveTimeLong,
                            @RequestParam  String memberID) throws Exception {
        logger.debug("/sendForgotPasswordCode");
        logger.debug("memberID :" + memberID);
//        handleError(model, errors);
        Map<String,Object> param = new HashMap<>(map);
        param.put("memberID",memberID);
        param.put("effectiveTimeLong",effectiveTimeLong);
        ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(req.getServletContext());
        HisuMngDataGroupAndId hisuMngDataGroupAndId = (HisuMngDataGroupAndId) ac.getBean("sendForgotPasswordCode");
//        excute(model, param, hisuMngDataGroupAndId);
        excuteOperate(model, param, hisuMngDataGroupAndId);

        if (((Map<String,String>)model.asMap().get("mobileAuthcode")).get("authCode") != null){
            //this.sendSms.sendMcode(mobile, "您本次的验证码为 ："+((Map<String,String>)model.asMap().get("mobileAuthcode")).get("authCode"));
            return ((Map<String,String>)model.asMap().get("mobileAuthcode")).get("authCode");

        }
        return  this.getJavaOperate().getResponseData().toString();
    }

}
