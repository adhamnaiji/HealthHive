package controlleur;


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

@WebServlet("/servlet1")
public class servlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public servlet1() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Gérer les requêtes GET si nécessaire
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Utilisation de PreparedStatement pour éviter les injections SQL
        try {
            Singleton singleton = Singleton.getInstance();
            PreparedStatement ps = singleton.conn.prepareStatement("SELECT * FROM user WHERE login=? AND password=?;");
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                request.setAttribute("username", username);
                request.getRequestDispatcher("/page2.jsp").forward(request, response);
            } else {
                getServletContext().setAttribute("msg", "Username or password error!!!");
                request.getRequestDispatcher("/page1.jsp").forward(request, response);
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
