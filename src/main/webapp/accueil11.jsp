<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Accueil Médecin</title>
  <!-- Liens vers Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Style additionnel pour personnaliser la présentation */
    body {
      background-color: #f8f9fa;
    }
    .card {
      margin-bottom: 20px;
    }
  </style>
</head>
<%

String medecinId = request.getParameter("medecinId");
String ligneMedecinId = request.getParameter("ligneMedecinId");


%>
<body>
<input type="text" value="<%= medecinId %>" hidden="true" name="medcinid">

  <div class="container mt-5">
    <div class="jumbotron">
      <img src="url_de_l_image_du_medecin.jpg" alt="Photo du Dr. Jean Dupont" class="rounded-circle img-thumbnail mb-3" style="width: 200px;">
      <h1 class="display-4">Bienvenue chez Dr. <% request.getParameter("nom");%></h1>
      <p class="lead">Médecin généraliste</p>
      <p>Spécialité :<% request.getParameter("nom");%></p>
      <hr class="my-4">
      <p><% request.getParameter("nom");%></p>
      <p>Téléphone :<% request.getParameter("nom");%></p>
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
              <p class="card-text">Fermé l'après-midi</p>
            </div>
          </div>
        </div>
      </div>
      <hr class="my-4">
      <h4>À propos du Dr. Jean Dupont :</h4>
      <p>Le Dr. Dupont est un pédiatre expérimenté offrant des soins de qualité aux enfants et aux nourrissons depuis plus de 15 ans.</p>
      <p>Il est membre de l'Association des Pédiatres de la Région et participe activement à des programmes de sensibilisation à la santé infantile.</p>
      <a class="btn btn-primary btn-lg" href="#" role="button">Prendre rendez-vous</a>
    </div>
  </div>

  <!-- Liens vers les scripts Bootstrap JS (jQuery requis) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
