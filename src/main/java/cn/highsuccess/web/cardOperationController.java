package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.web.exception.HisuFlashOperationExcetion;
import cn.highsuccess.web.exception.HisuOperateException;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotNull;
import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by prototype on 2017/5/21.
 */
@Controller
@RequestMapping(value = "/cardOperation{matrix}")
public class cardOperationController extends HisuBaseControllerAdapter {

    @Autowired
    @Qualifier(value = "queryPersonalCenterInfo")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected cardOperationController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String showCardOper(Model model,
                               @NotNull String cardNo,
                               @NotNull int operType) {
        Map<String, Object> param = new HashMap<>();
        param.put("memberID", this.getJds().getUserName());
        excute(model, param, hisuMngDataGroupAndId);
        model.addAttribute("cardNo", cardNo);
        model.addAttribute("operType", operType);
        return "/cardOperation";
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public String sendCardPas(Model model,
                              @NotNull String mobile,
                              @NotNull String cardNo) {

        StringBuilder conditon = new StringBuilder();
        conditon.append("memberID=").append(this.getJds().getUserName()).append("|");
        conditon.append("cardNo=").append(cardNo).append("|");
        conditon.append("mobile=").append(mobile);
        try {
            this.getJavaOperate().service("jf_memberCenter", "sendTooTotCardMsToMobile", conditon.toString());
        }catch (HisuOperateException e){
            Map<String,Object> map = new HashMap<>();
            map.put("cardNo",cardNo);
            map.put("operType","1");
            throw new HisuFlashOperationExcetion(e.getMessage(), map);
        }
        model.addAttribute("cardNo", cardNo);
        return "/sendCardPswSuc";
    }

    @ExceptionHandler(HisuFlashOperationExcetion.class)
    public RedirectView handleReisterException(HttpServletRequest req,HisuFlashOperationExcetion ex) throws UnsupportedEncodingException {
        logger.error("request:" + req.getRequestURI() + " exception:" + ex);
        StringBuilder viewName = new StringBuilder(req.getRequestURI());
        viewName.delete(0, req.getContextPath().length());
        RedirectView rw = new RedirectView("/cardOperation");
        rw.setAttributesMap(ex.getMap());
        FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(req);
        if (outputFlashMap != null){
            Map<String,Object> map = new HashMap<>();
            map.put("msg",ex.getMessage());
            outputFlashMap.put("errorMsg",map);
        }
        logger.debug("error viewName:" + viewName.toString());
        logger.debug("error msg:" + ex.getMessage());
        return rw;
    }
}
