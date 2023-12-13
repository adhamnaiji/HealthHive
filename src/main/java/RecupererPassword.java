

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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ClassMétier.Singleton;
import Email_Pattern.EmailContext;
import Email_Pattern.EmailStrategy;
import Email_Pattern.RegistrationRendezVous;
import Email_Pattern.ResetPassword;

@WebServlet("/RecupererPassword")
public class RecupererPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    
    public RecupererPassword() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		    EmailContext context = new EmailContext();
			ResetPassword resetPassword = new ResetPassword();
			context.setStrategy(resetPassword);
			
		String Email = request.getParameter("email");
       //lenne
		try {
		  Singleton singleton = Singleton.getInstance();
          PreparedStatement ps = singleton.conn.prepareStatement("SELECT * FROM user WHERE email=?");
          ps.setString(1, Email);
          //Email
          
          ResultSet resultSet = ps.executeQuery();
          if (resultSet.next()) {
        	  //
        	  context.SendMail(Email, "","","");
                request.getRequestDispatcher("/connexion.jsp").forward(request, response);
            } else {
                getServletContext().setAttribute("msg", "Username or password error!!!");
                request.getRequestDispatcher("/mot_passe_oublier.jsp").forward(request, response);
            }
        }catch(Exception e) {
        	System.out.println(e.toString());
        }
    
	}}


