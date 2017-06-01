package cn.highsuccess.web.advice;

import cn.highsuccess.web.exception.HisuOperateException;
import cn.highsuccess.web.exception.HisuPathNotFoundException;
import cn.highsuccess.web.exception.HisuRegisterException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

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

    /**
    @ExceptionHandler(HisuOperateException.class)
    public ModelAndView handleReisterException(HttpServletRequest req,HisuOperateException ex){
        logger.error("request:"+req.getRequestURI() + " exception:"+ex);
        StringBuilder viewName = new StringBuilder(req.getRequestURI());
        viewName.delete(0,req.getContextPath().length());

        ModelAndView mv = new ModelAndView();
        handleException(mv,ex.getMessage());
        logger.debug("error viewName:"+viewName.toString());

        mv.setViewName(viewName.toString());
        return mv;
    }
     **/
    @ExceptionHandler(HisuOperateException.class)
    public String handleReisterException(HttpServletRequest req,HisuOperateException ex) throws UnsupportedEncodingException {
        logger.error("request:" + req.getRequestURI() + " exception:" + ex);
        StringBuilder viewName = new StringBuilder(req.getRequestURI());
        viewName.delete(0, req.getContextPath().length());

        logger.debug("error viewName:" + viewName.toString());
        return "redirect:"+viewName+";msg="+new String(ex.getMessage().getBytes("UTF-8"),"GBK");
    }

    protected void handleException(ModelAndView mv,String exceptionMsg){
        Map<String,String> map = new HashMap<>();
        map.put("msg",exceptionMsg);
        mv.addObject("errorMsg", map);
    }

}
