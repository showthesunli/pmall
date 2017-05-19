package cn.highsuccess.data;

import cn.highsuccess.module.UserReceiveInfoItem;

/**
 * Created by prototype on 2017/5/19.
 */
public interface receiveInfoServiceProvider {

    public boolean addUserReceiveInfo(UserReceiveInfoItem userReceiveInfoItem);
    public boolean updateUserReceiveInfo(UserReceiveInfoItem userReceiveInfoItem);
    public boolean delUserReceiveInfo(UserReceiveInfoItem userReceiveInfoItem);

}
