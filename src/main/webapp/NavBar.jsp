<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
    .white-text {
        color: white;
    }
</style>

</head>
<%
String nom=(String)session.getAttribute("nom");
System.out.println("hhh"+nom);
if (session.getAttribute("user_id") != null) {
    int user_id = (int) session.getAttribute("user_id");
}
System.out.println("el user id elli aceuil "+session.getAttribute("user_id"));

%>
<c:set var="loggedInUser" value="${nom}" />
<meta charset="UTF-8">
<nav class="navbar " style="background-color: #107aca;">
			<div class="container-fluid">
				<a class="navbar-brand text-white" href="accueil.jsp">HealthHive</a>
				<c:if test="${loggedInUser != null }">
				
				</c:if>
				
				<form class="d-flex">
					<a href="" class="btn-no-border"
						style="color: white; margin-top: 14px";>Vous etes praticien ?
					</a> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <a>
					
 <svg
							style="color: white; margin-top: 14px"
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-person-check-fill"
							viewBox="0 0 16 16">
  <path fill-rule="evenodd"
								d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
  <path
								d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
</svg></a> <a>&nbsp;&nbsp;</a> 


<c:choose>
    <c:when test="${loggedInUser eq null}">
            <div>
<a href="connexion.jsp" class="btn-no-border"
						style="color: white;"> Se Connecter <br> Gérer mes RDV
</a>        </div>
    
        
    </c:when>
    <c:otherwise>
<ul class="nav nav-tabs" >
  
  <li class="nav-item dropdown  white-text" >
    <a class="nav-link dropdown-toggle white-text" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><c:out value="${loggedInUser}"></c:out></a>
    <ul class="dropdown-menu" style="background-color: #107aca;">
          <c:if test="${loggedInUser != null }">
    
    <form action="Deconnexion" method="get">
     
      </form>
       </c:if>
      
     <c:if test="${loggedInUser != null }">
    <form action="Deconnexion" method="get" >
        <ul >
            <li><a href="Profile.jsp" class="dropdown-item white-text">Profile</a></li>
            <li><a href="MesRendezVous.jsp" class="dropdown-item white-text">Mes Rendez Vous</a></li>
            <li><button type="submit" class="dropdown-item white-text">Déconnecté</button></li>
        </ul>
    </form>
</c:if>
    </ul>
  </li>
  
  
</ul>

    </c:otherwise>
</c:choose>

				</form>
			</div>
		</nav>