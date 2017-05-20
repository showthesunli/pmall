package cn.highsuccess.config;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by prototype on 2017/5/20.
 */
@Component
public class PmallLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler implements LogoutSuccessHandler{
    @Override
    public void onLogoutSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        String path = httpServletRequest.getContextPath();
        String basePath = httpServletRequest.getScheme()+"://"+httpServletRequest.getServerName()+":"+httpServletRequest.getServerPort()+path+"/";
        String successurl = httpServletRequest.getParameter("forword");
        if (successurl != null){
            httpServletResponse.sendRedirect(basePath+successurl);
        }else {
            httpServletResponse.sendRedirect(basePath+"/login");
        }
    }
}
