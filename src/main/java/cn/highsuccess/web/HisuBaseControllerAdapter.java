package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.config.systemproperties.HisuMngDataIdArgs;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import com.alibaba.fastjson.JSON;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.util.*;

/**
 * Created by prototype on 2017/3/24.
 */
public abstract class HisuBaseControllerAdapter {
    protected final Log logger = LogFactory.getLog(this.getClass());
    protected JavaDataSet jds;
    protected JavaOperate javaOperate;



    protected JavaDataSet getJds() {
        return jds;
    }

    protected JavaOperate getJavaOperate(){
        return this.javaOperate;
    }


    protected  HisuBaseControllerAdapter(JavaDataSet jds,JavaOperate javaOperate){
        this.javaOperate = javaOperate;
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


    protected void excute(Model model,Map<String,Object> map,HisuMngDataGroupAndId hisuMngDataGroupAndId){
        //获取groupID
        Set<String> set = hisuMngDataGroupAndId.getDataId().keySet();
        Iterator<String> iterator = set.iterator();
        while (iterator.hasNext()){
            String groupId = iterator.next();
            List<HisuMngDataIdArgs> list = hisuMngDataGroupAndId.getDataId().get(groupId);
            if (null != list && list.size()!=0){
                for (int i=0;i<list.size();i++){
                    StringBuffer condition = new StringBuffer();
                    for (int l=0;l<list.get(i).getArgs().size();l++){
                        //组装条件
                        condition.append(list.get(i).getArgs().get(l));
                        condition.append("=");
                        condition.append(map.get(list.get(i).getArgs().get(l)));
                        condition.append("|");
                    }
                    condition.deleteCharAt(condition.length()-1);
                    this.getJds().service(groupId,list.get(i).getId(),condition.toString());
                    model.addAttribute(list.get(i).getId(), JSON.parseArray(this.getJds().getDataList().toString()));
                }
            }
        }
    }

    protected void excuteOperate(Model model,Map<String,Object> map,HisuMngDataGroupAndId hisuMngDataGroupAndId){
        //获取groupID
        Set<String> set = hisuMngDataGroupAndId.getDataId().keySet();
        Iterator<String> iterator = set.iterator();
        while (iterator.hasNext()){
            String groupId = iterator.next();
            List<HisuMngDataIdArgs> list = hisuMngDataGroupAndId.getDataId().get(groupId);
            if (null != list && list.size()!=0){
                for (int i=0;i<list.size();i++){
                    StringBuffer condition = new StringBuffer();
                    for (int l=0;l<list.get(i).getArgs().size();l++){
                        //组装条件
                        condition.append(list.get(i).getArgs().get(l));
                        condition.append("=");
                        condition.append(map.get(list.get(i).getArgs().get(l)));
                        condition.append("|");
                    }
                    condition.deleteCharAt(condition.length()-1);
                    this.getJavaOperate().service(groupId, list.get(i).getId(), condition.toString());
                    model.addAttribute(list.get(i).getId(), JSON.parseObject(this.getJavaOperate().getResponseData().toString()));
                }
            }
        }
    }

}
