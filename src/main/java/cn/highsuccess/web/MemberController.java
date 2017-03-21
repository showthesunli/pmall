package cn.highsuccess.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by prototype on 2017/3/21.
 */
@Controller
public class MemberController {

    @RequestMapping(value = "/member")
    public String member(){
        return "member";
    }
}
