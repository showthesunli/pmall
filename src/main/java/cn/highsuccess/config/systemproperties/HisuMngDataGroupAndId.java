package cn.highsuccess.config.systemproperties;

import java.util.List;
import java.util.Map;

/**
 * Created by prototype on 2017/4/14.
 */
public class HisuMngDataGroupAndId {
    protected Map<String,List<HisuMngDataIdArgs>> dataId;

    public HisuMngDataGroupAndId(Map<String, List<HisuMngDataIdArgs>> dataId) {
        this.dataId = dataId;
    }

    public Map<String, List<HisuMngDataIdArgs>> getDataId() {
        return dataId;
    }

    public void setDataId(Map<String, List<HisuMngDataIdArgs>> dataId) {
        this.dataId = dataId;
    }
}
