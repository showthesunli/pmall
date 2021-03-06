package cn.highsuccess.web.advice;

import cn.highsuccess.web.exception.*;
import com.alibaba.fastjson.JSON;
import com.sun.tracing.dtrace.ModuleAttributes;
import freemarker.core.InvalidReferenceException;
import freemarker.template.TemplateException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by showt on 2017/4/19.
 */
@ControllerAdvice
public class HisuControllerExceptionAdvice {
    private final Log logger = LogFactory.getLog(this.getClass());


    @ExceptionHandler(HisuOperateException.class)
    public String handlOperationException(HttpServletRequest req,HisuOperateException ex) throws UnsupportedEncodingException {
        logger.error("request:" + req.getRequestURI() + " exception:" + ex);
        StringBuilder viewName = new StringBuilder(req.getRequestURI());
        viewName.delete(0, req.getContextPath().length());
        processExceptionMsg(req,ex);
        logger.debug("error viewName:" + viewName.toString());
        logger.debug("error msg:" + ex.getMessage());
        return "redirect:"+viewName;
    }

    @ExceptionHandler(HisuFlashOperationExcetion.class)
    public RedirectView hanlFlashOperationException(HttpServletRequest req,HisuFlashOperationExcetion ex){
        logger.error("request:" + req.getRequestURI() + " exception:" + ex);
        String path = req.getContextPath();
        logger.debug("path:" + path);
        RedirectView rw = new RedirectView(path + ex.getRedirectUrl());
        rw.setAttributesMap(ex.getMap());
        FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(req);
        if (outputFlashMap != null){
            Map<String,Object> map = new HashMap<>();
            map.put("msg",ex.getMessage());
            outputFlashMap.put("errorMsg",map);
        }
        logger.debug("error viewName:" + ex.getRedirectUrl());
        logger.debug("error msg:" + ex.getMessage());
        return rw;
    }

    @ExceptionHandler(HisuFlashOperationForJSONException.class)
    @ResponseBody
    public String handleFlashOperationForJSONException(HttpServletRequest req,HisuFlashOperationForJSONException ex){
        Map<String,Object> map = new HashMap<>();
        Map<String,String> msg = new HashMap<>();
        msg.put("msg",ex.getMessage());
        map.put("errorMsg", msg);
        return JSON.toJSONString(map);
    }

    @ExceptionHandler(Exception.class)
    public String handleException(HttpServletRequest req,Exception ex){
        logger.error("request:" + req.getRequestURI() + " exception:" + ex);
        ex.printStackTrace();
        processExceptionMsg(req, ex);
        logger.debug("error msg:" + ex.getMessage());
        return "redirect:/500error";
    }

    public void processExceptionMsg(HttpServletRequest req,Exception ex){
        FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(req);
        if (outputFlashMap != null){
            Map<String,Object> map = new HashMap<>();
            map.put("msg",ex.getMessage());
            outputFlashMap.put("errorMsg",map);
        }
    }

}
