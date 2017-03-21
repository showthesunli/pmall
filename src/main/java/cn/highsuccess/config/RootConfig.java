package cn.highsuccess.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 * Created by prototype on 2017/3/17.
 */
@Configuration
@ComponentScan(basePackages = {"cn.highsuccess"},excludeFilters = {@ComponentScan.Filter(type= FilterType.ANNOTATION,value= EnableWebMvc.class)})
public class RootConfig {
}
