package cn.highsuccess.module;

import com.alibaba.fastjson.JSON;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by prototype on 2017/5/6.
 * 购物车实体类
 */
public class ShoppingCart {
    //商品总金额
    private double prdMoney;
    //商品总数量
    private int prdSum;

    //卡总金额
    private int cardMoney;

    //商品总金额
    private int cardSum;

    private List<BuyerItem> buyerItemList;

    public void initShoppingCart(String itemsStr) {
        this.buyerItemList = JSON.parseArray(itemsStr, BuyerItem.class);
    }

    public void initShoppingCart() {
        this.buyerItemList = new LinkedList<BuyerItem>();
    }

    public List<BuyerItem> getBuyerItemList() {
        return buyerItemList;
    }
    
    public void setBuyerItemList(List<BuyerItem> buyerItemList){
    	this.buyerItemList = new LinkedList<BuyerItem>();
    	this.buyerItemList.addAll(buyerItemList);
    }

    /**
     * itemType 为0时为实物商品项，为1时为卡项
     *
     * @param itemType
     * @return
     */
    public List<BuyerItem> getBuyerItemList(String itemType) {
        List<BuyerItem> list = new LinkedList<BuyerItem>();
        for (BuyerItem item : this.buyerItemList) {
            if (item.getPrdType().equals(itemType)){
                list.add(item);
            }
        }
        return list;
    }

    public int getCardMoney() {
        return cardMoney;
    }

    public void setCardMoney(int cardMoney) {
        this.cardMoney = cardMoney;
    }

    public int getCardSum() {
        return cardSum;
    }

    public void setCardSum(int cardSum) {
        this.cardSum = cardSum;
    }

    public double getPrdMoney() {
        return this.prdMoney;
    }

    public int getPrdSum() {
        return this.prdSum;
    }

    public void setPrdSum(int prdSum) {
        this.prdSum = prdSum;
    }

    public void setPrdMoney(double prdMoney) {
        this.prdMoney = prdMoney;
    }
}
