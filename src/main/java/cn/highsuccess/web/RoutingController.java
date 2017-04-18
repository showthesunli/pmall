package cn.highsuccess.web;

import cn.highsuccess.data.JavaDataSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by prototype on 2017/4/17.
 */
@Controller
public class RoutingController extends HisuBaseControllerAdapter{

    @Autowired
    protected RoutingController(JavaDataSet jds) {
        super(jds);
    }

    @GetMapping(value = "/{path}/**?numPage=*&currentPage=*")
    public String processGetWithParam(@PathVariable String path,
                             Model model,
                             @RequestParam(required = true) int numPage,
                             @RequestParam(required = true) int currentPage){
        logger.debug("path :" + path);
        logger.debug("numPage :"+numPage);
        logger.debug("currentPage :" + currentPage);
        if (null == path || path.equals("")) return "index";
        return path;
    }

    @GetMapping(value = "/{path}")
    public String processGetWithNoParam(@PathVariable String path,
                                        Model model){
        logger.debug("processGetWithNoParam path: "+path);
        return path;
    }

    @GetMapping("/")
    public String index(Model model){
        logger.debug("/ path: index");
        return processGetWithNoParam("index",model);
    }

}
