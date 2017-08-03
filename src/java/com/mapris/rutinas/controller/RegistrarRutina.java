/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.rutinas.controller;



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
@Named(value = "registroRutinaController")
@RequestScoped
public class RegistrarRutina {


    public RegistrarRutina() {
    }
    
    
    @PostConstruct
    public void  init(){
        
    }

    
    
    public void registrar(){
//        if (nuevaRutina != null) {
//     
//            rfl.create(nuevaRutina);
//            MessageUtil.enviarMensajeInformacion("form-registro", "Registro satisfactorio del calendario", "");
//            
//            init();
//            
//        } else{
//            MessageUtil.enviarMensajeError("form-regitro", "no se han diligenciado los campos del calendario correctamente ", "");
//        }
    }
    
    
    
    
    
    
    
    
}
