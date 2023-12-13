<%@ page import="ClassM�tier.Medecin"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%@ page import="ClassM�tier.Singleton"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
// R�cup�ration des param�tres de la requ�te
String medecinId = request.getParameter("medecinId");
String ligneMedecinId = request.getParameter("ligneMedecinId");
int x = Integer.parseInt(medecinId);
HttpSession session1 = request.getSession();
session1.setAttribute("medecinId", x);
%>
 
<!DOCTYPE html>
<html>
<head>
<title>Doctolib</title>
<!-- Les autres balises head n�cessaires -->
</head>
<jsp:include page="NavBar.jsp"/>
<body>

<%@ page import="java.sql.*" %>

<%
try {

    Singleton singleton = Singleton.getInstance();

    PreparedStatement stmt = singleton.conn.prepareStatement("SELECT * FROM medecin WHERE id = ?");

    stmt.setInt(1, x);

    // Ex�cuter la requ�te SQL
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
        // R�cup�rer les informations du m�decin � partir du r�sultat de la requ�te
        String nom = rs.getString(2);
        String adresse = rs.getString(4);
        String specialite = rs.getString(3);

        // Utilisez les variables nom, adresse, specialite pour afficher les informations dans la page JSP
        %>
        
  <div class="container mt-5" style="background-color: #fff;" >
    <div class="jumbotron" style="background-color: #fff;">
      <img src="url_de_l_image_du_medecin.jpg" alt="Photo du Dr.<%= nom %>" class="rounded-circle img-thumbnail mb-3" style="width: 200px;">
      <h1 class="display-4">Bienvenue chez Dr. <%= nom %></h1>
      <p class="lead">M�decin g�n�raliste</p>
      <p>Sp�cialit� :<%= specialite %></p>
      <hr class="my-4">
      <p>Adresse : <%= adresse %></p>
      <p>T�l�phone :XXXXXX</p>
      <p>Horaires de consultation :</p>
      <div class="row">
        <div class="col-md-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Lundi - Vendredi</h5>
              <p class="card-text">9h00 - 12h00</p>
              <p class="card-text">14h00 - 18h00</p>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Samedi</h5>
              <p class="card-text">9h00 - 13h00</p>
              <p class="card-text">Ferm� l'apr�s-midi</p>
            </div>
          </div>
        </div>
      </div>
      <hr class="my-4">
      <h4>� propos du Dr.  <%= nom %>:</h4>
      <p>Le Dr. Dupont est un p�diatre exp�riment� offrant des soins de qualit� aux enfants et aux nourrissons depuis plus de 15 ans.</p>
      <p>Il est membre de l'Association des P�diatres de la R�gion et participe activement � des programmes de sensibilisation � la sant� infantile.</p>
      	<%
	if(session.getAttribute("user_id")!=null){
		 int user_id = (int) session.getAttribute("user_id");
	}
	%>
	<c:set var="loggedInUserId" value="${user_id}" />
<c:choose>
    <c:when test="${loggedInUserId eq null}">
<a class="btn btn-primary btn-lg" href="connexion.jsp" role="button">Prendre rendez-vous</a>      
    </c:when>
    <c:otherwise>
<a class="btn btn-primary btn-lg" href="rendez_vous.jsp" role="button">Prendre rendez-vous</a>
    </c:otherwise>
</c:choose>
      
    </div>
  </div>
        <%
    } else {
        // Aucun r�sultat trouv�
        out.println("Aucun m�decin trouv� pour l'ID sp�cifi�.");
    }

    // Fermer la connexion, les d�clarations et les r�sultats
     // Assurez-vous de fermer la connexion apr�s utilisation
} catch (Exception e) {
    e.printStackTrace();
    out.println("Une erreur s'est produite : " + e.getMessage());
}
%>

<input type="text" value="<%= medecinId %>" hidden="true">
	
</body>
</html>

<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Accueil M�decin</title>
  <!-- Liens vers Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Style additionnel pour personnaliser la pr�sentation */
   body {
	font-family: Arial, sans-serif;
	background-color: #e7f4fd;
}
    .card {
      margin-bottom: 20px;
    }
  </style>
</head>

<body>
<input type="text" value="<%= medecinId %>" hidden="true" name="medcinid">


  <!-- Liens vers les scripts Bootstrap JS (jQuery requis) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

