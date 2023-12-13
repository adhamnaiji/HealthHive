import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ClassMétier.Medecin;
import ClassMétier.Singleton;

/**
 * Servlet implementation class servlet2
 */
@WebServlet("/MedecinServlet")

public class MedecinServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'ID du médecin à partir de la requête
        String medecinId = request.getParameter("medecinId");
System.out.println(medecinId);
        // Utiliser l'ID pour accéder aux informations spécifiques du médecin
        // Remplacez ce code par votre propre logique pour récupérer les informations du médecin à partir de votre source de données

        // Exemple de code pour récupérer les informations du médecin à partir d'une base de données
     
        try {
            Singleton singleton = Singleton.getInstance();

            // Établir la connexion à la base de données
            // Code pour établir la connexion à la base de données

            // Préparer la requête SQL pour récupérer les informations du médecin
			  PreparedStatement stmt = singleton.conn.prepareStatement("SELECT nom, adress, specialite FROM medecins WHERE id = ?");		   

               stmt.setString(1, medecinId);

            // Exécuter la requête SQL
               ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Récupérer les informations du médecin à partir du résultat de la requête
                String nom = rs.getString("nom");
                String adresse = rs.getString("adresse");
                String specialite = rs.getString("specialite");

                // Définir les attributs à transmettre à la page JSP
                request.setAttribute("nom", nom);
                request.setAttribute("adresse", adresse);
                request.setAttribute("specialite", specialite);

                // Rediriger vers la page JSP pour afficher les informations du médecin
                RequestDispatcher dispatcher = request.getRequestDispatcher("medcin.jsp");
                dispatcher.forward(request, response);
            } else {
                // Le médecin n'a pas été trouvé, afficher un message d'erreur ou une redirection
                // ...
            }
        } catch (SQLException e) {
            // Gérer les erreurs de la base de données
            e.printStackTrace();
        } 
    }
}