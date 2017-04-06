package cn.highsuccess.web;

import cn.highsuccess.data.impl.JavaDataSet;
import org.springframework.beans.factory.annotation.Autowired;
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
public class MemberController extends HisuBaseControllerAdapter {

    @RequestMapping(value = "/member" ,method = RequestMethod.GET)
    public String member(Model model){
        this.jds.service("jf_memberCenter","memberInfo");
        System.out.println(this.jds.getData().toString());
        System.out.println(this.jds.getReturnCode());
        System.out.println(this.jds.getResponseRemark());
        System.out.println("member");
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails){
            model.addAttribute("userName",((UserDetails) principal).getUsername());
        }
        return "member";
    }

    @Override
    @Autowired
    public void setJds(JavaDataSet jds) {
        this.jds = jds;
    }
}
