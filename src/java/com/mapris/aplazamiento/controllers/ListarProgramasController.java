
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.aplazamiento.controllers;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.ProgramaFacadeLocal;
import com.mapris.modelo.entitie.Programa;
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

    @EJB
    private ProgramaFacadeLocal programaFacadeLocal;

    private List<Programa> programas;

    private Programa programaSeleccionado;

    
    
    
    public ListarProgramasController() {
    }

    @PostConstruct
    public void init() {
        recargarProgramas();
    }
    
    private void recargarProgramas(){
        programas = programaFacadeLocal.findAll();
    }
    
    public ProgramaFacadeLocal getProgramaFacadeLocal() {
        return programaFacadeLocal;
    }

    public void setProgramaFacadeLocal(ProgramaFacadeLocal programaFacadeLocal) {
        this.programaFacadeLocal = programaFacadeLocal;
    }

    public List<Programa> getProgramas() {
        return programas;
    }

    public void setProgramaSeleccionado(Programa programaSeleccionado) {
        this.programaSeleccionado = programaSeleccionado;
    }


    public Programa getProgramaSeleccionado() {
        return programaSeleccionado;
    }
}
