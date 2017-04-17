package cn.highsuccess.web;

import cn.highsuccess.data.JavaDataSet;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by prototype on 2017/3/24.
 */
public abstract class HisuBaseControllerAdapter {
    protected final Log logger = LogFactory.getLog(this.getClass());
    protected JavaDataSet jds;

    protected JavaDataSet getJds() {
        return jds;
    }



    protected  HisuBaseControllerAdapter(JavaDataSet jds){
        this.jds = jds;
    }

    protected void handleError(Model model,Errors errors){
        List<FieldError> fieldErrors = errors.getFieldErrors();
        Iterator<FieldError> it = fieldErrors.iterator();
        Map<String,String> errorMap = new HashMap<String,String>();
        while (it.hasNext()){
            FieldError fieldError = it.next();
            errorMap.put(fieldError.getField(), fieldError.getDefaultMessage());
        }
        model.addAttribute("errorMsg", errorMap);
    }

    protected void excute(Model model){

    }

}
