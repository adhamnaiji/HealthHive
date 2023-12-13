
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color:#e7f4fd;
}

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
		<h3>J'ai déjà un compte Doctolib</h3>
		<form action="servlet2" method="post">
			<div class="mb-3">
				<label for="email" class="form-label"><i
					class="fas fa-envelope"></i> Adresse e-mail :</label> <input type="email"
					id="username" name="username" class="form-control" required>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label"><i
					class="fas fa-lock"></i> Mot de passe :</label> <input type="password"
					id="password" name="password" class="form-control" required>
			</div>
			<div class="mb-3">
				<button type="submit" class="btn btn-primary">
					<i class="fas fa-sign-in-alt"></i> Se connecter
				</button>
			</div>
			<div class="mb-3">
				<a href="mot_passe_oublier.jsp" class="btn btn-link">Mot de
					passe oublié ?</a>
			</div>
			<div class="mb-3">
				<a href="mot_passe_oublier.jsp" class="btn btn-link"></a>
			</div>
	</div>
	</form>
	<div class="container">
                <p style="text-align: center;">Nouveau sur Doctolib ?</p>
				<a  style="margin-left:125px;" href="inscription.jsp" class="btn btn-link">S'inscrire</a>
			
</div>
	</div>
	


</body>
</html>