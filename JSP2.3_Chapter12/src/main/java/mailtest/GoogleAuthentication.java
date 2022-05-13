package mailtest;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;

		public GoogleAuthentication() {
			passAuth = new PasswordAuthentication("ineee199105", "ceulufruqfvejzik");
		}
		
		public PasswordAuthentication getPasswordAuthentication() {
			return passAuth;
		}

}
