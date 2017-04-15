package cn.highsuccess.config.systemproperties;

import java.util.List;
import java.util.Map;

/**
 * Created by prototype on 2017/4/14.
 */
public class HisuMngDataGroupAndId {
    protected List<String> dataGroup;
    protected Map<String,List<String>> dataId;

    public List<String> getDataGroup() {
        return dataGroup;
    }

    public void setDataGroup(List<String> dataGroup) {
        this.dataGroup = dataGroup;
    }

    public Map<String, List<String>> getDataId() {
        return dataId;
    }

    public void setDataId(Map<String, List<String>> dataId) {
        this.dataId = dataId;
    }
}
