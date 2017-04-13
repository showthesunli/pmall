package cn.highsuccess.data;

import cn.highsuccess.module.User;

/**
 * Created by prototype on 2017/3/20.
 */
public interface UserRepository {

    public User login(String userName,String password);

    /**
     * 使用userName构建一个User对象
     * @param userName
     * @return
     */
    public User findUserByUsername(String userName,String password);
}
