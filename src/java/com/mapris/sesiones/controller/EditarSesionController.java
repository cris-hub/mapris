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
import java.util.Date;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author Ruben
 */
@Named(value = "editarSesionController")
@SessionScoped
public class EditarSesionController implements Serializable {

    @EJB
    private SesionFacadeLocal ifl;
    
    private Sesion sesionSeleccionada;
   
    
    @PostConstruct
    public void init(){
    sesionSeleccionada = new Sesion();
    }

    public EditarSesionController() {
    }

    public Sesion getSesionSelecionada() {
        return sesionSeleccionada;
    }

    public void setSesionSelecionada(Sesion sesionSeleccionada) {
        this.sesionSeleccionada = sesionSeleccionada;
    }

   public void actualizarDatos() {
        try {
            
            
            
            sesionSeleccionada.setNumeroSesiones(sesionSeleccionada.getNumeroSesiones());
//       
            
            ifl.edit(sesionSeleccionada);
            MessageUtil.enviarMensajeInformacionGlobal("Actualizacion", "los datos fueron actualizados");
        } catch (Exception e) {
            e.printStackTrace();
            MessageUtil.enviarMensajeErrorGlobal("Error al modificar los datos de la inscripción", e.getStackTrace().toString());
        }

    }
    
    public String preModificar(Sesion i){
        setSesionSelecionada(i);
        return "/app/administrador/sesiones/editar.xhtml?faces-redirect=true";
    }
    
   

    
    
      
    

}
