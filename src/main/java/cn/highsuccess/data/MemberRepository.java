package cn.highsuccess.data;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Created by prototype on 2017/3/29.
 */
public interface MemberRepository {

    /**
     * 获取当前用户信息
     * @return
     */
    public JSONObject getCurrentUserInfo();

    /**
     * 获取当前用户的订单列表
     * @return
     */
    public JSONArray getOrderListFromCurrentUser();
}
