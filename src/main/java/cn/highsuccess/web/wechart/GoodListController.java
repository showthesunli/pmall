package cn.highsuccess.web.wechart;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.web.HisuBaseControllerAdapter;
import com.alibaba.fastjson.JSON;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by prototype on 2017/5/29.
 */
@Controller
public class GoodListController extends HisuBaseControllerAdapter {

    @Autowired
    @Qualifier("goodList")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected GoodListController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "/goodList{matrix}" ,method = RequestMethod.GET)
    public String showGoodList(Model model,
                               @MatrixVariable(required = false, defaultValue = "1") int currentPage,
                               @MatrixVariable(required = false, defaultValue = "12") int numOfPerPage,
                               @MatrixVariable(required = false) String companyName,
                               @MatrixVariable(required = false) String productName,
                               @MatrixVariable(required = false) String mrkPrdCateID,
                               @MatrixVariable(required = false) String attrValue,
                               @MatrixVariable(required = false) String entPrdSrlNo,
                               @MatrixVariable(required = true) String realDataGroupId) throws JSONException {
        Map<String, Object> param = new HashMap<>();
        param.put("currentPage", currentPage);
        param.put("numOfPerPage", numOfPerPage);
        param.put("REALEDATAGROUPID", realDataGroupId);
        if (companyName != null) {
            param.put("companyName", companyName);
        }
        if (productName != null) {
            param.put("productName", productName);
        }
        if (mrkPrdCateID != null) {
            param.put("mrkPrdCateID", mrkPrdCateID);
        }
        if (attrValue != null) {
            param.put("attrValue", attrValue);
        }
        if (entPrdSrlNo != null) {
            param.put("entPrdSrlNo", entPrdSrlNo);
        }
        excute(model, param, hisuMngDataGroupAndId);
        return "/goodList";
    }

    @RequestMapping(value = "/goodsList{matrix}",method = RequestMethod.GET,produces = "application/json;charset=UTF-8;")
    @ResponseBody
    public String goodsListForJson(Model model,
                                   @MatrixVariable(required = false, defaultValue = "1") int currentPage,
                                   @MatrixVariable(required = false, defaultValue = "12") int numOfPerPage,
                                   @MatrixVariable(required = false) String companyName,
                                   @MatrixVariable(required = false) String productName,
                                   @MatrixVariable(required = false) String mrkPrdCateID,
                                   @MatrixVariable(required = false) String attrValue,
                                   @MatrixVariable(required = false) String entPrdSrlNo,
                                   @MatrixVariable(required = true) String realDataGroupId) throws JSONException {
        Map<String, Object> param = new HashMap<>();
        param.put("currentPage", currentPage);
        param.put("numOfPerPage", numOfPerPage);
        param.put("REALEDATAGROUPID", realDataGroupId);
        if (companyName != null) {
            param.put("companyName", companyName);
        }
        if (productName != null) {
            param.put("productName", productName);
        }
        if (mrkPrdCateID != null) {
            param.put("mrkPrdCateID", mrkPrdCateID);
        }
        if (attrValue != null) {
            param.put("attrValue", attrValue);
        }
        if (entPrdSrlNo != null) {
            param.put("entPrdSrlNo", entPrdSrlNo);
        }
        excute(model, param, hisuMngDataGroupAndId);
        return JSON.toJSONString(model.asMap());
    }
}
