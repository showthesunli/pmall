package cn.highsuccess.web;

import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.module.User;
import cn.highsuccess.service.util.HisuOperatePasswd;
import cn.highsuccess.web.exception.HisuRegisterException;
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
public class Register extends HisuBaseControllerAdapter{

    @Autowired
    protected Register(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String registerProcess(Model model,
                                  @RequestParam String mCode,
                                  @RequestParam String phone,
                                  @Valid User user,
                                  Errors errors){
        logger.debug("/register : post");
        logger.debug("mCode :" + mCode);
        logger.debug("phone :" + phone);
        if (errors.hasErrors()){
            handleError(model,errors);
            throw new HisuRegisterException("注册域非法！");
        }
        user.setPassword(HisuOperatePasswd.hisuEncPasswd(user.getPassword()));
        this.getJavaOperate().service("w_mainPage","mobileRegister","memberID="+user.getId()+"|mobile=" + phone + "|openCptAcc=1|useMobileRegister=1|securityCode=" + mCode + "|passwordCiper=" + user.getPassword());
        if (this.getJavaOperate().getResult()){
            return "/login";
        }else {
            System.out.println(this.getJavaOperate().getErrMessage());
            throw new HisuRegisterException(this.getJavaOperate().getErrMessage());
        }
    }
}
