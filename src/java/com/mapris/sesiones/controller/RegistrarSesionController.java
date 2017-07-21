/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.sesiones.controller;

import com.mapris.modelo.dao.EstadoFacadeLocal;
import com.mapris.modelo.dao.RolFacadeLocal;
import com.mapris.modelo.dao.SesionFacadeLocal;
import com.mapris.modelo.entitie.Rol;

import com.mapris.modelo.entitie.Sesion;
import com.mapris.util.MessageUtil;
import java.util.ArrayList;
import java.util.Calendar;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "registroSesionController")
@RequestScoped
public class RegistrarSesionController {

    @EJB
    private SesionFacadeLocal sesionFacadeLocal;


    private Sesion nuevaSesion;
    private Calendar hoy;

    public RegistrarSesionController() {
    }

    @PostConstruct
    public void init() {
        nuevaSesion = new Sesion();

    }

    public Sesion getNuevoSesion() {
        return nuevaSesion;
    }

    public void setNuevoSesion(Sesion nuevaSesion) {
        this.nuevaSesion = nuevaSesion;
    }

    public void registrar() {
        if (nuevaSesion != null) {
        
        
        try{
                
                nuevaSesion.setIdSesiones(nuevaSesion.getIdSesiones());
               
                nuevaSesion.setNumeroSesiones(nuevaSesion.getNumeroSesiones());
                
                
                sesionFacadeLocal.create(nuevaSesion);
               
                MessageUtil.enviarMensajeInformacionGlobal("Registro satisfactorio", "El usuario se ha creado con exito");
                init();
                
                
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            MessageUtil.enviarMensajeInformacionGlobal( "Error al registrar el usuario", "No se pudo registrar el usuario");
        }
    }

}
