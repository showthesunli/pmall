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
    private int port;

    public HisuMngSvr(@Value("${DataServerIp}")String ip,@Value("${DataServerPort}") int port) {
        this.ip = ip;
        this.port = port;
    }

    public String getIp() {
        return ip;
    }

    public int getProt() {
        return port;
    }
}
