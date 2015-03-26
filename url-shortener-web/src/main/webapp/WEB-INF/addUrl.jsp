<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>URL Shortener</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="static/styles.css" />
</head>
<body>
	<ol class="breadcrumb">
		<li><a href='<s:url value="list"></s:url>'>list</a></li>
	</ol>
	<div style="margin: 20px;">
		<div class="panel panel-default">
			<div class="panel-heading">Url To Shorten</div>
			<div class="panel-body">
				<s:form action="add">
					<s:textfield name="shortUrl.fullUrl"
						label="Please enter a URL to shorten" required="true"
						maxlength="500" size="75" />
					<s:submit cssClass="btn btn-success" value="Shorten" />
				</s:form>
			</div>
		</div>
	</div>
</body>
</html>
