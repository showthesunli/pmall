<#import "/lib/macro/hisuMacro.ftl" as sf />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
</head>
<body>

<form action="/register" method="post">
    邮箱: <input type="text" name="id"  /><@sf.error field="id"></@sf.error> <br/>
    密码: <input type="password" name="password"/><@sf.error field="password"></@sf.error><br/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <input type="submit" value="提交"/>
</form>

</body>
</html>