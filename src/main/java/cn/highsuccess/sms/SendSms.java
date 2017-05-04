package cn.highsuccess.sms;

/**
 * Created by prototype on 2017/5/4.
 */
public interface SendSms {
    public boolean sendMcode(String mobile,String text) throws Exception;
}
