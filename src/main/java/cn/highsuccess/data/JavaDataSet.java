package cn.highsuccess.data;

import cn.highsuccess.config.systemproperties.HisuMngAttribute;
import cn.highsuccess.config.systemproperties.HisuMngSvr;
import cn.highsuccess.data.BaseConnect;
import cn.highsuccess.transform.HisuTransform;
import cn.highsuccess.web.exception.HisuOperateException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class JavaDataSet extends BaseConnect {
    private String pageID;
    private String pageDataGrpID;
    private String condition;
    private JSONObject JSONResult;

    public JavaDataSet(HisuMngAttribute hmsi, HisuMngSvr hisuMngSvr, HisuTransform htf) {
        super(hmsi, hisuMngSvr, htf);
    }

    /**j
     * @param pageID        页面ID
     * @param pageDataGrpID 数据集ID
     * @return 如果无数据返回就为空
     */
    public JSONObject service(String pageID, String pageDataGrpID, String condition) {
        this.pageID = pageID;
        this.pageDataGrpID = pageDataGrpID;

        JSONObject responsedata = htf.getDataSet(this.getUserDetails().getRemoteAddress(),this.getUserName() , productName, pageID, pageDataGrpID, condition);
        try {
            JSONResult = responsedata.getJSONObject("responseObj");
            String codestr = responsedata.getString("responseCode");
            returnCode = Integer.parseInt(codestr);
            data = responsedata.optJSONObject("responseFileData");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        if (!this.getResult()){
            throw new HisuOperateException(this.getErrMessage());
        }
        return this.data;
    }

    /**
     * 查询结果
     *
     * @return 返回成功或者失败
     */
    public boolean getResult() {
        if (returnCode < 0) return false;
        return true;
    }

    /**
     * 获取操作失败时候返回的错误信息
     *
     * @return
     */
    public String getErrMessage() {
        if (this.returnCode >= 0){
            return "";
        }
        try {
            return JSONResult.getString("错误原因");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 用于无查询条件
     *
     * @param pageID        页面ID
     * @param pageDataGrpID 数据集ID
     * @return 如果无数据返回就为空
     */
    public JSONObject service(String pageID, String pageDataGrpID) {
        return this.data = this.service(pageID,pageDataGrpID,"");
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
