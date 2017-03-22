package cn.highsuccess.data.impl;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.http.HttpSession;

public class JavaDataSet extends BaseConnect {
    private String pageID;
    private String pageDataGrpID;
    private String condition;

    public JavaDataSet(HttpSession session) {
        super(session);
        // TODO Auto-generated constructor stub
    }

    /**j
     * @param pageID        页面ID
     * @param pageDataGrpID 数据集ID
     * @return 如果无数据返回就为空
     */
    public JSONObject service(String pageID, String pageDataGrpID, String condition) {

        this.pageID = pageID;
        this.pageDataGrpID = pageDataGrpID;
        this.condition = condition;
        JSONObject responsedata = htf.getDataSet(user.getCliIpAddr(), user.getId(), productName, pageID, pageDataGrpID, condition);
        data = responsedata;
        return responsedata;
    }

    /**
     * 用于无查询条件
     *
     * @param pageID        页面ID
     * @param pageDataGrpID 数据集ID
     * @return 如果无数据返回就为空
     */
    public JSONObject service(String pageID, String pageDataGrpID) {
        this.pageID = pageID;
        this.pageDataGrpID = pageDataGrpID;
        JSONObject responsedata = htf.getDataSet(user.getCliIpAddr(), user.getId(), productName, pageID, pageDataGrpID, "");
        data = responsedata;
        return responsedata;
    }

    /**
     * @return 返回数据列表
     */
    public JSONArray getDataList() {
        if (data == null) return new JSONArray();
        JSONArray arr = null;
        try {
            arr = data.getJSONArray(pageDataGrpID);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        if (arr == null) arr = new JSONArray();
        return arr;
    }

    /**
     * 用于一次性获取多个数据集的情况，从多个数据集中取某个数据列表
     *
     * @param dataGrpID 数据集ID
     * @return 返回数据列表
     */
    public JSONArray getDataList(String dataGrpID) {
        if (data == null) return new JSONArray();
        JSONArray arr = null;
        try {
            arr = data.getJSONArray(dataGrpID);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        if (arr == null) arr = new JSONArray();
        return arr;
    }

    /**
     * @return 返回总记录条数
     */
    public int getRecordCount() {
        if (data == null) return 0;
        int count = 0;
        try {
            JSONArray arr = data.getJSONArray(pageDataGrpID + "_totalRecNum");
            JSONObject obj = arr.getJSONObject(0);
            count = obj.getInt("TOTALRECNUM");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return count;
    }
}
