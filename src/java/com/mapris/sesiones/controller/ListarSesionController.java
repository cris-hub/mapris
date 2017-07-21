
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.sesiones.controller;


import com.mapris.modelo.dao.SesionFacadeLocal;
import com.mapris.modelo.entitie.Sesion;
import com.mapris.util.MessageUtil;
import java.io.Serializable;

import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;

/**
 *
 * @author Ruben
 */
@Named(value = "listarSesionController")
@ViewScoped
public class ListarSesionController implements Serializable{
//    Code Dependention Injection


    @EJB
    private SesionFacadeLocal sesionFacadeLocal;

    private List<Sesion> sesiones;

    private Sesion sesionSeleccionado;
   

    
    
    
    public ListarSesionController() {
    }

    @PostConstruct
    public void init() {
        recargarSesiones();
       
    }
    
    private void recargarSesiones(){
        sesiones = sesionFacadeLocal.findAll();
    }
    
     public SesionFacadeLocal getSesionFacadeLocal() {
        return sesionFacadeLocal;
    }

    public void setSesionFacadeLocal(SesionFacadeLocal sesionFacadeLocal) {
        this.sesionFacadeLocal = sesionFacadeLocal;
    }

    public List<Sesion> getSesiones() {
        return sesiones;
    }

    public void setSesionSeleccionado(Sesion sesionSeleccionado) {
        this.sesionSeleccionado = sesionSeleccionado;
    }


    public Sesion getSesionSeleccionado() {
        return this.sesionSeleccionado;
    }
    
    public void eliminarSesion(){
     
        
        try {
            sesionFacadeLocal.remove(sesionSeleccionado);
            MessageUtil.enviarMensajeInformacionGlobal("Eliminación correcta","Se elimino correctamente las sesiones ");
        } catch (Exception e) {
            MessageUtil.enviarMensajeErrorGlobal("Error al eliminar las sesiones","No se puede eliminar las sesiones");
        }
        
    }
        
    
    
    

   


}
