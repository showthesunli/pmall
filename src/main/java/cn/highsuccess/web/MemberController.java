package cn.highsuccess.web;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by prototype on 2017/3/21.
 */
@Controller
public class MemberController {

    @RequestMapping(value = "/member" )
    public String member(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails){
            model.addAttribute("userName",((UserDetails) principal).getUsername());
        }
        return "member";
    }

    @RequestMapping(value = "/login" ,method = RequestMethod.POST)
    public String login(Model model){
        return "member";
    }
}
