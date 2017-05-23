package cn.highsuccess.config;

import org.springframework.context.annotation.*;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;


/**
 * Created by prototype on 2017/3/17.
 */

@Configuration
@ComponentScan("cn.highsuccess.web")
@ImportResource({"classpath:/dataGroupResources/HisuMngDataGroupAndId.xml","classpath:/dataGroupResources/HisuMngOperGroupAndId.xml"})
public class WebConfig extends DelegatingWebMvcConfiguration {


//    @Bean(name = "viewReslover")
    @Bean
    public FreeMarkerViewResolver freeMarkerViewResolver(){
        FreeMarkerViewResolver freeMarkerViewResolver = new FreeMarkerViewResolver();
        freeMarkerViewResolver.setPrefix("");
        freeMarkerViewResolver.setSuffix(".ftl");
        freeMarkerViewResolver.setContentType("text/html;");
        freeMarkerViewResolver.setCache(false);
//        freeMarkerViewResolver.setCache(true);
        return freeMarkerViewResolver;
    }

//    @Bean(name = "freemarkerConfig")
    @Bean
    @Profile("pmall")
    public FreeMarkerConfigurer freeMarkerConfigurer(){
        FreeMarkerConfigurer freeMarkerConfigurer = new FreeMarkerConfigurer();
        freeMarkerConfigurer.setTemplateLoaderPaths("/WEB-INF/pages", "/htmlsrc");
        freeMarkerConfigurer.setDefaultEncoding("UTF-8");
//        freeMarkerConfigurer.getConfiguration().setURLEscapingCharset("UTF-8");
        return freeMarkerConfigurer;
    }

    @Bean
    @Profile("wechart")
    public FreeMarkerConfigurer wechartFreeMarkerConfigurer(){
        FreeMarkerConfigurer freeMarkerConfigurer = new FreeMarkerConfigurer();
        freeMarkerConfigurer.setTemplateLoaderPaths("/WEB-INF/wechartPages", "/htmlsrc");
        freeMarkerConfigurer.setDefaultEncoding("UTF-8");
//        freeMarkerConfigurer.getConfiguration().setURLEscapingCharset("UTF-8");
        return freeMarkerConfigurer;
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer){
        configurer.enable();
    }

    @Bean
    @Override
    public RequestMappingHandlerMapping requestMappingHandlerMapping() {
        RequestMappingHandlerMapping requestMappingHandlerMapping = super.requestMappingHandlerMapping();
        requestMappingHandlerMapping.setRemoveSemicolonContent(false);
        return requestMappingHandlerMapping;
    }

}
