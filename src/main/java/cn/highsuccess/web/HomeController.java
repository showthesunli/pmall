package cn.highsuccess.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by prototype on 2017/3/17.
 */
@Controller
public class HomeController {

    @RequestMapping(value="/homepage",method = RequestMethod.GET)
    public String home(){
        return "index";
    }

}
