package Email_Pattern;

public interface EmailStrategy {
	public void SendMail(String mailTo,String subject,String date,String time);

}
