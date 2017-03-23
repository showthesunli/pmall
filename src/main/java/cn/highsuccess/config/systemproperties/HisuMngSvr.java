package cn.highsuccess.config.systemproperties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/**
 * Created by showt on 2017/3/23.
 */
@Configuration
@PropertySource("classpath:/HisuMngSvr.properties")
public class HisuMngSvr {
    private String ip;
    private String prot;

    public String getIp() {
        return ip;
    }

    public String getProt() {
        return prot;
    }

    public HisuMngSvr(@Value("${DataServerIp}")String ip,@Value("${DataServerPort}") String prot) {
        this.ip = ip;
        this.prot = prot;
    }
}
