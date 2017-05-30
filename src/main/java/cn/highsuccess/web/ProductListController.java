package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.config.systemproperties.HisuMngDataIdArgs;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import com.alibaba.fastjson.JSON;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.MatrixVariable;

import java.util.*;

/**
 * Created by prototype on 2017/4/20.
 */
@Controller
public class ProductListController extends HisuBaseControllerAdapter {
    @Autowired
    @Qualifier(value = "showProductList")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected ProductListController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @GetMapping(value = "/pro{matrix}")
    public String showProductList(Model model,
                                  @MatrixVariable(required = false, defaultValue = "1") int currentPage,
                                  @MatrixVariable(required = false, defaultValue = "12") int numOfPerPage,
                                  @MatrixVariable(required = false) String companyName,
                                  @MatrixVariable(required = false) String productName,
                                  @MatrixVariable(required = false) String mrkPrdCateID,
                                  @MatrixVariable(required = false) String attrValue,
                                  @MatrixVariable(required = false) String entPrdSrlNo,
                                  @MatrixVariable(required = false) String realDataGroupId) throws JSONException {
        Map<String, Object> param = new HashMap<>();
        param.put("currentPage", currentPage);
        param.put("numOfPerPage", numOfPerPage);
        if (realDataGroupId != null){
            param.put("REALEDATAGROUPID",realDataGroupId);
        }
        if (companyName != null){
            param.put("companyName",companyName);
        }
        if (productName != null){
            param.put("productName",productName);
        }
        if (mrkPrdCateID != null){
            param.put("mrkPrdCateID",mrkPrdCateID);
        }
        if (attrValue != null){
            param.put("attrValue",attrValue);
        }
        if (entPrdSrlNo != null){
            param.put("entPrdSrlNo",entPrdSrlNo);
        }
        excutePro(model, param, hisuMngDataGroupAndId);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("numOfPerPage", numOfPerPage);
        return "/pro";
    }

    protected void excutePro(Model model, Map<String, Object> map, HisuMngDataGroupAndId hisuMngDataGroupAndId) throws JSONException {
        //获取groupID
        Set<String> set = hisuMngDataGroupAndId.getDataId().keySet();
        Iterator<String> iterator = set.iterator();
        while (iterator.hasNext()) {
            String groupId = iterator.next();
            List<HisuMngDataIdArgs> list = hisuMngDataGroupAndId.getDataId().get(groupId);
            if (null != list && list.size() != 0) {
                for (int i = 0; i < list.size(); i++) {
                    StringBuffer condition = new StringBuffer();
                    for (int l = 0; l < list.get(i).getArgs().size(); l++) {
                        //组装条件
                        if (map.get(list.get(i).getArgs().get(l)) == null) {
                            continue;
                        }
                        condition.append(list.get(i).getArgs().get(l));
                        condition.append("=");
                        condition.append(map.get(list.get(i).getArgs().get(l)));
                        condition.append("|");
                    }
                    this.getJds().service(groupId, list.get(i).getId(), condition.toString());
                    //返回数据
                    String retVal = this.getJds().getDataList().toString();
                    if (list.get(i).getId().equals("queryPrdTypeByHeadType")) {
                        retVal = parseString(this.getJds().getDataList());
                    }
                    model.addAttribute(list.get(i).getId(), JSON.parse(retVal));

                    //返回数据记录数
                    int totalRecNum = this.getJds().getRecordCount();
                    model.addAttribute(list.get(i).getId() + "_totalRecNum", totalRecNum);
                }
            }
        }
    }

    public String parseString(JSONArray ja) throws JSONException {
        JSONObject ret = new JSONObject();
        for (int i = 0; i < ja.length(); i++) {
            String parentAttrID = ja.optJSONObject(i).optString("parentAttrID");
            JSONArray tmpArray = ret.optJSONArray(parentAttrID);
            if (null == tmpArray) {
                ret.put(parentAttrID, new JSONArray().put(ja.optJSONObject(i)));
            } else {
                tmpArray.put(ja.optJSONObject(i));
            }
        }
        return ret.toString();
    }
}
