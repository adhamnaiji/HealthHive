package Email_Pattern;

public class EmailContext {
	private EmailStrategy strategy;
	
	public void setStrategy(EmailStrategy strategy) {
        this.strategy = strategy;
    }
	
	public void SendMail(String mailTo, String subject, String date, String time) {
		strategy.SendMail(mailTo, subject, date, time);
	}

}
