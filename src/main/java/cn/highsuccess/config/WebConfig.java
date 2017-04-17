package cn.highsuccess.config;

import cn.highsuccess.config.systemproperties.HisuMngAttribute;
import cn.highsuccess.config.systemproperties.HisuMngSvr;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.transform.HisuTransform;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.*;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;


/**
 * Created by prototype on 2017/3/17.
 */

@Configuration
@EnableWebMvc
//@ComponentScan("cn.highsuccess.web")
@ImportResource("classpath:/dataGroupResources/HisuMngDataGroup.xml")
public class WebConfig extends WebMvcConfigurerAdapter{


//    @Bean(name = "viewReslover")
    @Bean
    public FreeMarkerViewResolver freeMarkerViewResolver(){
        FreeMarkerViewResolver freeMarkerViewResolver = new FreeMarkerViewResolver();
        freeMarkerViewResolver.setPrefix("");
        freeMarkerViewResolver.setSuffix(".ftl");
        freeMarkerViewResolver.setContentType("text/html;");
        freeMarkerViewResolver.setCache(false);
        return freeMarkerViewResolver;
    }

//    @Bean(name = "freemarkerConfig")
    @Bean
    public FreeMarkerConfigurer freeMarkerConfigurer(){
        FreeMarkerConfigurer freeMarkerConfigurer = new FreeMarkerConfigurer();
        freeMarkerConfigurer.setTemplateLoaderPath("/WEB-INF/pages");
        freeMarkerConfigurer.setDefaultEncoding("UTF-8");
        return freeMarkerConfigurer;
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer){
        configurer.enable();
    }

}
