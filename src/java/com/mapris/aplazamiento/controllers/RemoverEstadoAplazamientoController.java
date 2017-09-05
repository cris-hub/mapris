
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.aplazamiento.controllers;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.EstadoFacadeLocal;
import com.mapris.modelo.dao.InscripcionFacadeLocal;
import com.mapris.modelo.dao.UsuarioFacadeLocal;
import com.mapris.modelo.entitie.Aplazamiento;
import com.mapris.modelo.entitie.Inscripcion;
import com.mapris.modelo.entitie.Usuario;
import com.mapris.util.MessageUtil;

import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;


import javax.inject.Inject;
import javax.inject.Named;

@Named(value = "removerEstadoAplazamientoController")
@ViewScoped
public class RemoverEstadoAplazamientoController implements Serializable{
//    cdi 
    
     @EJB
     private UsuarioFacadeLocal ufl;
     @EJB
     private InscripcionFacadeLocal ifl;
     @EJB
     private EstadoFacadeLocal efl;
     
     private Usuario usuario;
     
     private Inscripcion inscripcion;
     
     private Aplazamiento aplazamiento;
     
   

    
    public RemoverEstadoAplazamientoController() {
    }

    @PostConstruct
    public void init() {
        usuario = new Usuario();
        inscripcion = new Inscripcion();
       
    }
    
    public Aplazamiento getAplazamiento() {
        return aplazamiento;
    }

    public void setAplazamiento(Aplazamiento aplazamiento) {
        this.aplazamiento = aplazamiento;
    }

 
    
    
    public void cambiarEstadoAplazamiento(Aplazamiento a){
    
    this.aplazamiento = a;
    
        try {
            usuario = aplazamiento.getCliente().getUsuario();
            inscripcion = aplazamiento.getCliente().getInscripciones().get(0);
            usuario.setIdEstados(efl.find(1));
            inscripcion.setEstado("Activa");
            ufl.edit(usuario);
            ifl.edit(inscripcion);
            MessageUtil.enviarMensajeInformacionGlobal("El usuario esta ACTIVO", "Ahora el usuario puede ingresar al sistema");
        } catch (Exception e) {
            MessageUtil.enviarMensajeErrorGlobal("Error al cambiar los estados", "ocurrio un error en el servidor");
            
        }
    
        
    
   
    }
    
    public String getIconoEstado(Aplazamiento a){
        
        
        return (a.getCliente().getUsuario().getIdEstados().getIdEstados() == 1) ? "check" : "thumb-tack";

        
        }

  

    
    
    
  
    
    
   
}
