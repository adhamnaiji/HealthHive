

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ClassMétier.Singleton;

/**
 * Servlet implementation class inscription
 */
@WebServlet("/inscription")
public class inscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inscription() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tel = request.getParameter("tel");
		String daten = request.getParameter("daten");

		String mail = request.getParameter("mail");
        String password = request.getParameter("pass");
        
        // Utilisation de PreparedStatement pour éviter les injections SQL
        try {
            Singleton singleton = Singleton.getInstance();
            PreparedStatement ps = singleton.conn.prepareStatement("SELECT * FROM user WHERE email=? ;");
            ps.setString(1, mail);
           

            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                getServletContext().setAttribute("msg", "Existe déja !!!");
                request.getRequestDispatcher("/inscription.jsp").include(request, response);
            } else {
                String sql = "INSERT INTO user (email, tel, date_ness,password) VALUES (?, ?, ?,?)";
                PreparedStatement ps1 = singleton.conn.prepareStatement(sql);
                ps1.setString(1, mail);
                ps1.setString(2, tel);
                ps1.setString(3, daten);
                ps1.setString(4, password);
                ps1.execute();

             
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
