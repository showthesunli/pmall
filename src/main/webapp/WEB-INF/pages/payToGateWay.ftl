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
    <input type="hidden" name="payer" value="splenwisePay">
    <input type="hidden" name="memberId" value="${memberID}">
    <input type="hidden" name="payAmt" value="${payAmt}">
    <input type="hidden" name="noticeurl" value="http://localhost:8080/pmall/notice"/>
    <input type="hidden" name="payDate" value="20170517200000">
</form>
</body>
</html>