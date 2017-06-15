package cn.highsuccess.data.serivce;

import cn.highsuccess.data.UserRepository;
import cn.highsuccess.module.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by prototype on 2017/3/24.
 */
@Service
public class UserRepositoryService implements UserRepository{

    @Override
    public User login(String userName, String password) {
        return null;
    }

    @Override
    public User findUserByUsername(String userName,String password) {
        return new User(userName,password);
    }
}
