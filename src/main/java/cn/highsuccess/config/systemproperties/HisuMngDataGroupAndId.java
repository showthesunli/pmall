package cn.highsuccess.config.systemproperties;

import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by prototype on 2017/4/14.
 */
public class HisuMngDataGroupAndId {
    protected Map<String,List<String>> dataId;

    public Map<String, List<String>> getDataId() {
        return dataId;
    }

    public void setDataId(Map<String, List<String>> dataId) {
        this.dataId = dataId;
    }
}
