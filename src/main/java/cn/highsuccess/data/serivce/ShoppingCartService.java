package cn.highsuccess.data.serivce;

import cn.highsuccess.data.ShoppingCartServiceProvider;
import cn.highsuccess.module.BuyerItem;
import cn.highsuccess.module.ShoppingCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Iterator;

/**
 * Created by prototype on 2017/5/6.
 */
@Service
public class ShoppingCartService implements ShoppingCartServiceProvider {
    @Autowired
    private ShoppingCart shoppingCart;

    public ShoppingCart getShoppingCart() {
        return shoppingCart;
    }

    public void setShoppingCart(ShoppingCart shoppingCart) {
        this.shoppingCart = shoppingCart;
    }

    @Override
    public void addProduct(BuyerItem buyerItem) {
        if (shoppingCart.getBuyerItemList().contains(buyerItem)){
            for (BuyerItem item : shoppingCart.getBuyerItemList()){
                if (item.equals(buyerItem)){
                    item.setAmount(item.getAmount()+buyerItem.getAmount());
                }
            }
        }else {
            shoppingCart.getBuyerItemList().add(buyerItem);
        }
    }

    @Override
    public boolean delProduct(BuyerItem buyerItem) {
        Iterator<BuyerItem> it = shoppingCart.getBuyerItemList().iterator();
        while (it.hasNext()){
            BuyerItem item = it.next();
            if (item.equals(buyerItem)){
                int amount = item.getAmount() - buyerItem.getAmount();
                if (amount <= 0){
                    it.remove();
                }else {
                    item.setAmount(amount);
                }
            }
        }
        return false;
    }

    @Override
    public double countProMoney() {
        double money = 0;
        for (BuyerItem item : shoppingCart.getBuyerItemList()){
            //类型为1的产品条目是卡
            if (!item.getPrdType().equals("1")){
                money = money + item.getMoney()*item.getAmount();
            }
        }
        shoppingCart.setPrdMoney(money);
        return shoppingCart.getPrdMoney();
    }

    @Override
    public int countProNum() {
        int prdNum = 0;
        for (BuyerItem item : shoppingCart.getBuyerItemList()){
            //类型为0的产品条目是商品
            if (item.getPrdType().equals("0")) {
                prdNum = prdNum + item.getAmount();
            }
        }
        shoppingCart.setPrdSum(prdNum);
        return shoppingCart.getPrdSum();
    }

    @Override
    public double countCardMoney() {
        double money = 0;
        for (BuyerItem item : shoppingCart.getBuyerItemList()){
            //类型不为0的产品条目是卡
            if (!item.getPrdType().equals("0")){
                money = money + item.getMoney()*item.getAmount();
            }
        }
        shoppingCart.setPrdMoney(money);
        return shoppingCart.getPrdMoney();
    }

    @Override
    public int countCardNum() {
        int prdNum = 0;
        for (BuyerItem item : shoppingCart.getBuyerItemList()){
            //类型不为0的产品条目是卡
            if (!item.getPrdType().equals("0")) {
                prdNum = prdNum + item.getAmount();
            }
        }
        shoppingCart.setPrdSum(prdNum);
        return shoppingCart.getPrdSum();
    }

    @Override
    public boolean delAllFromShoppingCart() {
        shoppingCart.getBuyerItemList().clear();
        return true;
    }

}
