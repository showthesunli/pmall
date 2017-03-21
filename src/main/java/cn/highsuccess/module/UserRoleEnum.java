package cn.highsuccess.module;

/**
 * Created by prototype on 2017/3/21.
 */
public enum UserRoleEnum {
    ROLE_GUEST("rel_guest"),ROLE_MEMBER("rel_member");

    private String role;

    UserRoleEnum(String role){
        this.role = role;
    }
}
