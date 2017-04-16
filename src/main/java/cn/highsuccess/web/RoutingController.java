package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Created by showt on 2017/4/15.
 */
@Controller
@RequestMapping("/")
public class RoutingController extends HisuBaseControllerAdapter{

    @Autowired
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;
    protected RoutingController(JavaDataSet jds, HisuMngDataGroupAndId hisuMngDataGroupAndId) {
        super(jds, hisuMngDataGroupAndId);
    }

    @RequestMapping(value = "/{path}",method = RequestMethod.GET)
    public String getProcess(@PathVariable String path,Model model){
        return "register";
    }

    @RequestMapping(value = "/${system.path}",method = RequestMethod.POST)
    public String postProcess(Model model){
        return "/register";
    }
}
