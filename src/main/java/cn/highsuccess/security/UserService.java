package cn.highsuccess.security;

import cn.highsuccess.data.UserRepository;
import cn.highsuccess.module.User;
import cn.highsuccess.module.UserRoleEnum;
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
 */
@Component
public class UserService implements UserDetailsService{
    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = userRepository.findUserByUsername(s);
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
