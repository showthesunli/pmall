package cn.highsuccess.data.impl;

import cn.highsuccess.conf.module.HisuMngSvrImpl;
import cn.highsuccess.conf.module.HisuMngTcpIpImpl;
import cn.highsuccess.point.module.LoginUser;
import cn.highsuccess.transform.HisuTransform;
import cn.highsuccess.transform.impl.HisuTransformImpl;
import org.json.JSONObject;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.util.List;

public class BaseConnect {
    protected ServletContext application;
    protected HttpSession session;
    protected HisuMngSvrImpl hmsi;
    protected List<HisuMngTcpIpImpl> tcpip;
    protected String productName;
    protected LoginUser user;
    protected JSONObject data;
    protected int returnCode;
    protected String responseRemark;
    protected HisuTransform htf;

    protected BaseConnect(HttpSession session) {
        this.application = session.getServletContext();
        this.session = session;
        this.hmsi = (HisuMngSvrImpl) application.getAttribute("HisuMngSvr");
        //this.tcpip = (List<HisuMngTcpIpImpl>)application.getAttribute("HisuMngTcpIp");
        this.productName = (String) hmsi.getData().get("productName");
        this.user = (LoginUser) session.getAttribute("user");
        this.htf = new HisuTransformImpl(user.getIp(), user.getPort());
    }

    /**
     * @return 当前用户类
     */
    public LoginUser getUser() {
        return user;
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

}
