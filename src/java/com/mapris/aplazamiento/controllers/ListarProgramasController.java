
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.aplazamiento.controllers;

import com.mapris.login.controller.SessionController;

import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;


import javax.inject.Inject;
import javax.inject.Named;

@Named(value = "listarProgramasController")
@ViewScoped
public class ListarProgramasController implements Serializable{
//    cdi 

    @Inject
    private SessionController sessionController;

  

    
    
    
    public ListarProgramasController() {
    }

    @PostConstruct
    public void init() {
       
    }
    
    
   
}
