package cn.highsuccess.data;

import cn.highsuccess.config.systemproperties.HisuMngAttribute;
import cn.highsuccess.config.systemproperties.HisuMngSvr;
import cn.highsuccess.module.User;
import cn.highsuccess.transform.HisuTransform;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;


public abstract class BaseConnect {
    protected HisuMngAttribute hmsi;
    protected HisuMngSvr hisuMngSvr;

    protected String productName;
    protected JSONObject data;
    protected int returnCode;
    protected String responseRemark;
    protected WebAuthenticationDetails userDetails;
    protected String userName;

    protected HisuTransform htf;

    protected BaseConnect(HisuMngAttribute hmsi,HisuMngSvr hisuMngSvr,HisuTransform htf) {
        this.hmsi = hmsi;
        this.hisuMngSvr = hisuMngSvr;
        this.htf = htf;
        this.productName =  this.hmsi.getPRODUCTNAME();
        this.userDetails = (WebAuthenticationDetails)SecurityContextHolder.getContext().getAuthentication().getDetails();
        this.userName = SecurityContextHolder.getContext().getAuthentication().getName();
    }



    /**
     * @return 后台返回的整个json数据集
     */
    public JSONObject getData() {
        return data;
    }

    /**
     * @return 后台返回码
     */
    public int getReturnCode() {
        return returnCode;
    }

    /**
     * @return 出错时返回的信息
     */
    public String getResponseRemark() {
        return responseRemark;
    }

    public WebAuthenticationDetails getUserDetails() {
        return userDetails;
    }

    public String getUserName() {
        return userName;
    }
}
