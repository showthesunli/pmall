package cn.highsuccess.web;

import cn.highsuccess.config.systemproperties.HisuMngDataGroupAndId;
import cn.highsuccess.data.JavaDataSet;
import cn.highsuccess.data.JavaOperate;
import cn.highsuccess.service.util.HisuOperatePasswd;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.constraints.NotNull;
import java.nio.channels.NonWritableChannelException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by prototype on 2017/5/20.
 */
@Controller
@RequestMapping(value = "/accountSafe")
public class accountSafeController extends HisuBaseControllerAdapter {
    @Autowired
    @Qualifier(value = "queryPersonalCenterInfo")
    private HisuMngDataGroupAndId hisuMngDataGroupAndId;

    @Autowired
    protected accountSafeController(JavaDataSet jds, JavaOperate javaOperate) {
        super(jds, javaOperate);
    }

    @RequestMapping(value = "",method = RequestMethod.GET)
    public String showAccountSafe(Model model,
                                  @MatrixVariable(required = false) Map<String,String> map){
        Map<String,Object> param = new HashMap<>(map);
        param.put("memberID", this.getJds().getUserName());
        excute(model, param, hisuMngDataGroupAndId);
        return "/accountSafe";
    }

    @RequestMapping(value = "",method = RequestMethod.POST)
    public String modUserPassword(Model model,
                                  @NotNull @RequestParam String oldPassword,
                                  @NotNull @RequestParam String newPassword){
        StringBuilder condition =  new StringBuilder();
        oldPassword = HisuOperatePasswd.hisuEncPasswd(oldPassword);
        newPassword = HisuOperatePasswd.hisuEncPasswd(newPassword);
        condition.append("oldPassword=").append(oldPassword).append("|");
        condition.append("newPassword=").append(newPassword).append("|");
        condition.append("memberID=").append(this.getJds().getUserName());
        this.getJavaOperate().service("w_mmbCenterPage","starExprModMmbPasswd",condition.toString());
        if (this.getJavaOperate().getResult()){
            return "redirect:/logout?forword=modifyPswSuccess";
        }else {
            return "redirect:/accountSafe";
        }
    }
}
