package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Created by prototype on 2017/4/5.
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController extends HisuBaseControllerAdapter{

    protected LoginController(JavaDataSet jds, HisuMngDataGroupAndId hisuMngDataGroupAndId) {
        super(jds, hisuMngDataGroupAndId);
    }

    @RequestMapping(method = RequestMethod.GET)
    public String userLoginForm(){
        return "login";
    }

}
