package cn.highsuccess.module;

/**
 * Created by prototype on 2017/5/17.
 * 用户信息类
 */
public class UserInfo {
    //性别
    private String gender;
    //学历
    private String occupition;
    //qq
    private String qq;
    //邮编
    private String zip;
    //地址
    private String addr;

    private String birthday;

    private String email;

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getOccupition() {
        return occupition;
    }

    public void setOccupition(String occupition) {
        this.occupition = occupition;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }
}
