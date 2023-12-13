<%@page import="ClassMétier.Medecin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Doctolib</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #e7f4fd;
}

.planRendezVous {
	color: white;
}

.maPhrase {
	margin-left: 200px;
	color
	=white;
}

.btn-no-border {
	border: none; /* Supprime la bordure du lien */
	text-decoration: none; /* Supprime le soulignement du lien */
	color: white; /* Change la couleur du texte du lien */
}

header {
	background-image:
		url("https://www.doctolib.fr/webpack/ef8ba4ac6e66c2d26bfb.png");
	background-size: contain;
	background-position: 100% 100%;
	background-repeat: no-repeat;
	background-color: #107aca;
	color: #fff;
	padding: 20px;
}

.container {
	max-width: 600px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 70px;
	margin-left: 180px;
	background-color: #107aca;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	color
	=white;
}
</style>
</head>

<body>

	<div style="background-color: #107aca;">
		<jsp:include page="NavBar.jsp"/>
		<header>
			<h1 class="maPhrase">Trouvez un rendez-vous avec</h1>
			<h1 id="motAffiche" class="maPhrase"></h1>
			<div class="container">
				<form action="servlet2" method="get" onsubmit="return this">

					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="nom"
							name="nom"> <input type="text" class="form-control"
							placeholder="specialité" name="spe"> <input type="text"
							class="form-control" placeholder="region" name="reg">
						<button type="submit" class="btn btn-primary">Rechercher</button>
					</div>
<c:forEach var="medecin" items="${resultatRecherche}" varStatus="loop">
    <div id="ligneMedecin_${loop.index}">
        <c:out value="Nom: ${medecin.getNom()}, Adresse: ${medecin.getAdress()}, Spécialité: ${medecin.getSpecialite()}" />
        <a href="#" class="planRendezVous" data-medecin-id="${medecin.getId()}">Planifier un rendez-vous</a>
    </div>
</c:forEach>

				</form>

			</div>
		</header>

	</div>


<%System.out.println(request.getParameter("medecinId")); %>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<script>
	const mots = [ "une médecin généraliste", "un ophtalmologue",
			"une dentiste", "un radiologue", "un ostéopathe",
			"une kinésithérapeute", "une sage-femme", "une psychologue",
			"un laboratoire", "une pharmacie" ]; // Vos mots à afficher
	const motAffiche = document.getElementById("motAffiche");
	let index = 0;

	function afficherMot() {
		motAffiche.textContent = mots[index];
		index = (index + 1) % mots.length; // Passe au mot suivant (revient au premier mot après le dernier)
	}

	setInterval(afficherMot, 1000); // Change de mot toutes les secondes (1000 millisecondes)
	afficherMot(); // Affiche le premier mot dès le chargement de la page
</script>
<script>
    document.querySelectorAll('.planRendezVous').forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault();

            const medecinId = this.getAttribute('data-medecin-id');
            const ligneMedecinId = this.parentElement.getAttribute('id'); // ID de la ligne du médecin sélectionné
            
            // Redirige vers une autre page avec les détails du médecin sélectionné
            //condition si connecté welle
            window.location.href = 'detailsMedecin.jsp?medecinId=' + medecinId + '&ligneMedecinId=' + ligneMedecinId;
        });
    });
</script>