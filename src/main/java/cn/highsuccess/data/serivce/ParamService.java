package cn.highsuccess.data.serivce;

import cn.highsuccess.module.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by prototype on 2017/6/18.
 */
@Service
public class ParamService {
    @Autowired
    private Param param;

    public String getQuickSearchMcode(){
        return (String)this.param.getParam().get("VERIFYCODE");
    }

    public void setQucikSearchMcode(String mcode){
        this.param.getParam().put("VERIFYCODE", mcode);
    }
}
