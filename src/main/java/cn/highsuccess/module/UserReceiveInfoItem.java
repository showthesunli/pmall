package cn.highsuccess.module;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import java.lang.annotation.Native;

/**
 * Created by prototype on 2017/5/19.
 * 用户收货地址信息类
 */
public class UserReceiveInfoItem {
    private String objectID;
    private String receiverName;
    private String phone;
    private String zipCode;
    private String addr;
    private String isDefault;

    public String getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(String isDefault) {
        this.isDefault = isDefault;
    }

    public String getObjectID() {
        return objectID;
    }

    public void setObjectID(String objectID) {
        this.objectID = objectID;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }
}
