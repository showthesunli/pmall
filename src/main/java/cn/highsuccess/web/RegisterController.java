package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.module.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
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
    protected RegisterController(JavaDataSet jds, HisuMngDataGroupAndId hisuMngDataGroupAndId) {
        super(jds, hisuMngDataGroupAndId);
    }

    @RequestMapping(method = RequestMethod.GET)
    public String registerForm(@PathVariable String path ,Model model){
        System.out.println(path);

        model.addAttribute(new User());
        return "register";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String register(Model model,@Valid User user,Errors errors){
        if (errors.hasErrors()){
            handleError(model, errors);
            return "register";
        }
        return "redirect:/";
    }
}
