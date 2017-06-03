package cn.highsuccess.web.advice;

import cn.highsuccess.web.exception.HisuOperateException;
import cn.highsuccess.web.exception.HisuPathNotFoundException;
import cn.highsuccess.web.exception.HisuRegisterException;
import com.sun.tracing.dtrace.ModuleAttributes;
import freemarker.core.InvalidReferenceException;
import freemarker.template.TemplateException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

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

    @ExceptionHandler(HisuPathNotFoundException.class)
    public String pathNotFountHandler(){

        return "/reigster";
    }

    @ExceptionHandler(HisuOperateException.class)
    public String handleReisterException(HttpServletRequest req,HisuOperateException ex) throws UnsupportedEncodingException {
        logger.error("request:" + req.getRequestURI() + " exception:" + ex);
        StringBuilder viewName = new StringBuilder(req.getRequestURI());
        viewName.delete(0, req.getContextPath().length());
        processExceptionMsg(req,ex);
        logger.debug("error viewName:" + viewName.toString());
        logger.debug("error msg:" + ex.getMessage());
        return "redirect:"+viewName;
    }

    @ExceptionHandler(Exception.class)
    public String handleException(HttpServletRequest req,Exception ex){
        logger.error("request:" + req.getRequestURI() + " exception:" + ex);
        processExceptionMsg(req, ex);
        logger.debug("error msg:" + ex.getMessage());
        return "redirect:/500error";
    }

    @ExceptionHandler(TemplateException.class)
    public String handleFreemarkerException(HttpServletRequest req,TemplateException ex){
        logger.error("request:" + req.getRequestURI() + " exception:" + ex);
        processExceptionMsg(req, ex);
        logger.debug("error msg:" + ex.getMessage());
        return "redirect:/500error";
    }

    @ExceptionHandler(InvalidReferenceException.class)
    public String handleFreemarkerException(HttpServletRequest req,InvalidReferenceException ex){
        logger.error("request:" + req.getRequestURI() + " exception:" + ex);
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
