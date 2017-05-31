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
    public String operateError(Model model){

        return null;
    }

    @ExceptionHandler(freemarker.core.InvalidReferenceException.class)
    public String freemarkerExcepiton(){


        return "/";
    }

    @ExceptionHandler(HisuRegisterException.class)
    public ModelAndView handleReisterException(HttpServletRequest req,HisuRegisterException ex){
        logger.error("request:"+req.getRequestURI() + " exception:"+ex);
        ModelAndView mv = new ModelAndView();
        handleException(mv,ex.getMessage());
        mv.setViewName("/register");
        return mv;
    }

    protected void handleException(ModelAndView mv,String exceptionMsg){
        Map<String,String> map = new HashMap<>();
        map.put("msg",exceptionMsg);
        mv.addObject("errorMsg", map);
    }

}
