
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.inscripciones.controller;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.InscripcionFacadeLocal;
import com.mapris.modelo.entitie.Inscripcion;
import com.mapris.util.MessageUtil;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;


import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "listarInscripcionController")
@ViewScoped
public class ListarInscripcionController implements Serializable{
//    cdi 

    @Inject
    private SessionController sessionController;

    @EJB
    private InscripcionFacadeLocal inscripcionFacadeLocal;

    private List<Inscripcion> inscripciones;

    private Inscripcion inscripcionSeleccionado;

    
    
    
    public ListarInscripcionController() {
    }

    @PostConstruct
    public void init() {
        recargarInscripcions();
    }
    
    private void recargarInscripcions(){
        inscripciones = inscripcionFacadeLocal.findAll();
    }
    
    public void eliminarInscripcion(){
        
        Date hoy = new Date();
       
        if(inscripcionSeleccionado.getFechaInicio().getDay() == hoy.getDay() && 
                inscripcionSeleccionado.getFechaInicio().getMonth() == hoy.getMonth() &&
                inscripcionSeleccionado.getFechaInicio().getYear() == hoy.getYear()){
            MessageUtil.enviarMensajeError(null, "Error al eliminar", "No se puede eliminar una inscripción que entra el mismo día de vigencia");
        } else{
            inscripcionFacadeLocal.remove(inscripcionSeleccionado);
            recargarInscripcions();
        }
        
    }
        
    
    
    

    public InscripcionFacadeLocal getInscripcionFacadeLocal() {
        return inscripcionFacadeLocal;
    }

    public void setInscripcionFacadeLocal(InscripcionFacadeLocal inscripcionFacadeLocal) {
        this.inscripcionFacadeLocal = inscripcionFacadeLocal;
    }

    public List<Inscripcion> getInscripciones() {
        return inscripciones;
    }

    public void setInscripcionSeleccionado(Inscripcion inscripcionSeleccionado) {
        this.inscripcionSeleccionado = inscripcionSeleccionado;
    }


    public Inscripcion getInscripcionSeleccionado() {
        return this.inscripcionSeleccionado;
    }


}
