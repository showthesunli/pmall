package cn.highsuccess.web.advice;

import cn.highsuccess.web.exception.HisuOperateException;
import cn.highsuccess.web.exception.HisuPathNotFoundException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.ServletException;

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

}
