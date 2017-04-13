package cn.highsuccess.web;

import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.module.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

/**
 * Created by showt on 2017/4/14.
 */
@Controller
@RequestMapping(value = "/register")
public class RegisterController extends HisuBaseControllerAdapter {
    @Autowired
    @Override
    public void setJds(JavaDataSet jds) {
        this.jds = jds;
    }


    @RequestMapping(method = RequestMethod.GET)
    public String registerForm(Model model){

        return "register";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String register(Model model,@Valid User user,Errors errors){
        if (errors.hasErrors()){
//            model.addAttribute("errors",bindingResult.getAllErrors());
            errors.reject("user.id","自定义错误");
            errors.reject("id","1自定义错误");
            return "register";
        }
        System.out.println(user.getId());
        System.out.println(user.getPassword());
        return "redirect:/";
    }
}
