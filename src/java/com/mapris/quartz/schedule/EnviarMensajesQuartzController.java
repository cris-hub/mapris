/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.quartz.schedule;

import com.mapris.modelo.dao.UsuarioFacadeLocal;
import com.mapris.modelo.entitie.Empresa;
import com.mapris.modelo.entitie.Usuario;
import static com.mapris.util.EnviarMail.HOST_EMAIL_GMAIL;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;
import java.util.Properties;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.context.ExternalContext;

import javax.inject.Named;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ruben
 */
@Named (value="enviarMensajeQuartz")
@RequestScoped
public class EnviarMensajesQuartzController {
    
    public final static String HOST_EMAIL_GMAIL = "smtp.gmail.com";
    @EJB
    private UsuarioFacadeLocal ufl;
    private List<Usuario> usuariosEmail;
    private ExternalContext pathInfo;
    
    private Session session;
    private MimeMessage mimeMessage;
     
    public EnviarMensajesQuartzController() {
    }
    
    @PostConstruct
    public void init(){
        usuariosEmail = ufl.findAll();
        
    }
    
    public void email(){
                 
    
        
        try {
            InternetAddress[] address = new InternetAddress[usuariosEmail.size()];
            
            for (int i = 0; i < usuariosEmail.size(); i++) {
                
                address[i] = new InternetAddress(usuariosEmail.get(i).getCorreoElectronico());
                
            }
            
            Properties propierties = new Properties();
                          
            
            propierties.setProperty("mail.smtp.host", HOST_EMAIL_GMAIL);
            propierties.setProperty("mail.smtp.starttls.enable", "true");
            propierties.setProperty("mail.smtp.port", "25"); //587-25
            propierties.setProperty("mail.smtp.user", "helpmaternityclub@gmail.com");
            propierties.setProperty("mail.smtp.auth", "true");
            
            session = Session.getDefaultInstance(propierties);
            mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress("helpmaternityclub@gmail.com"));
            mimeMessage.setRecipients(Message.RecipientType.TO, address);
            
            
        } catch (Exception e) {
            e.getStackTrace();
        }
        
    
    }
    
    
    private String doGet(HttpServletRequest req,
                         HttpServletResponse res)
            throws ServletException, IOException {

       
        String contextPath = req.getContextPath();
        System.out.println("Context Path: " + contextPath);
        return contextPath;

    }
    
    
    
      public boolean enviarMassive(){
          
          String path = "localhost";
           System.out.println("direccion "+path);
           String asunto = "Tenemos una promoción espectacular para ti";
           String contenido = "<img src=\""+ path +"/resources/img/pagesError/errorpage.png\">";
                
    
    
        try {
        email();
            mimeMessage.setSubject(asunto);
            mimeMessage.setContent(contenido, "text/html");
            Transport transport = session.getTransport("smtp");
            transport.connect("helpmaternityclub@gmail.com", "mapris12345678");
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
            transport.close();
            return true;
            
        } catch (MessagingException e) {
      e.printStackTrace();
        return false;
        }
    }

   
    
    
    
}
