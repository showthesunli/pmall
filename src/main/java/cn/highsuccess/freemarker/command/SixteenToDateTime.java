package cn.highsuccess.freemarker.command;

import freemarker.core.TemplateDateFormat;
import freemarker.core.TemplateValueFormatException;
import freemarker.template.TemplateDateModel;
import freemarker.template.TemplateModelException;

/**
 * TODO freemarker使用的日期格式化类
 * Created by prototype on 2017/6/17.
 */
public class SixteenToDateTime extends TemplateDateFormat {
    @Override
    public String formatToPlainText(TemplateDateModel templateDateModel) throws TemplateValueFormatException, TemplateModelException {
        return null;
    }

    @Override
    public Object parse(String s, int i) throws TemplateValueFormatException {
        return null;
    }

    @Override
    public boolean isLocaleBound() {
        return false;
    }

    @Override
    public boolean isTimeZoneBound() {
        return false;
    }

    @Override
    public String getDescription() {
        return "格式化16位字符串为日期格式";
    }
}
