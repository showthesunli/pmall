package cn.highsuccess.web.exception;

import java.util.Map;

/**
 * Created by prototype on 2017/6/16.
 */
public class HisuFlashOperationForJSONException extends HisuFlashOperationExcetion{
    public HisuFlashOperationForJSONException(String message) {
        super(message);
    }

    public HisuFlashOperationForJSONException(String redirectUrl, String message, Map<String, Object> map) {
        super(redirectUrl, message, map);
    }
}
