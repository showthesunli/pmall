package cn.highsuccess.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 * Created by prototype on 2017/3/21.
 */
@Configuration
@EnableWebMvc
public class PmallSecurityConfig extends WebSecurityConfigurerAdapter{
}
