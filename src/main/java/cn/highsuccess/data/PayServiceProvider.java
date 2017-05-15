package cn.highsuccess.data;

/**
 * Created by prototype on 2017/5/15.
 */
public interface PayServiceProvider {

    //从后台获取支付流水前初始化paySsn类
    public void perPayInitPaySsn(String orderNo,String payer);

    //通知后台支付结果之前初始化paySsn类
    public void perNoticInitPaySsn(String paySsn,String payer);

    public boolean payOrder();

    public void noticeOrder(boolean flag);
}
