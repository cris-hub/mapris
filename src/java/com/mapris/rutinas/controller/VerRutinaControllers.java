/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.rutinas.controller;

import com.mapris.modelo.entitie.Rutina;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author Ruben
 */
@Named(value="verRutinasController")
@SessionScoped
public class VerRutinaControllers implements Serializable{
    
    private Rutina rutina;

    public VerRutinaControllers() {
    }
    
    @PostConstruct
    public void init(){
    }

    public Rutina getRutina() {
        return rutina;
    }

    public void setRutina(Rutina rutina) {
        this.rutina = rutina;
    }
    
    public String verRutina(Rutina e){
    this.rutina = e;
    return "/app/administrador/rutinas/ver.xhtml?faces-redirect=true";
    }
    
    
}
