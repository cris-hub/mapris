/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.calendario.controllers;


import com.mapris.modelo.entitie.Rol;

import com.mapris.util.MessageUtil;
import java.util.ArrayList;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "registroCalendarioController")
@RequestScoped
public class RegistrarCalendario {
    
    

    public RegistrarCalendario() {
    }
    
    
    @PostConstruct
    public void  init(){
        
    }

    
    
    public void registrar(){
        String pollo="cucua";
        if (pollo.equals("1")) {
     
           
            MessageUtil.enviarMensajeInformacion("form-registro", "Registro satisfactorio del calendario", "");
            
            init();
            
        } else{
            MessageUtil.enviarMensajeError("form-regitro", "no se han diligenciado los campos del calendario correctamente ", "");
        }
    }
    
    
    
    
    
    
    
    
}
