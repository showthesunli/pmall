package cn.highsuccess.data.impl;

import cn.highsuccess.conf.module.HisuMngSvrImpl;
import cn.highsuccess.point.module.LoginUser;
import cn.highsuccess.point.util.Util;
import cn.highsuccess.transform.HisuTransform;
import cn.highsuccess.transform.impl.HisuTransformImpl;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;

public class JavaGetFile {
    public static String service(HttpServletRequest request, String fileName, String filePath) {
        if (fileName == null || fileName.trim().length() == 0) return null;
        HttpSession session = request.getSession();
        ServletContext application = session.getServletContext();
        HisuMngSvrImpl hmsi = (HisuMngSvrImpl) application.getAttribute("HisuMngSvr");
        String downloadFlag = (String) hmsi.getData().get("EXIST_FILE_DOWNLOAD");//true：都从后台下载。不管本地有没有该文件，其他的则本地不存在才下载
        LoginUser user = (LoginUser) session.getAttribute("user");
        String hisuOutPath = application.getRealPath("/" + filePath);
        File file = new File(hisuOutPath + "/" + fileName);
        if ("true".equals(downloadFlag) || !file.exists()) {
            HisuTransform htf = new HisuTransformImpl(user.getIp(), user.getPort());
            htf.downloadImages(user.getId(), user.getCliIpAddr(), hisuOutPath, fileName);
        }
        String content = Util.getFileContent(request, "htmlsrc/" + fileName);
        return content;
    }
}
