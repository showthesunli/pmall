<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>

<form method="post" action="/shoppingCart/addCart">
    <input name="prdNo" value="0389-20160628104254-00013864-0081">
    <input name="prdName" value="">
    <input name="money" value="889.00">
    <input name="amount" value="1">
    <input name="${_csrf.parameterName}" value="${_csrf.token}">
    <input type="submit">
</form>
</body>
</html>