<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>welcome</title>
</head>
<body>
		<h3>Welcome <%=request.getAttribute("username")%></h3>
		
		<a href="pageCafes.jsp">Gérer les cafés</a>
		<br><br>
		<a href="">Gérer les viennoiseries</a>
</body>
</html>