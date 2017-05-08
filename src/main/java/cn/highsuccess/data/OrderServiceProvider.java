package cn.highsuccess.data;

import cn.highsuccess.module.Order;

/**
 * Created by showt on 2017/5/8.
 */
public interface OrderServiceProvider {

    public void initOrder(Order order);

    public boolean placeOrder();

    public void payOrder();

    public String generateCondition();

}
