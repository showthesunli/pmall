package cn.highsuccess.module;

import javax.validation.constraints.NotNull;

/**
 * Created by prototype on 2017/5/15.
 */
public class OrderPaySsn {
    private String paySsn;
    private double totalAmt;
    private String busiPayDate;
    private String busiPayTime;
    @NotNull
    private String orderNo;
    @NotNull
    private String payer;

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getPaySsn() {
        return paySsn;
    }

    public void setPaySsn(String paySsn) {
        this.paySsn = paySsn;
    }

    public double getTotalAmt() {
        return totalAmt;
    }

    public void setTotalAmt(double totalAmt) {
        this.totalAmt = totalAmt;
    }

    public String getBusiPayDate() {
        return busiPayDate;
    }

    public void setBusiPayDate(String busiPayDate) {
        this.busiPayDate = busiPayDate;
    }

    public String getBusiPayTime() {
        return busiPayTime;
    }

    public void setBusiPayTime(String busiPayTime) {
        this.busiPayTime = busiPayTime;
    }

    public String getPayer() {
        return payer;
    }

    public void setPayer(String payer) {
        this.payer = payer;
    }
}
