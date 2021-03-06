package cn.highsuccess.config;

import cn.highsuccess.config.systemproperties.HisuMngAttribute;
import cn.highsuccess.config.systemproperties.HisuMngSvr;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.module.*;
import cn.highsuccess.sms.SendSms;
import cn.highsuccess.sms.SendSmsImpl;
import cn.highsuccess.transform.HisuTransform;
import cn.highsuccess.transform.impl.HisuTransformImpl;
import cn.highsuccess.transform.impl.HisuTransformImplUpdate;
import org.springframework.context.annotation.*;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 * Created by prototype on 2017/3/17.
 */
@Configuration
@ComponentScan(basePackages = {"cn.highsuccess"},excludeFilters = {@ComponentScan.Filter(type= FilterType.ANNOTATION,value= EnableWebMvc.class)})
public class RootConfig {


    /**
     * 加载并调用Enviroment所需要的bean
     * @return
     */
    @Bean
    public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer(){
        return new PropertySourcesPlaceholderConfigurer();
    }

    /**
     * 通信类实例
     * @param hisuMngSvr
     * @return
     */
    @Bean
    public HisuTransform hisuTransform(HisuMngSvr hisuMngSvr){
//        return new HisuTransformImpl(hisuMngSvr.getIp(),hisuMngSvr.getProt());
        return new HisuTransformImplUpdate(hisuMngSvr.getIp(),hisuMngSvr.getProt());
    }

    /**
     * 数据获取类实例，包含数据操作方法
     * 实例生命周期为request,需要被代理注入controller
     * @return
     */
    @Bean
    @Scope(value = WebApplicationContext.SCOPE_REQUEST,proxyMode = ScopedProxyMode.TARGET_CLASS)
    public JavaDataSet javaDataSet(HisuMngAttribute hmsi,HisuMngSvr hisuMngSvr,HisuTransform hisuTransform){
        return new JavaDataSet(hmsi,hisuMngSvr,hisuTransform);
    }

    /**
     * 操作按钮类实例，包含数据操作方法
     * 实例生命周期为request,需要被代理注入controller
     * @return
     */
    @Bean
    @Scope(value = WebApplicationContext.SCOPE_REQUEST,proxyMode = ScopedProxyMode.TARGET_CLASS)
    public JavaOperate javaOperate(HisuMngAttribute hisuMngAttribute,HisuMngSvr hisuMngSvr,HisuTransform hisuTransform){
        return new JavaOperate(hisuMngAttribute,hisuMngSvr,hisuTransform);
    }

    @Bean
    public SendSms sendSms(){
        return new SendSmsImpl();
    }

    @Bean
    @Scope(value = WebApplicationContext.SCOPE_SESSION,proxyMode = ScopedProxyMode.TARGET_CLASS)
    public ShoppingCart shoppingCart(){
        return new ShoppingCart();
    }

    @Bean
    @Scope(value = WebApplicationContext.SCOPE_SESSION,proxyMode = ScopedProxyMode.TARGET_CLASS)
    public Order getOrder(){
        return new Order();
    }

    @Bean
    @Scope(value = WebApplicationContext.SCOPE_REQUEST,proxyMode = ScopedProxyMode.TARGET_CLASS)
    public OrderPaySsn getOrderPaySsn(){
        return new OrderPaySsn();
    }

    @Bean
    @Scope(value = WebApplicationContext.SCOPE_SESSION,proxyMode = ScopedProxyMode.TARGET_CLASS)
    public Param getParam(){
        return new Param();
    }
}
