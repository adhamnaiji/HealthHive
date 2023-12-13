

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ClassMétier.Medecin;
import ClassMétier.Singleton;


@WebServlet("/servlet2")
public class servlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public servlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Singleton singleton = Singleton.getInstance();
		  String nom = request.getParameter("nom");
		  String spe = request.getParameter("spe");
		  String reg = request.getParameter("reg");


		  List<Medecin> resultatRecherche = new ArrayList<>();

		  try {
			  PreparedStatement ps = singleton.conn.prepareStatement("SELECT * FROM medecin WHERE nom LIKE ? AND adress LIKE ? AND specialite LIKE ?");		      ps.setString(1, nom + "%");
			  ps.setString(1,nom + "%");
	  			ps.setString(2,reg + "%");
	  			ps.setString(3,spe+ "%");

		      ResultSet rs = ps.executeQuery();
		      while (rs.next()) {
		    	        int id=rs.getInt(1);
		    	        String medecinNom = rs.getString(2);
		    	        String medecinAdresse = rs.getString(3);
		    	        String medecinSpecialite = rs.getString(4);
		    	       
		    	        Medecin medecin = new Medecin(id , medecinNom, medecinAdresse, medecinSpecialite);
		    	        resultatRecherche.add(medecin);	
		    	        }
		    
		  } catch (SQLException e) {
		      e.printStackTrace();
		  }
          
	        request.setAttribute("resultatRecherche", resultatRecherche);

		  // Transfert vers la page JSP
		  request.getRequestDispatcher("accueil.jsp").include(request, response);
		   String medecinId = request.getParameter("medecinId");
	        
	        // Création ou récupération de la session
	        HttpSession session = request.getSession(true);
	        System.out.println(medecinId);
	        // Stockage de l'ID du médecin dans la session
	        session.setAttribute("selectedMedecinId", medecinId);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        
	        // Utilisation de PreparedStatement pour éviter les injections SQL
	        try {
	            Singleton singleton = Singleton.getInstance();
	            PreparedStatement ps = singleton.conn.prepareStatement("SELECT * FROM user WHERE email=? AND password=?;");
	            ps.setString(1, username);
	            ps.setString(2, password);
	            
	            ResultSet resultSet = ps.executeQuery();
	            if (resultSet.next()) {
	                request.setAttribute("username", username);
	                HttpSession session= request.getSession();
	                session.setAttribute("nom",username);
	                int id=(int)resultSet.getInt("id");
	                System.out.println(resultSet.getInt("id"));
	                session.setAttribute("user_id",id);
	                request.getRequestDispatcher("/accueil.jsp").forward(request, response);
	                //lenne nzid el session
	                
	                
	            } else {
	                getServletContext().setAttribute("msg", "Username or password error!!!");
	                request.getRequestDispatcher("/connexion.jsp").forward(request, response);
	            }
	        } catch (SQLException e) {
	            // Gérer l'exception SQL (enregistrement dans les journaux, affichage d'un message d'erreur, etc.)
	            e.printStackTrace(); // Temporaire - Affiche l'erreur dans la console
	            // Vous pouvez personnaliser la gestion des erreurs ici
	            request.setAttribute("errorMsg", "An error occurred while processing your request");
	            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
	        }
	    }
	}
