package cn.highsuccess.config.systemproperties;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/**
 * Created by showt on 2017/3/23.
 */
@Configuration
@PropertySource("classpath:/HisuMngAttribute.properties")
public class HisuMngAttribute {
    private String GETENCODING;
    private String TIMEOUT;
    private String LENGTHOFTELLERNO;
    private String SESSIONTIMEOUT;
    private String KEY;
    private String PRODUCTNAME;
    private String EXIST_FILE_DOWNLOAD;
    private String PRD_HOST;

    public HisuMngAttribute(@Value("${GET_ENCODING}")String GETENCODING
            ,@Value("${TIME_OUT}") String TIMEOUT
            ,@Value("${lengthOfTellerNo}") String LENGTHOFTELLERNO
            ,@Value("${SESSION-TIME-OUT}") String SESSIONTIMEOUT
            ,@Value("${KEY}") String KEY
            ,@Value("${productName}") String PRODUCTNAME
            ,@Value("${EXIST_FILE_DOWNLOAD}") String EXIST_FILE_DOWNLOAD
            ,@Value("${PRD_HOST}") String PRD_HOST) {
        this.GETENCODING = GETENCODING;
        this.TIMEOUT = TIMEOUT;
        this.LENGTHOFTELLERNO = LENGTHOFTELLERNO;
        this.SESSIONTIMEOUT = SESSIONTIMEOUT;
        this.KEY = KEY;
        this.PRODUCTNAME = PRODUCTNAME;
        this.EXIST_FILE_DOWNLOAD = EXIST_FILE_DOWNLOAD;
        this.PRD_HOST = PRD_HOST;
    }

    public String getGETENCODING() {
        return GETENCODING;
    }

    public String getTIMEOUT() {
        return TIMEOUT;
    }

    public String getLENGTHOFTELLERNO() {
        return LENGTHOFTELLERNO;
    }

    public String getSESSIONTIMEOUT() {
        return SESSIONTIMEOUT;
    }

    public String getKEY() {
        return KEY;
    }

    public String getPRODUCTNAME() {
        return PRODUCTNAME;
    }

    public String getEXIST_FILE_DOWNLOAD() {
        return EXIST_FILE_DOWNLOAD;
    }

    public String getPRD_HOST() {
        return PRD_HOST;
    }
}
