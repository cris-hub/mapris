/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.programas.controller;

import com.mapris.modelo.entitie.Programa;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author Ruben
 */
@Named(value="verProgramaController")
@SessionScoped
public class VerProgramasController implements Serializable{
    
    private Programa programa;

    public VerProgramasController() {
    }
    
    @PostConstruct
    public void init(){
    }

    public Programa getPrograma() {
        return programa;
    }

    public void setPrograma(Programa programa) {
        this.programa = programa;
    }
    
    public String verPrograma(Programa i){
    this.programa = i;
    return "/app/administrador/programas/ver.xhtml?faces-redirect=true";
    }
    
    
}
