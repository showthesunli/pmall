package cn.highsuccess.data.impl;

import cn.highsuccess.data.ShoppingCartServiceProvider;
import cn.highsuccess.module.BuyerItem;
import cn.highsuccess.module.ShoppingCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        if (shoppingCart.getBuyerItemList().contains(buyerItem)){
            for (BuyerItem item : shoppingCart.getBuyerItemList()){
                if (item.equals(buyerItem)){
                    int amount = item.getAmount() - buyerItem.getAmount();
                    if (amount <= 0){
                        shoppingCart.getBuyerItemList().remove(item);
                    }else {
                        item.setAmount(amount);
                    }
                }
            }
        }
        return false;
    }

    @Override
    public double countProMoney() {
        double money = 0;
        for (BuyerItem item : shoppingCart.getBuyerItemList()){
            money = money + item.getMoney()*item.getAmount();
        }
        shoppingCart.setPrdMoney(money);
        return shoppingCart.getPrdMoney();
    }

    @Override
    public int countProNum() {
        int prdNum = 0;
        for (BuyerItem item : shoppingCart.getBuyerItemList()){
            prdNum = prdNum + item.getAmount();
        }
        shoppingCart.setPrdSum(prdNum);
        return shoppingCart.getPrdSum();
    }

    @Override
    public boolean placeOrder() {
        return false;
    }
}
