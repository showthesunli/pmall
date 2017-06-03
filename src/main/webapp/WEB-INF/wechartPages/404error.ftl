<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>404错误提示</title>
		<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/errorstyle.css'/>">
	</head>

	<body>

		<div class="demo">
			<p><span>4</span><span>0</span><span>4</span></p>
			<p>该页面不存在(´･ω･`)</p>
		</div>

		<div style="display:none">
			<script type="text/javascript" src="<@spring.url '/wechart/js/error1.js'/>"></script>
		</div>
	<script type="text/javascript" src="<@spring.url '/wechart/js/error2.js'/>"></script>
	</body>
</html>
