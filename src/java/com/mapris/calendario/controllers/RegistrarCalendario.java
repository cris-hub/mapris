/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.calendario.controllers;

import com.mapris.modelo.dao.CalendarioFacadeLocal;
import com.mapris.modelo.dao.RolFacadeLocal;
import com.mapris.modelo.entitie.Calendario;
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
    
    @EJB
    private CalendarioFacadeLocal cfl;
    
    
    private Calendario nuevoCalendario;

    public RegistrarCalendario() {
    }
    
    
    @PostConstruct
    public void  init(){
        nuevoCalendario  = new Calendario();
    }

    public Calendario getNuevoCalendario() {
        return nuevoCalendario;
    }

    public void setNuevoCalendario(Calendario nuevoUsuario) {
        this.nuevoCalendario = nuevoUsuario;
    }
    
    public void registrar(){
        if (nuevoCalendario != null) {
     
            cfl.create(nuevoCalendario);
            MessageUtil.enviarMensajeInformacion("form-registro", "Registro satisfactorio del calendario", "");
            
            init();
            
        } else{
            MessageUtil.enviarMensajeError("form-regitro", "no se han diligenciado los campos del calendario correctamente ", "");
        }
    }
    
    
    
    
    
    
    
    
}
