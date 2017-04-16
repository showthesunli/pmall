package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.servlet.mvc.AbstractController;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by prototype on 2017/3/24.
 */
public abstract class HisuBaseControllerAdapter extends AbstractController {
    protected String viewPath;
    protected JavaDataSet jds;
    protected HisuMngDataGroupAndId hisuMngDataGroupAndId;

    protected JavaDataSet getJds() {
        return jds;
    }

    public HisuMngDataGroupAndId getHisuMngDataGroupAndId() {
        return hisuMngDataGroupAndId;
    }


    protected  HisuBaseControllerAdapter(JavaDataSet jds,HisuMngDataGroupAndId hisuMngDataGroupAndId,String viewPath){
        this.jds = jds;
        this.hisuMngDataGroupAndId = hisuMngDataGroupAndId;
        this.viewPath = viewPath;
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

}
