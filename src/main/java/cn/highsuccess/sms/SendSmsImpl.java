package cn.highsuccess.sms;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;

import java.io.ByteArrayOutputStream;

/**
 * Created by prototype on 2017/5/4.
 */
public class SendSmsImpl implements SendSms{
    private static final Log logger = LogFactory.getLog(SendSmsImpl.class);
    private String serviceUrl = "http://yxt.bbn.com.cn/eums/rpc/";
    private String account = "test123";	//账号名
    private String passwd = "888888";	//密码
    private static boolean isRegister = false;
    private String loginToken;


    public boolean register() throws Exception {
        JSONObject reqJson = new JSONObject();
        reqJson.put("id", 1);
        reqJson.put("jsonrpc", "2.0");
        reqJson.put("method", "genLoginToken");
        JSONArray params = new JSONArray();
        params.add(account);
        params.add(passwd);
        reqJson.put("params", params);
        String resStr = postJson(serviceUrl + "power/authService", reqJson.toString());
        JSONObject resJson = JSONObject.fromObject(resStr);
        logger.debug(resJson.toString());
        if (resJson.has("result")){
            JSONObject resultJson = resJson.getJSONObject("result");
            isRegister = resultJson.getBoolean("result");
            if (isRegister){
                this.loginToken = resultJson.getString("others");
            }
        }
        return isRegister;
    }

    @Override
    public boolean sendMcode(String mobile, String text) throws Exception {
        register();
        if (isRegister){
            JSONObject smsJson = new JSONObject();
            smsJson.put("businessType", "注册");		//业务类型，用于统计
            smsJson.put("sendText", text);		//短信内容
            smsJson.put("sendTo", "api测试");		//接收人姓名，可以多个，用半角逗号分隔
            smsJson.put("toDetail", mobile);    //收件人手机号
            smsJson.put("sendFrom", "api");

            JSONArray params = new JSONArray();
            params.add(smsJson);

            JSONObject authJson = new JSONObject();
            authJson.put("loginToken", loginToken);

            JSONObject reqJson = new JSONObject();
            reqJson.put("id", 2);
            reqJson.put("jsonrpc", "2.0");
            reqJson.put("method", "save");
            reqJson.put("params", params);
            reqJson.put("auth", authJson);

            String resStr = postJson(serviceUrl + "smsSave", reqJson.toString());
            logger.debug("reqJson: "+reqJson.toString());
            logger.debug("resStr: "+resStr);
            JSONObject resJson = JSONObject.fromObject(resStr);
            JSONObject resultJson = resJson.getJSONObject("result");
            if(resultJson.getBoolean("result")){
                return resultJson.getBoolean("result");
            }
            return false;
        }else {
            return this.register();
        }
    }

    public static String postJson(String url, String jsonStr) throws Exception{
        DefaultHttpClient client = new DefaultHttpClient();
        HttpPost post = new HttpPost(url);
        StringEntity entity = new StringEntity(jsonStr, "utf-8");
        post.setEntity(entity);
        HttpResponse response = client.execute(post);
        int statusCode = response.getStatusLine().getStatusCode();
        HttpEntity  httpEntity = response.getEntity();
        //if (httpEntity != null) {
        //post.abort();
        //}
        if(statusCode == 200){
            ByteArrayOutputStream resHolder = new ByteArrayOutputStream();
            httpEntity.writeTo(resHolder);
            resHolder.flush();
            return resHolder.toString("utf-8");
        }
        else {
            throw new Exception("服务异常");
        }
    }
}
