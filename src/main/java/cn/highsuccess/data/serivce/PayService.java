package cn.highsuccess.data.serivce;

import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.data.PayServiceProvider;
import cn.highsuccess.module.Order;
import cn.highsuccess.module.OrderPaySsn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by prototype on 2017/5/15.
 */
@Service
public class PayService implements PayServiceProvider {

    @Autowired
    private OrderPaySsn orderPaySsn;

    @Autowired
    private JavaDataSet javaDataSet;

    @Autowired
    private JavaOperate javaOperate;


    public JavaDataSet getJavaDataSet() {
        return javaDataSet;
    }

    public void setJavaDataSet(JavaDataSet javaDataSet) {
        this.javaDataSet = javaDataSet;
    }

    public JavaOperate getJavaOperate() {
        return javaOperate;
    }

    public void setJavaOperate(JavaOperate javaOperate) {
        this.javaOperate = javaOperate;
    }


    public OrderPaySsn getOrderPaySsn() {
        return orderPaySsn;
    }

    public void setOrderPaySsn(OrderPaySsn orderPaySsn) {
        this.orderPaySsn = orderPaySsn;
    }

    @Override
    public void perPayInitPaySsn(String orderNo,String payer) {
        this.getOrderPaySsn().setOrderNo(orderNo);
        this.getOrderPaySsn().setPayer(payer);
        this.getJavaOperate().service("w_mmbCenterPage", "btnGenOrderPaySsn", "billNo=" + this.getOrderPaySsn().getOrderNo() + "|payer=" + this.getOrderPaySsn().getPayer());
        if (this.getJavaOperate().getResult()){
            this.getOrderPaySsn().setBusiPayDate(this.getJavaOperate().getResponseData().optString("busiPayDate"));
            this.getOrderPaySsn().setBusiPayTime(this.getJavaOperate().getResponseData().optString("busiPayTime"));
            this.getOrderPaySsn().setTotalAmt(this.getJavaOperate().getResponseData().optDouble("totalAmt"));
            this.getOrderPaySsn().setPaySsn(this.getJavaOperate().getResponseData().optString("paySsn"));
        }
    }

    @Override
    public void perNoticInitPaySsn(String paySsn,String payer) {
        this.getOrderPaySsn().setPaySsn(paySsn);
        this.getOrderPaySsn().setPayer(payer);
    }

    @Override
    public boolean payOrder() {
        return false;
    }

    @Override
    public void noticeOrder(boolean flag) {
        if (flag){
            this.getJavaOperate().service("w_mmbCenterPage","starExprSuccPayDeal","payerTransSsn="+this.getOrderPaySsn().getPaySsn()+"|payer="+this.getOrderPaySsn().getPayer());
        }else {
            this.getJavaOperate().service("w_mmbCenterPage","starExprFailPayDeal","payerTransSsn="+this.getOrderPaySsn().getPaySsn()+"|payer="+this.getOrderPaySsn().getPayer());
        }
    }
}
