/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.sesiones.controller;

import com.mapris.modelo.entitie.Sesion;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author Ruben
 */
@Named(value="verSesionController")
@SessionScoped
public class VerSesionController implements Serializable{
    
    private Sesion sesion;

    public VerSesionController() {
    }
    
    @PostConstruct
    public void init(){
    }

    public Sesion getSesion() {
        return sesion;
    }

    public void setSesion(Sesion sesion) {
        this.sesion = sesion;
    }
    
    public String verSesion(Sesion i){
    this.sesion = i;
    return "/app/administrador/sesiones/ver.xhtml?faces-redirect=true";
    }
    
    
}
