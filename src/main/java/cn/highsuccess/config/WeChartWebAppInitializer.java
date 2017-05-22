package cn.highsuccess.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.ServletRegistration;

/**
 * Created by prototype on 2017/3/17.
 */
//public class WeChartWebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{
    public class WeChartWebAppInitializer {

    protected Class<?>[] getRootConfigClasses() {
        return new Class<?>[]{RootConfig.class};
    }

    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[]{WebConfig.class,WebConfig.class};
    }

    protected String[] getServletMappings() {
        return new String[]{"/wechart"};
    }

    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
        registration.setInitParameter("spring.profiles.active","wechartmall");
    }

}
