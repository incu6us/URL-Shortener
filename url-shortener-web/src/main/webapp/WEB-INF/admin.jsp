<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
   <head>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
      <title>Add URL</title>
<!--       <link rel="stylesheet" type="text/css" href="static/styles.css"/> -->
      <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
      <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
   </head>
   <body>
   	  <a class="btn btn-default" href='<s:url value="/"></s:url>'>add</a>
      <h1>URL List</h1>
      <table>
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
	            <td><s:property value="shortUrl"/></td>
	            <td><s:property value="fullUrl"/></td>
	            <td><a href="<s:url value=<s:property value="shortUrl"/></s:url>">check</a></td>
	            <td><a href="deleteShortUrl?url=<s:property value="fullUrl"/>">delete</a></td>
         	</tr>
         </s:iterator>
         </tbody>
      </table>
   </body>
</html>
