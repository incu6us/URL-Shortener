<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>Shortened URL Not Found</title>
<!--       <link rel="stylesheet" type="text/css" href="static/styles.css"/> -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>
	<div style="margin: 20px;">
		<div class="panel panel-default">
			<div class="panel-heading">Shortened URL Not Found</div>
			<div class="panel-body">
				Could not locate a URL from the shortened code "
				<s:property value="shortUrl" />
				"
			</div>
		</div>
	</div>
</body>
</html>
