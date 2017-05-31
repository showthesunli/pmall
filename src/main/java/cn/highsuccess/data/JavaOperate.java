package cn.highsuccess.data;

import cn.highsuccess.config.systemproperties.HisuMngAttribute;
import cn.highsuccess.config.systemproperties.HisuMngSvr;
import cn.highsuccess.transform.HisuTransform;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by prototype on 2017/5/4.
 */
public class JavaOperate extends BaseConnect{
    private String pageID;
    private String pageButtonID;
    private String condition;
    private JSONObject JSONResult;

    public JavaOperate(HisuMngAttribute hmsi, HisuMngSvr hisuMngSvr, HisuTransform htf) {
        super(hmsi, hisuMngSvr, htf);
    }

    /**
     * @param pageID       页面ID
     * @param pageButtonID 操作ID
     * @param condition    执行操作的条件
     * @return 返回错误信息json
     */
    public JSONObject service(String pageID, String pageButtonID, String condition) {
        this.pageID = pageID;
        this.pageButtonID = pageButtonID;
        this.condition = condition;
        returnCode = -1;
        JSONObject obj = htf.buttonOpreate(this.getUserDetails().getRemoteAddress(), this.getUserName(), productName, pageID, pageButtonID, condition);
        try {
            JSONResult = obj.getJSONObject("responseObj");
            String codestr = obj.getString("responseCode");
            returnCode = Integer.parseInt(codestr);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return JSONResult;
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
     * 如果后台有数据返回，可以在这里获取
     *
     * @return
     */
    public JSONObject getResponseData() {
        return JSONResult;
    }
}
