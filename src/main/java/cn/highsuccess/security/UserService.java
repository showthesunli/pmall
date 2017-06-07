package cn.highsuccess.security;

import cn.highsuccess.data.UserRepository;
import cn.highsuccess.module.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by prototype on 2017/3/20.
 * 没有获取到password之前无法向后台验证并获取用户信息，
 * 此类只使用用户上送的用户名构建一个密码为空的用户实例，用户验证与用户信息查询交由HisuAuthenticationProvider
 */
@Component
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public UserDetails loadUserByUsername(String s,String password) throws UsernameNotFoundException {
        User user = userRepository.findUserByUsername(s,password);
        if(user != null){
            //添加用户权限  本应用无需权限认证，仅适用登录认证
            List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
            grantedAuthorities.add(new SimpleGrantedAuthority("rol_user"));
            //使用User初始化UserDetails，并返回UserDetails对象
            return new org.springframework.security.core.userdetails.User(user.getId(),user.getPassword(),grantedAuthorities);
        }
        throw new UsernameNotFoundException("not found user!");
    }
}
