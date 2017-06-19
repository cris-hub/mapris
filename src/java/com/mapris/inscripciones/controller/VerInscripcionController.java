/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.inscripciones.controller;

import com.mapris.modelo.entitie.Inscripcion;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value="verInscripcionController")
@SessionScoped
public class VerInscripcionController implements Serializable{
    
    private Inscripcion inscripcion;

    public VerInscripcionController() {
    }
    
    @PostConstruct
    public void init(){
    }

    public Inscripcion getInscripcion() {
        return inscripcion;
    }

    public void setInscripcion(Inscripcion inscripcion) {
        this.inscripcion = inscripcion;
    }
    
    public String verInscripcion(Inscripcion u){
    this.inscripcion = u;
    return "/app/administrador/ver.xhtml?faces-redirect=true";
    }
    
    
}
