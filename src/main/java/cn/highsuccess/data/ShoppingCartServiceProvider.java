package cn.highsuccess.data;

import cn.highsuccess.module.BuyerItem;

/**
 * Created by prototype on 2017/5/6.
 */
public interface ShoppingCartServiceProvider {

    //向购物车中添加商品
    public void addProduct(BuyerItem buyerItem);

    //从购物车中删除商品
    public boolean delProduct(BuyerItem buyerItem);

    //计算购物车商品总额
    public double countProMoney();

    //计算购物车商品总数
    public int countProNum();

    //计算购物车卡总额
    public double countCardMoney();

    //计算购物车卡总数
    public int countCardNum();

    //删除购物车中所有内容
    public boolean delAllFromShoppingCart();
}
