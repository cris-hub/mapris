/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.rutinas.controller;


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
    


    public VerRutinaControllers() {
    }
    
    @PostConstruct
    public void init(){
    }

    
    public String verRutina(){
   
    return "/app/administrador/rutinas/ver.xhtml?faces-redirect=true";
    }
    
    
}
