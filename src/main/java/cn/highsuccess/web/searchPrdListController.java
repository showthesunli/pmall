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
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

/**
 * Created by showt on 2017/5/14.
 */
@Controller
public class SearchPrdListController extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier("querPrdListByKeyWords")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected SearchPrdListController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "/search{matrix}")
    public String showSearch(Model model,
                             @MatrixVariable(required = false,defaultValue = "1") int currentPage,
                             @MatrixVariable(required = false,defaultValue = "12") int numOfPerPage,
                             @RequestParam Map<String,String> map) throws JSONException {
        Map<String,Object> param = new HashMap<>(map);
        if (param.get("currentPage") == null){
            param.put("currentPage",currentPage);
        }
        if (param.get("numOfPerPage") == null){
            param.put("numOfPerPage",numOfPerPage);
        }
        excute(model, param);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("numOfPerPage",numOfPerPage);
        return "/searchResult";
    }

    protected void excute(Model model,Map<String,Object> map) throws JSONException {
        //��ȡgroupID
        Set<String> set = this.hisuMngDataGroupAndId.getDataId().keySet();
        Iterator<String> iterator = set.iterator();
        while (iterator.hasNext()){
            String groupId = iterator.next();
            List<HisuMngDataIdArgs> list = this.hisuMngDataGroupAndId.getDataId().get(groupId);
            if (null != list && list.size()!=0){
                for (int i=0;i<list.size();i++){
                    StringBuffer condition = new StringBuffer();
                    for (int l=0;l<list.get(i).getArgs().size();l++){
                        //��װ����
                        if (map.get(list.get(i).getArgs().get(l)) == null){
                            continue;
                        }
                        condition.append(list.get(i).getArgs().get(l));
                        condition.append("=");
                        condition.append(map.get(list.get(i).getArgs().get(l)));
                        condition.append("|");
                    }
                    if (condition.length() != 0){
                        condition.deleteCharAt(condition.length()-1);
                    }
                    this.getJds().service(groupId, list.get(i).getId(), condition.toString());
                    //��������
                    String retVal = this.getJds().getDataList().toString();
                    if (list.get(i).getId().equals("queryPrdTypeByHeadType")){
                        retVal = parseString(this.getJds().getDataList());
                    }
                    model.addAttribute(list.get(i).getId(), JSON.parse(retVal));

                    //�������ݼ�¼��
                    int totalRecNum = this.getJds().getRecordCount();
                    model.addAttribute(list.get(i).getId()+"_totalRecNum",totalRecNum);
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
