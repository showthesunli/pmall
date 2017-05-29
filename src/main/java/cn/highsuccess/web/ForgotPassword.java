package cn.highsuccess.web;

import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.module.User;
import cn.highsuccess.service.util.HisuOperatePasswd;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

/**
 * Created by prototype on 2017/5/5.
 */
@Controller
public class ForgotPassword extends HisuBaseControllerAdapter{

    @Autowired
    protected ForgotPassword(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "/forgotPassword",method = RequestMethod.POST)
    public String registerProcess(Model model,
                                  @RequestParam String mCode,
                                  @RequestParam String username,
                                  @RequestParam String password){
        logger.debug("/forgotPassword : post");
        logger.debug("mCode :" + mCode);
        logger.debug("memberID :" + username);

        password = HisuOperatePasswd.hisuEncPasswd(password);
        this.getJavaOperate().service("jf_memberCenter","forceChangePasswd","memberID="+username+"|authCode=" + mCode + "|mmbPINUnderZPK=" + password);
        if (this.getJavaOperate().getResult()){
            return "/login";
        }else {
            return "/forgotPassword";
        }
    }
}
