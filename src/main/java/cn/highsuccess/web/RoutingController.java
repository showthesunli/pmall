package cn.highsuccess.web;

import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.transform.HisuTransform;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by prototype on 2017/4/17.
 */
@Controller
public class RoutingController extends HisuBaseControllerAdapter{
    @Autowired
    private HisuTransform htf;

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


    @ResponseBody
    @GetMapping("/ajaxGetimg")
    public String getImg(String dataGrpJson,HttpServletRequest request) throws JSONException {
        logger.debug("/ajaxGetimg");
        String path=request.getSession().getServletContext().getRealPath("/imgsrc/");
        logger.debug("path :"+path);
        JSONObject jo = new JSONObject(dataGrpJson);
        String fileName = jo.optString("fileName");
        boolean flag = this.htf.downloadImages(this.getJds().getUserDetails().getRemoteAddress(), this.getJds().getUserName(), path, fileName);
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("retCode", flag ? 1 : 0);
        jsonResponse.put("responseRemark", "");
        return jsonResponse.toString();
    }
}
