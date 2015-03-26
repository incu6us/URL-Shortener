<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>URL Shortener</title>
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
			<div class="panel-heading">URL was not saved due to the
				following problems</div>
			<div class="panel-body">
				<ul>
					<s:iterator value="violations">
						<li><s:property /></li>
					</s:iterator>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
