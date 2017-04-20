package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.config.systemproperties.HisuMngDataIdArgs;
import cn.highsuccess.data.JavaDataSet;
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

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by prototype on 2017/4/20.
 */
@Controller
public class ProductListController extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier(value = "showProductList")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected ProductListController(JavaDataSet jds) {
        super(jds);
    }

    @GetMapping(value = "/pro{matrix}")
    public String showProductList(Model model,@MatrixVariable(required = false) Map<String,String> map) throws JSONException {
        logger.debug(map.get("mrkPrdCateID"));
        logger.debug(map.get("productName"));
        excute(model, map);
        return "/pro";
    }

    protected void excute(Model model,Map<String,String> map) throws JSONException {
        //获取groupID
        Set<String> set = this.hisuMngDataGroupAndId.getDataId().keySet();
        Iterator<String> iterator = set.iterator();
        while (iterator.hasNext()){
            String groupId = iterator.next();
            List<HisuMngDataIdArgs> list = this.hisuMngDataGroupAndId.getDataId().get(groupId);
            if (null != list && list.size()!=0){
                for (int i=0;i<list.size();i++){
                    StringBuffer condition = new StringBuffer();
                    for (int l=0;l<list.get(i).getArgs().size();l++){
                        //组装条件
                        condition.append(list.get(i).getArgs().get(l));
                        condition.append("=");
                        condition.append(map.get(list.get(i).getArgs().get(l)));
                        condition.append("|");
                    }
                    this.getJds().service(groupId, list.get(i).getId(), condition.toString());
                    String retVal = this.getJds().getDataList().toString();
                    if (list.get(i).getId().equals("queryPrdTypeByHeadType")){
                        retVal = parseString(this.getJds().getDataList());
                        logger.debug(retVal);
                    }
                    model.addAttribute(list.get(i).getId(), JSON.parse(retVal));
                }
            }
        }
    }

    public String parseString(JSONArray ja) throws JSONException {
        JSONObject ret = new JSONObject();
        for (int i=0;i<ja.length();i++){
            String parentAttrID = ja.optJSONObject(i).optString("parentAttrID");
            JSONArray tmpArray = ret.optJSONArray(parentAttrID);
            if (null == tmpArray){
                ret.put(parentAttrID,new JSONArray().put(ja.optJSONObject(i)));
            }else {
                tmpArray.put(ja.optJSONObject(i));
            }
        }
        return ret.toString();
    }
}
