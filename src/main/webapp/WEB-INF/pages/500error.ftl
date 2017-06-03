<#import "/spring.ftl" as spring/>
<#import "/lib/macro/hisuMacro.ftl" as sf/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>500错误提示</title>
		<link rel="stylesheet" type="text/css" href="<@spring.url '/css/errorstyle.css'/>">
	</head>

	<body>

		<div class="demo">
			<p><span>5</span><span>0</span><span>0</span></p>
			<p>服务器开小差了(´･ω･`)</p>
		</div>

		<div style="display:none">
			<script type="text/javascript" src="<@spring.url '/js/error1.js'/>"></script>
		</div>
	<script type="text/javascript" src="<@spring.url '/js/error2.js'/>"></script>
	<!--
                <@sf.error field="msg"/>
	 -->
	</body>
</html>