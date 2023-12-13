<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="GestionCafe" >
    
  
    <table border="1">
      <tr>
        <th>NOM_CAFE</th>
        <th>FO_ID</th>
        <th>PRIX</th>
        <th>VENTES</th>
      </tr>
    <%-- Boucle forEach pour itérer sur la liste --%>
    <forEach var="element" items=<%=request.getAttribute("ouma")%>>
        <tr> 
         <td> items.resultSet.getString("NOM_CAFE")</td>
         <td> items.resultSet.getString("FO_ID")</td>
         <td> items.resultSet.getString("PRIX")</td>
         <td> items.resultSet.getString("VENTES")</td>
        </tr>
             
    </forEach>
   </table>
</form>

</body>
</html>