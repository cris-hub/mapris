/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.quartz.schedule;

import com.mapris.modelo.dao.UsuarioFacadeLocal;

import com.mapris.modelo.entitie.Usuario;

import java.io.IOException;

import java.util.List;
import java.util.Properties;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.enterprise.context.RequestScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import javax.inject.Named;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ruben
 */

public class EnviarMensajesQuartzController {
    
    public final static String HOST_EMAIL_GMAIL = "smtp.gmail.com";
    
    private List<Usuario> usuariosEmail;
    private String asunto = "Tenemos una promoción espectacular para ti";
    private String contenido  = "<img src=\"/resources/img/pagesError/errorpage.png\">";
    
    private Session session;
    private MimeMessage mimeMessage;
     
    public EnviarMensajesQuartzController() {
    }
    
   
    
    public void email(List<Usuario> usuarios){
                 
    
        
        try {
            InternetAddress[] address = new InternetAddress[usuarios.size()];
            
            for (int i = 0; i < usuarios.size(); i++) {
                
                address[i] = new InternetAddress(usuarios.get(i).getCorreoElectronico());
                
            }
            
            Properties propierties = new Properties();
                          
            
            propierties.setProperty("mail.smtp.host", HOST_EMAIL_GMAIL);
            propierties.setProperty("mail.smtp.starttls.enable", "true");
            propierties.setProperty("mail.smtp.port", "587"); //587-25
            propierties.setProperty("mail.smtp.user", "helpmaternityclub@gmail.com");
            propierties.setProperty("mail.smtp.auth", "true");
            
            this.session = Session.getDefaultInstance(propierties);
            this.mimeMessage = new MimeMessage(this.session);
            this.mimeMessage.setFrom(new InternetAddress("helpmaternityclub@gmail.com"));
            this.mimeMessage.setRecipients(Message.RecipientType.TO, address);
            
            
        } catch (Exception e) {
            e.getStackTrace();
        }
        
    
    }
    
    
    
    
    
      public boolean enviarMassive(List<Usuario> usuario){
                  
    
    
        try {
           
            email(usuario);
            this.mimeMessage.setSubject(this.asunto);
            this.mimeMessage.setContent(this.contenido, "text/html");
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
