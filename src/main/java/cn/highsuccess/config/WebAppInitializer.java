package cn.highsuccess.config;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

/**
 * Created by prototype on 2017/5/22.
 */
public class WebAppInitializer implements WebApplicationInitializer {
    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        // root context
        AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
        rootContext.register(RootConfig.class); // configuration class for root context
        servletContext.addListener(new ContextLoaderListener(rootContext));

        // dispatcher servlet pmall
        AnnotationConfigWebApplicationContext webContextPmall = new AnnotationConfigWebApplicationContext();
        webContextPmall.setParent(rootContext);
        webContextPmall.register(WebConfig.class); // configuration class for servlet pmall dispatcher
        ServletRegistration.Dynamic dispatcherPamll = servletContext.addServlet("dispatcherPamll", new DispatcherServlet(webContextPmall));
//        dispatcherPamll.setInitParameter("spring.profiles.active","pmall"); //active pmall profile
        dispatcherPamll.setLoadOnStartup(1);
        dispatcherPamll.addMapping("/pmall");

        // dispatcher servlet wechartMall
        AnnotationConfigWebApplicationContext webContextWechartMall = new AnnotationConfigWebApplicationContext();
        webContextWechartMall.setParent(rootContext);
        webContextWechartMall.register(WeChartConfig.class); // configuration class for servlet wechart dispatcher
        ServletRegistration.Dynamic dispatcherWeChartMall = servletContext.addServlet("dispatcherWeChartMall", new DispatcherServlet(webContextPmall));
//        dispatcherPamll.setInitParameter("spring.profiles.active","wechartmall"); //active wechartmall profile
        dispatcherWeChartMall.setLoadOnStartup(2);
        dispatcherWeChartMall.addMapping("/wechart");
    }
}
