<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>404错误提示</title>
		<link rel="stylesheet" type="text/css" href="<@spring.url '/css/errorstyle.css'/>">
	</head>

	<body>

		<div class="demo">
			<p><span>4</span><span>0</span><span>4</span></p>
			<p>该页面不存在(´･ω･`)</p>
		</div>

		<div style="display:none">
			<script type="text/javascript" src="<@spring.url '/js/error1.js'/>"></script>
		</div>
	<script type="text/javascript" src="<@spring.url '/js/error2.js'/>"></script>
	</body>
</html>
