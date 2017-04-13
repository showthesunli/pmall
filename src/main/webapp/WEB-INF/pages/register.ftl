<#import "spring.ftl" as spring />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
</head>
<body>

<form action="register" method="post" class="registerFormForEmial" >
    <p><label>邮箱账号</label><input id="email" name="id" class="registerTxt" type="text"
                                 placeholder="建议使用常用邮箱"/></p>

    <p><label>设置密码</label><input id="psw" name="password" type="password" class="registerTxt"
                                 placeholder="请输入密码，密码至少6位"/></p>

    <p><label>确认密码</label><input id="repsw" name="repsw" type="password" class="registerTxt"
                                 placeholder="再次输入您的密码"/></p>
    <input type="hidden" name="type" value="email"/>

    <p><input name="" id="recv" type="checkbox" value="" checked="checked"/><label
            style="line-height:20px;">我已阅读并同意</label><a href="#" style="color:#0099ff">《注册协议》</a></p>

    <p style="margin-bottom:10px;"><input type="submit" value="注册" class="registerBtn btnBgS"/></p>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

    <p class="toLogin">已有账号<a href="#">请登录</a></p>
</form>
<#if user??>
${user.id}
${user.password}
    <@spring.bind "user.id" />
    <@spring.showErrors "<br>"/>

</#if>
<#macro error path>
        <#assign status = springMacroRequestContext.getBindStatus(path)>
        <#list status as statu>
                ${statu.errorMessages}
        </#list>
</#macro>
<#if user??>
    <#--<@error "user.id"></@error>-->
</#if>
</body>
</html>