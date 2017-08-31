/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.quartz.schedule;

import com.mapris.modelo.dao.UsuarioFacadeLocal;
import com.mapris.modelo.entitie.Usuario;
import java.util.List;

import javax.annotation.PostConstruct;

import javax.ejb.Stateless;
import javax.inject.Inject;


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
    
    @Inject
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
          
        String asunto = "Tenemos una promoción espectacular para ti";
        String contenido  = "<img src=\"/resources/img/pagesError/errorpage.png\">";
        email.enviarMassive(usuarios,asunto,contenido);
        System.out.println("Se pudo enviar los email");
            
        } catch (Exception e) {
            e.printStackTrace();
        System.out.println("No se pudo enviar el email");
        
        }
        
    }


}
