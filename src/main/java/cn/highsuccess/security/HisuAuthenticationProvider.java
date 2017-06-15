package cn.highsuccess.security;

import cn.highsuccess.transform.HisuTransform;
import cn.highsuccess.web.exception.HisuOperateException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;

/**
 * Created by showt on 2017/3/23.
 */
@Component
public class HisuAuthenticationProvider extends AbstractUserDetailsAuthenticationProvider {
    @Autowired
    private UserService userDetailsService;
    @Autowired
    private HisuTransform htf;

    /**
     * 登录验证放到 retrieveUser中来做
     * @param userDetails
     * @param usernamePasswordAuthenticationToken
     * @throws AuthenticationException
     */
    @Override
    protected void additionalAuthenticationChecks(UserDetails userDetails, UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken) throws AuthenticationException {
    }

    /**
     * 不以用户输入的账户名为准，以后台返回的账户名重新构建UserDetails
     * @param s
     * @param usernamePasswordAuthenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected UserDetails retrieveUser(String s, UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken) throws AuthenticationException {
        UserDetails loadedUser = this.userDetailsService.loadUserByUsername(s,usernamePasswordAuthenticationToken.getCredentials().toString());
        WebAuthenticationDetails de = (WebAuthenticationDetails)usernamePasswordAuthenticationToken.getDetails();
        JSONObject obj = htf.login(de.getRemoteAddress()+"|logonType=0",loadedUser.getUsername(),loadedUser.getPassword());
        if (null != obj){
            if(0 > obj.optInt("responseCode")){
                this.logger.info("Authentication failed: " + obj.optJSONObject("responseObj").optString("错误原因"));
                throw new BadCredentialsException(obj.optJSONObject("responseObj").optString("错误原因"));
            }else {
                this.logger.debug("create new UserDetial , origin username is " + loadedUser.getUsername());
                UserDetails newUser = this.userDetailsService.loadUserByUsername(obj.optJSONObject("responseObj").optString("idOfOperator"),loadedUser.getPassword());
                this.logger.debug("create new UserDetial , new username is " + newUser.getUsername());
                return newUser;
            }
        }else {
            throw new BadCredentialsException("网络错误!");
        }
    }
}
