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

    private List<BuyerItem> buyerItemList;

    public void initShoppingCart(String itemsStr){
        this.buyerItemList = JSON.parseArray(itemsStr, BuyerItem.class );
    }

    public void initShoppingCart(){
        this.buyerItemList = new ArrayList<BuyerItem>();
    }

    public List<BuyerItem> getBuyerItemList() {
        return buyerItemList;
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
