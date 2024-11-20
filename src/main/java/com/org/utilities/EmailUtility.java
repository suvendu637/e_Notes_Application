package com.org.utilities;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtility {

    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "465";
//    private static final String SENDER_EMAIL = "your-email@gmail.com"; // Your Gmail address
//    private static final String SENDER_PASSWORD = "your-app-password"; // App password generated from Gmail

    
    private static final String SENDER_EMAIL = "suvendukar774@gmail.com"; // Your Gmail address
    private static final String SENDER_PASSWORD = "kalb lrjg hzfo doxx"; // App password generated from Gmail , go to app and password 

    /**
     * Sends an email with the verification code.
     *
     * @param recipientEmail The user's email address.
     * @param verificationCode The code to be sent.
     * @throws MessagingException If there's an issue with the email sending process.
     */
    public static void sendVerificationCode(String recipientEmail, String verificationCode) throws MessagingException {
        // Configure email properties
        Properties properties = new Properties();
        properties.setProperty("mail.smtp.host", SMTP_HOST);
        properties.setProperty("mail.smtp.port", SMTP_PORT);
        properties.setProperty("mail.smtp.ssl.enable", "true");
        properties.setProperty("mail.smtp.auth", "true");

        // Create a mail session with authentication
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });

        session.setDebug(true);

        // Create the email message
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(SENDER_EMAIL)); // Sender's email
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail)); // Recipient's email
        message.setSubject("Password Reset Code"); // Email subject
        message.setText("Your password reset verification code is: " + verificationCode); // Email content

        // Send the email
        Transport.send(message);
        System.out.println("Verification code sent successfully to: " + recipientEmail);
    }
}
