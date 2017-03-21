package cn.highsuccess.security;

import cn.highsuccess.data.UserRepository;
import cn.highsuccess.module.User;
import cn.highsuccess.module.UserRoleEnum;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by prototype on 2017/3/20.
 */
public class UserService implements UserDetailsService{
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = userRepository.findUserByUsername(s);
        if(user != null){
            List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
            grantedAuthorities.add(new SimpleGrantedAuthority(user.getRole()));
            return new org.springframework.security.core.userdetails.User(user.getId(),user.getPassword(),grantedAuthorities);
        }
        throw new UsernameNotFoundException("not found user!");
    }
}
