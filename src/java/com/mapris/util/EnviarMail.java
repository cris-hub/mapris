/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.util;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author APRENDIZ
 */
public class EnviarMail {
    
    public final static String HOST_EMAIL_GMAIL = "smtp.gmail.com";
    private String  emailRemitente;
    private String  passRemitente;
    private String emailDestinatario;
    
    private Session session;
    private MimeMessage mimeMessage;

    public EnviarMail() {
    }

    public EnviarMail(String emailRemitente, String passRemitente, String emailDestinatario) {
        this.emailRemitente = emailRemitente;
        this.passRemitente = passRemitente;
        this.emailDestinatario = emailDestinatario;
    }
    
    private void init(){
    
        try {
            Properties propierties = new Properties();
            
            propierties.setProperty("mail.smtp.host", HOST_EMAIL_GMAIL);
            propierties.setProperty("mail.smtp.starttls.enable", "true");
            propierties.setProperty("mail.smtp.port", "25"); //587-25
            propierties.setProperty("mail.smtp.user", this.emailRemitente);
            propierties.setProperty("mail.smtp.auth", "true");
            
            session = Session.getDefaultInstance(propierties);
            mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(emailRemitente));
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(emailDestinatario));
        } catch (MessagingException messagingException) {
            
        }
        
         
    }
    
    public boolean enviarBasic(String asunto, String contenido){
    
    
        try {
            init();
            mimeMessage.setSubject(asunto);
            
            mimeMessage.setContent(contenido, "text/html");
            Transport transport = session.getTransport("smtp");
            transport.connect(emailRemitente, passRemitente);
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
            transport.close();
            return true;
            
        } catch (MessagingException messagingException) {
        
        return false;
        }
    }
    
    
    
}
