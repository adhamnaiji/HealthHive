package Email_Pattern;

import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class RegistrationRendezVous implements EmailStrategy{

	@Override
	public void SendMail(String mailTo, String subject, String date, String time) {
		
		final String maill="bonsoincentre.info@gmail.com";
		final String pass="ijfblvadxezpluiz";
		Properties props= new Properties(); 
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		Session session1 = Session.getInstance(props, new javax.mail.Authenticator() 
		{
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication (maill, pass);
			}
		});
		
		try {
		
		Message message1 = new MimeMessage(session1);
		message1.setFrom(new InternetAddress("bonsoincentre.info@gmail.com"));
		System.out.println("1");
		message1.setRecipients (Message.RecipientType.TO, InternetAddress.parse(mailTo));
		message1.setSubject(subject);
		message1.setText("vous avez fait un rendez vous le :"+date+" a :"+time);
		Transport.send(message1);
		System.out.println("DONE");
		} catch (MessagingException e) {
		// TODO: handle exception
		e.printStackTrace();
		}
    }
}
		
	
