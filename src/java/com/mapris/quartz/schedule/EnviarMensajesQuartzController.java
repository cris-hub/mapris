/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.quartz.schedule;


import com.mapris.modelo.entitie.Usuario;


import java.util.List;
import java.util.Properties;


import javax.mail.Message;

import javax.mail.Session;
import javax.mail.Transport;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 *
 * @author Ruben
 */

public class EnviarMensajesQuartzController {
    
    public final static String HOST_EMAIL_GMAIL = "smtp.gmail.com";
    
    private List<Usuario> usuariosEmail;
    
    
    private Session session;
    private MimeMessage mimeMessage;
     
    public EnviarMensajesQuartzController() {
    }
        
    
    public boolean enviarMassive(List<Usuario> usuario, String asunto, String contenido){
                  
    
    
        try {
           
          
            
            Properties propierties = new Properties();
                          
            
            propierties.setProperty("mail.smtp.host", HOST_EMAIL_GMAIL);
            propierties.setProperty("mail.smtp.starttls.enable", "true");
            propierties.setProperty("mail.smtp.port", "587"); //587-25
            propierties.setProperty("mail.smtp.user", "helpmaternityclub@gmail.com");
            propierties.setProperty("mail.smtp.auth", "true");
            
            this.session = Session.getDefaultInstance(propierties);
            this.mimeMessage = new MimeMessage(this.session);
            this.mimeMessage.setFrom(new InternetAddress("helpmaternityclub@gmail.com"));
             
            InternetAddress[] address = new InternetAddress[usuario.size()];
            
            for (int i = 0; i < usuario.size(); i++) {
                
                address[i] = new InternetAddress(usuario.get(i).getCorreoElectronico());
                
            }
            this.mimeMessage.setRecipients(Message.RecipientType.TO, address);
            
            
            this.mimeMessage.setSubject(asunto);
            this.mimeMessage.setContent(contenido, "text/html");
            Transport transport = this.session.getTransport("smtp");
            transport.connect("helpmaternityclub@gmail.com", "mapris12345678");
            transport.sendMessage(this.mimeMessage, this.mimeMessage.getAllRecipients());
            transport.close();
            return true;
            
        } catch (Exception e) {
        e.printStackTrace();
        return false;
        }
    }

   
    
    
    
}
