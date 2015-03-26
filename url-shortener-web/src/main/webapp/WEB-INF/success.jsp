<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>URL Successfully Shortened</title>
<!-- <link rel="stylesheet" type="text/css" href="static/styles.css" /> -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>
	<a class="btn btn-default" href='<s:url value="/"></s:url>'>home</a>
	<h1>Success!</h1>
	Your new URL has been created:
	<s:a cssClass="btn btn-default" href="%{shortUrl.shortUrl}" target="_blank">
		<s:url value="%{shortUrl.shortUrl}" forceAddSchemeHostAndPort="true" />
	</s:a>
</body>
</html>
