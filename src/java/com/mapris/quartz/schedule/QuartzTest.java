/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.quartz.schedule;

import com.mapris.modelo.dao.UsuarioFacadeLocal;
import com.mapris.modelo.entitie.Usuario;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 *
 * @author APRENDIZ
 */
@Stateless
public class QuartzTest implements Job {
    
    
    private EnviarMensajesQuartzController email;
    
    @EJB
    private UsuarioFacadeLocal ufl;
   
    private List<Usuario> usuarios;
    
    public QuartzTest() {
    } 
    
    @PostConstruct
    public void init(){
    usuarios = ufl.findAll();
    email = new EnviarMensajesQuartzController();
    
    }
    
    @Override
    public void execute(JobExecutionContext ctx) throws JobExecutionException {
        try {
          
        
        email.enviarMassive(usuarios);
        System.out.println("Se pudo enviar los email");
            
        } catch (Exception e) {
            e.printStackTrace();
        System.out.println("No se pudo enviar el email");
        
        }
        
    }


}
