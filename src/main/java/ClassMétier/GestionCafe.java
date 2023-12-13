package ClassMétier;


import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ClassMétier.Singleton;

/**
 * Servlet implementation class GestionCafe
 */
@WebServlet("/GestionCafe")
public class GestionCafe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestionCafe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Singleton singleton = Singleton.getInstance();
		try {
			Statement statement = singleton.conn.createStatement();
			 String sqlQuery = "SELECT * FROM cafe";
	         ResultSet resultSet = statement.executeQuery(sqlQuery);
	          System.out.println(resultSet);
	         // request.getSession.setAttribute("resultt",resultSet);
	          request.getSession().setAttribute("ouma", resultSet);
	          ///request.setAttribute("requet",resultSet);
	          request.getRequestDispatcher("GestionCafes.jsp").forward(request, response);
			

		}catch (SQLException e) {
			System.out.println(e.toString());
		}	}

	

}
