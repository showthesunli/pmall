package cn.highsuccess.module;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

/**
 * Created by prototype on 2017/5/6.
 * 购物项
 */
public class BuyerItem {
    //产品编号
    private String prdNo;

    //产品名称
    private String prdName;

    //产品数量
    private int amount;

    //产品单价
    private double money;

    //商品分类，区分卡和商品,分别下单,卡为1
    private String prdType;

    //产品图片
    private String fileName;

    public BuyerItem(){}

    public BuyerItem(String prdNo,double money){
        this(prdNo,money, 1);
    }

    public BuyerItem(String prdNo,double money,int amount){
        this.prdNo = prdNo;
        this.money = money;
        this.amount = amount;
    }

    public String getPrdType() {
        return prdType;
    }

    public void setPrdType(String prdType) {
        this.prdType = prdType;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public void setPrdNo(String prdNo) {
        this.prdNo = prdNo;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getPrdName() {
        return prdName;
    }

    public void setPrdName(String prdName) {
        this.prdName = prdName;
    }

    public String getPrdNo() {
        return prdNo;
    }

    public double getMoney() {
        return money;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public boolean equals(Object that){
        return EqualsBuilder.reflectionEquals(this,that,"amount","money","prdName","fileName","prdType");
    }

    public int hashCode(){
        return HashCodeBuilder.reflectionHashCode(this,"amount","money","prdName","fileName","prdType");
    }
}
