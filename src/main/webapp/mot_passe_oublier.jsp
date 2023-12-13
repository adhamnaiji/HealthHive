<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Doctolib</title>
  <style>
  body{background-color: #107aca;}
  .container {
	max-width: 600px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 70px;
	margin-left: 180px;
}
  </style>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="NavBar.jsp"/>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <form  action="RecupererPassword" method="post"  >
          <h2>Mot de passe oublié</h2>
          <p>Veuillez entrer votre adresse e-mail pour réinitialiser votre mot de passe.</p>
          <div class="form-group">
            <label for="email">Adresse Email</label>
            <input type="email"  name="email" class="form-control" id="email" placeholder="Entrez votre email" required>
          </div>
          <button type="submit" class="btn btn-primary">Réinitialiser le mot de passe</button>
        </form>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS and dependencies (jQuery, Popper.js) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
