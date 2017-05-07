package cn.highsuccess.data;

import cn.highsuccess.module.Order;

/**
 * Created by showt on 2017/5/8.
 */
public interface OrderServiceProvider {

    public boolean initOrder(Order order);

    //�µ�
    public boolean placeOrder();

    //����֧��
    public void payOrder();
}
