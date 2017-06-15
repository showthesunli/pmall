<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="<@spring.url '/js/jquery-1.7.2.min.js'/>"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#payForm").submit();
        })
    </script>
</head>

<body>
<form action="http://www.happypoints.cn/payInterface/payInterfaceMain" method="post" id="payForm">
    <input type="hidden" name="paySsn" value="${paySsn}"/>
    <input type="hidden" name="payer" value="${payer}">
    <input type="hidden" name="memberId" value="${memberID}">
    <input type="hidden" name="payAmt" value="${payAmt?string('0.00')}">
    <input type="hidden" name="backNoticeUrl" value="http://10.160.16.227:8080/wechart/notice"/>
    <input type="hidden" name="noticeurl" value="http://www.happypoints.cn/wechart/notice"/>
    <#--<input type="hidden" name="noticeurl" value="${noticeurl}"/>-->
    <#--<input type="hidden" name="noticeurl" value="http://localhost:8080/pmall/notice"/>-->
    <input type="hidden" name="payDate" value="${payDate}">
    <input type="hidden" name="termID" value="${termID}">
    <input type="hidden" name="goodsUrl" value="www.happypoints.cn">
    <input type="hidden" name="goodsName" value="逸乐">
    <input type="hidden" name="sign" value="${sign}">
</form>
</body>
</html>