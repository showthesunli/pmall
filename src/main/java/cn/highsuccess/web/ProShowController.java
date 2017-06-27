package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngAttribute;
import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.transform.HisuTransform;
import com.jayway.jsonpath.JsonPath;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.MatrixVariable;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * Created by prototype on 2017/4/26.
 */
@Controller
public class ProShowController extends HisuBaseControllerAdapter {
    @Autowired
    @Qualifier(value = "showProdetail")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    private HisuMngAttribute hisuMngAttribute;

    @Autowired
    private HisuTransform hisuTransform;

    @Autowired
    protected ProShowController(JavaDataSet jds,JavaOperate javaOperate) {
        super(jds,javaOperate);
    }

    @GetMapping(value = "/proshow{matrix}")
    public String proDetailShow(Model model,@MatrixVariable Map<String,Object> map,HttpServletRequest request){
    	excute(model, map, hisuMngDataGroupAndId);
        parseFile(model.asMap().get("queryPrdDetail"),"$[*].fileName",request);
        return "/proshow";
    }

    public void parseFile(Object jo,String path,HttpServletRequest request){
        logger.debug("jsonPath: " + path);
        List<String> fileNames = JsonPath.parse(jo).read(path);
        String filePath=request.getSession().getServletContext().getRealPath("/htmlsrc/");
        logger.debug("filePath: " + filePath);

        for (String fileName : fileNames){
            File file = new File(filePath + "/" + fileName);
            if ("true".equals(hisuMngAttribute.getEXIST_FILE_DOWNLOAD()) || !file.exists()) {
                hisuTransform.downloadImages(this.getJds().getUserName(), this.getJds().getUserDetails().getRemoteAddress(), filePath, fileName);
            }
        }
    }
}
