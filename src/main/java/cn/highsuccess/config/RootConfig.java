package cn.highsuccess.config;

import cn.highsuccess.config.systemproperties.HisuMngSvr;
import cn.highsuccess.data.UserRepository;
import cn.highsuccess.data.impl.JavaDataSet;
import cn.highsuccess.data.impl.UserRepositoryImpl;
import cn.highsuccess.transform.HisuTransform;
import cn.highsuccess.transform.impl.HisuTransformImpl;
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
    public PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer(){
        return new PropertySourcesPlaceholderConfigurer();
    }

    /**
     * 通信类实例
     * @param hisuMngSvr
     * @return
     */
    @Bean
    public HisuTransform hisuTransform(HisuMngSvr hisuMngSvr){
        return new HisuTransformImpl(hisuMngSvr.getIp(),hisuMngSvr.getProt());
    }

    /**
     * 数据获取类实例，包含数据操作方法
     * 实例生命周期为request,需要被代理注入controller
     * @return
     */
    @Bean
    @Scope(value = WebApplicationContext.SCOPE_REQUEST,proxyMode = ScopedProxyMode.TARGET_CLASS)
    public JavaDataSet javaDataSet(){
        return new JavaDataSet();
    }

    /**
     * 用户操作类
     * @return
     */
    @Bean
    public UserRepository userRepository(){
        return new UserRepositoryImpl();
    }

}
