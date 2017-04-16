package cn.highsuccess.module;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Created by prototype on 2017/3/20.
 */
public class User implements PostModel{
    @NotNull
    @Size(min = 2,max = 16,message = "账号必须在2-16位之间")
    private String id;
    @NotNull
    @Size(min = 2,max = 16,message = "密码必须在2-16位之间")
    private String password;

    public User(){

    }

    public User(String id, String password) {
        this.id = id;
        this.password = password;
    }

    public User(String id){
        this(id,"");
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
