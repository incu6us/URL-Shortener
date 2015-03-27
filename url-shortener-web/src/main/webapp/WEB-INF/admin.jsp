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
	<ol class="breadcrumb">
		<li><a href='<s:url value="/"></s:url>'>add</a></li>
	</ol>
	<div style="margin: 20px;">
		<div class="panel panel-default">
			<div class="panel-heading">Url List</div>
			<div class="panel-body">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Short URL</th>
							<th>Full URL</th>
							<th>Check Link</th>
							<th>Delete Link</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="shortUrlList">
							<tr>
								<td><s:property value="shortUrl" /></td>
								<td><s:property value="fullUrl" /></td>
								<td><a class="btn btn-info btn-xs"
									href=<s:property value="shortUrl"/>>check</a></td>
								<td><a class="btn btn-danger btn-xs"
									href="deleteShortUrl?url=<s:property value="fullUrl"/>">delete</a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
