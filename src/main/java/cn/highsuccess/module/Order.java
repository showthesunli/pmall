package cn.highsuccess.module;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * Created by showt on 2017/5/8.
 */
public class Order {

    //订单编号
    private String orderNo;

    //订单商品条目
    private List<BuyerItem> itemList;

    //订单下单时间
    private String orderTime;

    //订单状态
    private String orderStatus;

    //订单总金额
    private double orderMoney;

    //订单商品总数
    private int orderPrdNum;

    //收件人姓名
    @NotNull
    private String receiverName;

    //收件人地址
    @NotNull
    private String addr;

    //联系电话
    @NotNull
    private String mobile;

    //支付工具
    @NotNull
    private String payToolIDList;

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public List<BuyerItem> getItemList() {
        return itemList;
    }

    public void setItemList(List<BuyerItem> itemList) {
        this.itemList = itemList;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public double getOrderMoney() {
        return orderMoney;
    }

    public void setOrderMoney(double orderMoney) {
        this.orderMoney = orderMoney;
    }

    public int getOrderPrdNum() {
        return orderPrdNum;
    }

    public void setOrderPrdNum(int orderPrdNum) {
        this.orderPrdNum = orderPrdNum;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPayToolIDList() {
        return payToolIDList;
    }

    public void setPayToolIDList(String payToolIDList) {
        this.payToolIDList = payToolIDList;
    }
}
