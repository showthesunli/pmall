package cn.highsuccess.web.advice;

import freemarker.core.Environment;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

import java.io.Writer;

/**
 * Created by prototype on 2017/6/3.
 */
public class HisuFreeMarkerExceptionHandler implements TemplateExceptionHandler {
    @Override
    public void handleTemplateException(TemplateException e, Environment environment, Writer writer) throws TemplateException {
        throw e;
    }
}
