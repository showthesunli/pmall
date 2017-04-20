package cn.highsuccess.config.systemproperties;

import java.util.List;

/**
 * Created by prototype on 2017/4/20.
 */
public class HisuMngDataIdArgs {
    private String id;
    private List<String> args;

    public HisuMngDataIdArgs(String id, List<String> args) {
        this.id = id;
        this.args = args;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<String> getArgs() {
        return args;
    }

    public void setArgs(List<String> args) {
        this.args = args;
    }
}
