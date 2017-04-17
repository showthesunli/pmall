package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
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

    @GetMapping(value = "/{path}/**action")
    public String processGet(@PathVariable String path,
                             Model model,
                             @RequestParam(required = false) Object numPage,
                             @RequestParam(required = false) Object currentPage){
        logger.info("path :"+path);
        logger.info("numPage :"+numPage);
        logger.info("currentPage :" + currentPage);

        return path;
    }

}
