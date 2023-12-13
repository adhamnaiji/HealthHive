package Email_Pattern;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import ClassMétier.Singleton;

public class ResetPassword implements EmailStrategy{

	@Override
	public void SendMail(String mailTo, String subject, String date, String time) {
		//
		 try {
	            Singleton singleton = Singleton.getInstance();
	            PreparedStatement ps = singleton.conn.prepareStatement("SELECT * FROM user WHERE email=?");
	            ps.setString(1, mailTo);
	            //Email
	            
	            ResultSet resultSet = ps.executeQuery();
	            if (resultSet.next()) {
	                System.out.println("el email li nsetou"+resultSet.getInt("id"));
	                String Password=(String)resultSet.getString("password");
	                //send email
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
	        		message1.setSubject("Getting password");
	        		message1.setText("your password is :"+Password);
	        		Transport.send(message1);
	        		System.out.println("DONE");
	        		} catch (MessagingException e) {
	        		// TODO: handle exception
	        		e.printStackTrace();
	        		}
		//

}
		 }catch(Exception e) {
			 System.out.println(e.toString());
			 
		 }
}}
