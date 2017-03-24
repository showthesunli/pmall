package cn.highsuccess.security;

import cn.highsuccess.data.UserRepository;
import cn.highsuccess.transform.HisuTransform;
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
    private UserDetailsService userDetailsService;
    @Autowired
    private HisuTransform htf;

    @Override
    protected void additionalAuthenticationChecks(UserDetails userDetails, UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken) throws AuthenticationException {
        WebAuthenticationDetails de = (WebAuthenticationDetails)usernamePasswordAuthenticationToken.getDetails();
        String password = usernamePasswordAuthenticationToken.getCredentials().toString();
        JSONObject obj = htf.login(de.getRemoteAddress()+"|logonType=1|",userDetails.getUsername(),password);
        if (null != obj){
            if(!"0".equals(obj.optString("responseCode"))){
                this.logger.debug("Authentication failed: password does not match stored value");
                throw new BadCredentialsException(this.messages.getMessage("AbstractUserDetailsAuthenticationProvider.badCredentials", "Bad credentials"));
            }
        }
    }

    @Override
    protected UserDetails retrieveUser(String s, UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken) throws AuthenticationException {
        UserDetails loadedUser = this.userDetailsService.loadUserByUsername(s);
        if(loadedUser == null) {
            throw new InternalAuthenticationServiceException("UserDetailsService returned null, which is an interface contract violation");
        } else {
            return loadedUser;
        }
    }
}
