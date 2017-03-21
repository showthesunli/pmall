package cn.highsuccess.data;

import cn.highsuccess.module.User;
import cn.highsuccess.module.UserRoleEnum;

/**
 * Created by showt on 2017/3/21.
 */
public class UserRepositoryImpl implements UserRepository {
    @Override
    public User login(String userName, String password) {

        return new User("lee", UserRoleEnum.ROLE_MEMBER.getRole(),"123");
    }

    @Override
    public User findUserByUsername(String userName) {
        return new User(userName,UserRoleEnum.ROLE_GUEST.getRole(),"123");
    }
}
