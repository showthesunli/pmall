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

/**
 * Created by prototype on 2017/3/21.
 */
@Configuration
@EnableWebSecurity
public class PmallSecurityConfig extends WebSecurityConfigurerAdapter{
    @Autowired
    HisuAuthenticationProvider hisuAuthenticationProvider;

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

        http.formLogin().loginPage("/login")
            .and()
                .authorizeRequests()
                .antMatchers("/member")
                .authenticated()
                .antMatchers("/confirmOrder")
                .authenticated()
            .and()
                .rememberMe()
                .tokenValiditySeconds(2419200)
                .key("pmallKey")
            .and()
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/");
    }
}
