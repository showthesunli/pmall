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

    public BuyerItem(){}

    public BuyerItem(String prdNo,double money){
        this(prdNo,money, 1);
    }

    public BuyerItem(String prdNo,double money,int amount){
        this.prdNo = prdNo;
        this.money = money;
        this.amount = amount;
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
        return EqualsBuilder.reflectionEquals(this,that,"amount","money","prdName");
    }

    public int hashCode(){
        return HashCodeBuilder.reflectionHashCode(this,"amount","money","prdName");
    }
}
