import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ClassMétier.Singleton;
import Email_Pattern.EmailContext;
import Email_Pattern.EmailStrategy;
import Email_Pattern.RegistrationRendezVous;

/**
 * Servlet implementation class rendez_vous
 */
@WebServlet("/rendez_vous")
public class rendez_vous extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rendez_vous() {
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
        String date_R = request.getParameter("date_R");
        String time_R = request.getParameter("time_R");
        String message = request.getParameter("message");
        String mail = request.getParameter("mail");
        String nom = request.getParameter("nom");
        int idmedcin = 0;
        HttpSession session= request.getSession();
        int iduser =(int)session.getAttribute("user_id");
        
        // Récupérer la valeur de "medecinId" de la session
        Integer medecinId = (Integer) session.getAttribute("medecinId");
        EmailContext context = new EmailContext();
		EmailStrategy registrationStrategy = new RegistrationRendezVous();
		context.setStrategy(registrationStrategy);
        
        if (medecinId != null) {
            // Utiliser la valeur de medecinId comme nécessaire
            System.out.println("Valeur de medecinId : " + medecinId);
            //na3mel parcour ntesty ithe el user mconnecty welle ithe mech mconnecty
            //ihezzou lel page connexion w betbi3tou yo93od mconnecty 
			Singleton singleton = Singleton.getInstance();
            PreparedStatement ps;
            try {
                ps = singleton.conn.prepareStatement("SELECT * FROM rendez_vous WHERE medcin_id=? and date=? and time_R=?");
                ps.setInt(1, medecinId);
                ps.setString(2, date_R);
                ps.setString(3, time_R);
                ResultSet resultSet = ps.executeQuery();
                String message3="";
                if (resultSet.next()) {
                	
                	    message3 = "Médecin n'est pas disponible";
                	    request.setAttribute("errorMessage", message3);
                	    System.out.println("Rendez-vous déjà existant");
                	    request.getRequestDispatcher("/rendez_vous.jsp").forward(request, response);
                } else {
                    
    		  
    		        String sql = "INSERT INTO rendez_vous (medcin_id, user_id, date, nom_patient, time_R, messge, tel, mail) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    		        PreparedStatement ps1 = singleton.conn.prepareStatement(sql);
    		        ps1.setInt(1, medecinId);
                    ps1.setInt(2, iduser);
                    ps1.setString(3, date_R);
                    ps1.setString(4, nom);
                    ps1.setString(5, time_R);
                    ps1.setString(6, message);
                    ps1.setString(7, tel);
                    ps1.setString(8, mail);

                    ps1.executeUpdate();
            //nzid el envoi mail
                    context.SendMail(mail, "Rendez vous",date_R, time_R);
            		

                    request.getRequestDispatcher("/accueil.jsp").forward(request, response);
                }
    		} catch (SQLException e) {
    		    e.printStackTrace();
    		}
            
        }}}