<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>inscrire</title>
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
body {
	font-family: Arial, sans-serif;
background-color:#e7f4fd;}

.btn-no-border {
	border: none; /* Supprime la bordure du lien */
	text-decoration: none; /* Supprime le soulignement du lien */
	color: white; /* Change la couleur du texte du lien */
}

.container {
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}
</style>
</head>
<body>

<jsp:include page="NavBar.jsp"/>
  
     <div class="container">
    <h2>Nouveau sur Doctolib ?</h2>
    <p>Saisissez vos informations pour continuer.</p>
    <form action="inscription" method="post">
     <div class="mb-3">
        <label for="tel" class="form-label"><i class="fas fa-phone" aria-hidden="true"></i> Numero telephone :</label>
        <input type="Nubmer" id="tel" name="tel" class="form-control" required>
      </div>
      <div class="mb-3">
        <label for="mail" class="form-label"><i class="fas fa-envelope"></i> Adresse e-mail :</label>
        <input type="email" id="mail" name="mail" class="form-control" required>
      </div>
      <div class="mb-3">
        <label for="daten" class="form-label"><i class="fas fa-calendar" ></i> Date naissance :</label>
        <input type="date" id="daten" name="daten" class="form-control" required>
      </div>
      <div class="mb-3">
        <label for="pass" class="form-label"><i class="fas fa-lock"></i> Mot de passe :</label>
        <input type="password" id="pass" name="pass" class="form-control" required>
      </div>
      <div class="mb-3">
        <button type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i> s'inscrire</button>
      </div>
    </form>
  </div>
    
    
</body>
</html>