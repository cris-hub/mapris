/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.rutinasservicios.controller;

import com.mapris.modelo.entitie.Rutinaservicio;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author Ruben
 */
@Named(value="verRutinaServicioController")
@SessionScoped
public class VerRutinaServicioController implements Serializable{
    
    private Rutinaservicio rutinaServicio;

    public VerRutinaServicioController() {
    }
    
    @PostConstruct
    public void init(){
    }

    public Rutinaservicio getRutinaServicio() {
        return rutinaServicio;
    }

    public void setRutinaServicio(Rutinaservicio servicio) {
        this.rutinaServicio = servicio;
    }
    
    public String verRutinaservicio(Rutinaservicio i){
    this.rutinaServicio = i;
    return "/app/administrador/rutinaservicios/ver.xhtml?faces-redirect=true";
    }
    
    
}
