package cn.highsuccess.data.serivce;

import cn.highsuccess.data.receiveInfoServiceProvider;
import cn.highsuccess.module.UserReceiveInfoItem;
import org.springframework.stereotype.Service;

/**
 * Created by prototype on 2017/5/19.
 */
@Service
public class ReceiveInfoService implements receiveInfoServiceProvider {

    @Override
    public boolean addUserReceiveInfo(UserReceiveInfoItem userReceiveInfoItem) {
        return false;
    }

    @Override
    public boolean updateUserReceiveInfo(UserReceiveInfoItem userReceiveInfoItem) {
        return false;
    }

    @Override
    public boolean delUserReceiveInfo(UserReceiveInfoItem userReceiveInfoItem) {
        return false;
    }
}
