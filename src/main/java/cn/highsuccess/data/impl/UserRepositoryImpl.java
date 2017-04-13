package cn.highsuccess.data.impl;

import cn.highsuccess.data.UserRepository;
import cn.highsuccess.module.User;

/**
 * Created by prototype on 2017/3/24.
 */
public class UserRepositoryImpl implements UserRepository{
    @Override
    public User login(String userName, String password) {
        return null;
    }

    @Override
    public User findUserByUsername(String userName,String password) {
        return new User(userName,password);
    }
}
