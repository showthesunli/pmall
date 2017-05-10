package cn.highsuccess.data.serivce;

import cn.highsuccess.config.systemproperties.HisuMngDataIdArgs;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.data.OrderServiceProvider;
import cn.highsuccess.module.BuyerItem;
import cn.highsuccess.module.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * Created by prototype on 2017/5/8.
 */
@Service
public class OrderService implements OrderServiceProvider{
    @Autowired
    private Order order;

    @Autowired
    private JavaDataSet javaDataSet;

    @Autowired
    private JavaOperate javaOperate;

    @Autowired
    @Qualifier("btnGenPhyPrdOrder")
    private HisuMngDataIdArgs hisuMngDataIdArgs;

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public JavaDataSet getJavaDataSet() {
        return javaDataSet;
    }

    public void setJavaDataSet(JavaDataSet javaDataSet) {
        this.javaDataSet = javaDataSet;
    }

    public JavaOperate getJavaOperate() {
        return javaOperate;
    }

    public void setJavaOperate(JavaOperate javaOperate) {
        this.javaOperate = javaOperate;
    }

    @Override
    public void initOrder(Order order) {
        this.getOrder().setItemList(order.getItemList());
        this.getOrder().setAddr(order.getAddr());
        this.getOrder().setMobile(order.getMobile());
        this.getOrder().setReceiverName(order.getReceiverName());
        this.getOrder().setPayToolIDList(order.getPayToolIDList());
    }

    @Override
    public boolean placeOrder() {
        this.getJavaOperate().service("jf_memberCenter", hisuMngDataIdArgs.getId(), this.generateCondition());
        if (this.getJavaOperate().getReturnCode() < 0 ){
            return false;
        }else {
            this.getOrder().setOrderNo(this.getJavaOperate().getResponseData().optString("billNo"));
            return true;
        }
    }

    @Override
    public boolean payOrder() {
        this.getJavaOperate().service("w_mmbCenterPage", "btnGenOrderPaySsn", "billNo=" + this.getOrder().getOrderNo() + "|payer=00000001");
        String paySsn = this.getJavaOperate().getResponseData().optString("paySsn");
        if (this.getJavaOperate().getReturnCode() < 0){
            this.getJavaOperate().service("w_mmbCenterPage","starExprFailPayDeal","payerTransSsn="+paySsn+"|payer=00000001");
            return false;
        }else {
            this.getJavaOperate().service("w_mmbCenterPage","starExprSuccPayDeal","payerTransSsn="+paySsn+"|payer=00000001");
            return true;
        }
    }

    @Override
    public String generateCondition() {
        StringBuilder sb = new StringBuilder();
        sb.append("prdList=");
        for (BuyerItem item:this.getOrder().getItemList()){
            sb.append(item.getPrdNo());
            sb.append("*");
            sb.append(item.getAmount());
            sb.append("+");
        }
        sb.deleteCharAt(sb.length()-1);
        sb.append("|");
        sb.append("receiverName=" + this.getOrder().getReceiverName() + "|");
        sb.append("addr="+this.getOrder().getAddr());
        sb.append("|");
        sb.append("mobile="+this.getOrder().getMobile());
        sb.append("|");
        sb.append("payToolIDList="+this.getOrder().getPayToolIDList());
        return sb.toString();
    }
}
