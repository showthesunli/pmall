package cn.highsuccess.config;

import cn.highsuccess.security.HisuAuthenticationProvider;
import cn.highsuccess.security.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.filter.CharacterEncodingFilter;

import java.util.AbstractCollection;

/**
 * Created by prototype on 2017/3/21.
 */
@Configuration
@EnableWebSecurity
public class PmallSecurityConfig extends WebSecurityConfigurerAdapter{
    @Autowired
    HisuAuthenticationProvider hisuAuthenticationProvider;

    @Autowired
    PmallLogoutSuccessHandler pmallLogoutSuccessHandler;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(this.hisuAuthenticationProvider);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        http.addFilterBefore(filter, CsrfFilter.class);

        http.formLogin().loginPage("/login").defaultSuccessUrl("/member")
            .and()
                .authorizeRequests()
                .antMatchers("/member").authenticated()
                .antMatchers("/confirmOrder").authenticated()
                .antMatchers("/buycfm**").authenticated()
            .and()
                .rememberMe()
                .tokenValiditySeconds(4*7*24*60*60)
                .key("pmallKey")
            .and()
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                //退出成功的处理逻辑放入 logoutSuccessHandler
                .logoutSuccessHandler(this.pmallLogoutSuccessHandler);
    }
}
