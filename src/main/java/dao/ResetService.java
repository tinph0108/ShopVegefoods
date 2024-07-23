package dao;

import java.time.LocalDateTime;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ResetService {

    private final int LIMIT_MINUS = 10;
    private final String email = "tinphan309z@gmail.com";
    private final String password = "bkhhxzgpysimsvlu"; // Đảm bảo rằng đây là mật khẩu ứng dụng

    public String generateToken() {
        return UUID.randomUUID().toString();
    }

    public LocalDateTime expireDateTime() {
        return LocalDateTime.now().plusMinutes(LIMIT_MINUS);
    }

    public boolean isExpireTime(LocalDateTime expireDateTime) {
        return LocalDateTime.now().isAfter(expireDateTime);
    }

    public boolean sendEmailRS(String to, String link, String name) {
        // send email
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(email, password);
            }
        };

        Session session = Session.getInstance(props, auth);
        MimeMessage msg = new MimeMessage(session);
        try {
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(new InternetAddress(email));
            msg.setRecipients(javax.mail.Message.RecipientType.TO, InternetAddress.parse(to, false));
            msg.setSubject("Reset Password", "UTF-8");
            String content = "<html>"
            	    + "<head>"
            	    + "<style>"
            	    + "body { font-family: Arial, sans-serif; line-height: 1.6; }"
            	    + ".container { padding: 20px; border: 1px solid #ddd; border-radius: 10px; max-width: 600px; margin: auto; background-color: #f9f9f9; }"
            	    + "h1 { color: #333; }"
            	    + "p { color: #666; }"
            	    + "a { color: #5cb85c; text-decoration: none; }"
            	    + "a:hover { color: #4cae4c; }"
            	    + ".button { display: inline-block; padding: 10px 20px; background-color: #5cb85c; color: white; border-radius: 5px; text-decoration: none; }"
            	    + ".button:hover { background-color: #4cae4c; }"
            	    + "</style>"
            	    + "</head>"
            	    + "<body>"
            	    + "<div class='container'>"
            	    + "<h1>Hi " + name + ",</h1>"
            	    + "<p>We received a request to reset your password. Please click the link below to proceed with resetting your password:</p>"
            	    + "<p><a href='" + link + "' class='button'>Reset Your Password</a></p>"
            	    + "<p>If you did not request a password reset, please ignore this email or contact support if you have questions.</p>"
            	    + "<p>Thank you,</p>"
            	    + "<p>The Support Team</p>"
            	    + "</div>"
            	    + "</body>"
            	    + "</html>";

            msg.setContent(content, "text/html; charset=UTF-8");
            Transport.send(msg);
            System.out.println("Email sent successfully");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Email sent failed");
            return false;
        }
    }
}
