package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.config.systemproperties.HisuMngDataIdArgs;
import cn.highsuccess.data.JavaDataSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * Created by prototype on 2017/4/20.
 */
public class ProductListController extends HisuBaseControllerAdapter{
    @Autowired
    @Qualifier("showProductList")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected ProductListController(JavaDataSet jds) {
        super(jds);
    }

    @GetMapping(value = "/pro")
    public String showProductList(Model model){

        return null;
    }

    protected void excute(Model model){
        Set<String> set = this.hisuMngDataGroupAndId.getDataId().keySet();
        Iterator<String> iterator = set.iterator();
        while (iterator.hasNext()){
            String groupId = iterator.next();
            List<HisuMngDataIdArgs> list = this.hisuMngDataGroupAndId.getDataId().get(groupId);
            if (null != list && list.size()!=0){
                for (int i=0;i<list.size();i++){
//                    this.getJds().service(groupId,list.get(i).getId(),)
                }
            }
        }
    }
}
