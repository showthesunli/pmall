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

    @Override
    protected void additionalAuthenticationChecks(UserDetails userDetails, UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken) throws AuthenticationException {
        WebAuthenticationDetails de = (WebAuthenticationDetails)usernamePasswordAuthenticationToken.getDetails();
        JSONObject obj = htf.login(de.getRemoteAddress()+"|logonType=0",userDetails.getUsername(),userDetails.getPassword());
        if (null != obj){
            if(0 > obj.optInt("responseCode")){
                this.logger.info("Authentication failed: " + obj.optJSONObject("responseObj").optString("错误原因"));
                throw new BadCredentialsException(obj.optJSONObject("responseObj").optString("错误原因"));
            }
        }else {
            throw new BadCredentialsException("网络错误!");
        }
    }

    @Override
    protected UserDetails retrieveUser(String s, UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken) throws AuthenticationException {
        UserDetails loadedUser = this.userDetailsService.loadUserByUsername(s,usernamePasswordAuthenticationToken.getCredentials().toString());
        if(loadedUser == null) {
            throw new InternalAuthenticationServiceException("UserDetailsService returned null, which is an interface contract violation");
        } else {
            return loadedUser;
        }
    }
}
