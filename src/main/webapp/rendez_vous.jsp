<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Planifier un rendez-vous</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    .appointment-form {
      margin-top: 50px;
    }
    body {
	font-family: Arial, sans-serif;
	background-color: #e7f4fd;
}
    
    .container1 {
	max-width: 600px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 15px;
	margin-left: 370px;
}
  </style>
</head>
<body>
	<div style="background-color: #107aca;">
	<jsp:include page="NavBar.jsp"/>

	</div>


  <div class="container1">
    <div class="appointment-form">
      <h2>Planifier un rendez-vous</h2>
    <form action="rendez_vous" method="post">
        <div class="form-group">
          <label for="name">Nom :</label>
          <input type="text" class="form-control" id="name" placeholder="Votre nom" name="nom">
        </div>
        <div class="form-group">
          <label for="email">Email :</label>
          <input type="email" class="form-control" id="email" placeholder="Votre email" name="mail">
        </div>
        <div class="form-group">
          <label for="phone">Téléphone :</label>
          <input type="number" class="form-control" id="phone" placeholder="Votre numéro de téléphone" name="tel">
        </div>
        <div class="form-group">
          <label for="date">Date du rendez-vous :</label>
          <input type="date" class="form-control" id="date" name="date_R">
        </div>
        <div class="form-group">
          <label for="time">Heure du rendez-vous :</label>
          <input type="time" class="form-control" id="time" name="time_R">
        </div>
        <div class="form-group">
          <label for="message">Message :</label>
          <textarea class="form-control" id="message" rows="3" placeholder="Votre message" name="message"></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Planifier</button>
      </form>
    </div>
  </div>
</body>
</html>