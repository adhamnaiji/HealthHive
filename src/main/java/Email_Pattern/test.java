package Email_Pattern;

public class test {

	public static void main(String[] args) {
		EmailContext context = new EmailContext();
		EmailStrategy registrationStrategy = new RegistrationRendezVous();
		context.setStrategy(registrationStrategy);
		context.SendMail("adhemnaiji@gmail.com", "hello", "25/05/2023", "12:00:00");


	}

}
