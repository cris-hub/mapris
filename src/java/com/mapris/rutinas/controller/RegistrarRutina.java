/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.rutina.controller;

import com.mapris.modelo.dao.RutinaFacadeLocal;
import com.mapris.modelo.dao.RolFacadeLocal;
import com.mapris.modelo.entitie.Rutina;
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
@Named(value = "registroRutinaController")
@RequestScoped
public class RegistrarRutina {
    
    @EJB
    private RutinaFacadeLocal rfl;
    
    
    private Rutina nuevaRutina;

    public RegistrarRutina() {
    }
    
    
    @PostConstruct
    public void  init(){
        nuevaRutina  = new Rutina();
    }

    public Rutina getNuevoRutina() {
        return nuevaRutina;
    }

    public void setNuevoRutina(Rutina nuevaRutina) {
        this.nuevaRutina = nuevaRutina;
    }
    
    public void registrar(){
        if (nuevaRutina != null) {
     
            rfl.create(nuevaRutina);
            MessageUtil.enviarMensajeInformacion("form-registro", "Registro satisfactorio del calendario", "");
            
            init();
            
        } else{
            MessageUtil.enviarMensajeError("form-regitro", "no se han diligenciado los campos del calendario correctamente ", "");
        }
    }
    
    
    
    
    
    
    
    
}
