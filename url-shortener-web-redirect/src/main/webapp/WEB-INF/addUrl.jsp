<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
   <head>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
      <title>URL Shortener</title>
      <link rel="stylesheet" type="text/css" href="static/styles.css"/>
   </head>
   <body>
      <s:form action="add">
         <s:textfield name="shortUrl.fullUrl" label="Please enter a URL to shorten" required="true" maxlength="500" size="75"/>
         <s:submit value="Shorten"/>
      </s:form>
   </body>
</html>
