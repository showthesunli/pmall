package cn.highsuccess.web;

import cn.highsuccess.data.JavaDataSet;
import org.json.JSONObject;
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
    protected JavaDataSet jds;
    protected List<String> dataGroup;
    protected Map<String,List<String>> dataId;

    protected JavaDataSet getJds() {
        return jds;
    }

    protected  void setDataGroup(List<String> dataGroup) {
        this.dataGroup = dataGroup;
    }

    protected void setDataId(Map<String, List<String>> dataId) {
        this.dataId = dataId;
    }

//    protected abstract <E> void  initGroupAndData(E e);

    public abstract void  setJds(JavaDataSet jds);

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
