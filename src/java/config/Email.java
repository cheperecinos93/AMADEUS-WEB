/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Familia Aparicio
 */
public class Email {
    
    private Properties properties;
    private Session session;
    
    private void init_msg(){
        properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
 
	session = Session.getInstance(properties,new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("amadeusair.info@gmail.com", "amadeus2016");
            }
        });       
    }
    
    public void msg_registro(String correo){
        try {
            init_msg();
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("amadeusair.info@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(correo));
            message.setSubject("AMADEUS AIR");
            String html = "<center>\n" +
            "<h2>BIENVENIDO A AMADEUS AIRLINES</h2>\n" +
            "<h3>Tu cuenta esta activada y lista para iniciar sesi&oacute;n gracias por preferirnos</h3>\n" +
            "</center>\n" +
            "<section style=\"background-color:#ff0039; color:white; text-align:right;\"> AMADEUS AIRLINES <br> Confirmaci&oacute;n de registro</section>";
            message.setContent(html, "text/html; charset=utf-8");
            Transport.send(message);
            System.out.println("Mensaje Enviado"); 
        }
        catch (MessagingException e) {
            System.out.println("Hubo un error al enviar el mensaje.");  
            throw new RuntimeException(e);
        }
    }
    
    public void msg_reserva(){
        try {
            init_msg();
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("amadeusair.info@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("rodrigoaguilucho93@hotmail.com"));
            message.setSubject("AMADEUS AIR");
            message.setText("AMADEUS AIR PRUEBA");
            Transport.send(message);
            System.out.println("Mensaje Enviado"); 
        }
        catch (MessagingException e) {
            System.out.println("Hubo un error al enviar el mensaje.");  
            throw new RuntimeException(e);
        }
    }
    
    public void msg_checkin(){
        try {
            init_msg();
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("amadeusair.info@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("rodrigoaguilucho93@hotmail.com"));
            message.setSubject("AMADEUS AIR");
            message.setText("AMADEUS AIR PRUEBA");
            Transport.send(message);
            System.out.println("Mensaje Enviado"); 
        }
        catch (MessagingException e) {
            System.out.println("Hubo un error al enviar el mensaje.");  
            throw new RuntimeException(e);
        }
    }
}
