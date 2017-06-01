/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.perfil.controller;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.UsuarioFacadeLocal;
import com.mapris.modelo.entitie.Usuario;
import com.mapris.util.MessageUtil;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;

/**
 *
 * @author Ruben
 */
@Named(value = "modificarPerfilController")
@ViewScoped
public class ModificarPerfilController implements Serializable{

    @Inject
    private SessionController sc;
    
    @EJB
    private UsuarioFacadeLocal ufl;
    
    private Usuario usuarioModificar;
    
    /**
     * Creates a new instance of ModificarPerfilController
     */
    public ModificarPerfilController() {
      
    }
    
    @PostConstruct
    public void init(){
    
    
    }

    public SessionController getSc() {
        return sc;
    }

    public void setSc(SessionController sc) {
        this.sc = sc;
    }

    public Usuario getUsuarioModificar() {
        return usuarioModificar;
    }

    public void setUsuarioModificar(Usuario usuarioModificar) {
        this.usuarioModificar = usuarioModificar;
    }
    
    
    
    public void modificarDatos(){
    
        try {
        
            setUsuarioModificar(getSc().getUsuario());
        
            ufl.edit(this.usuarioModificar); 
        
            MessageUtil.enviarMensajeInformacion("form-editar", "Actualizacion", "los datos fueron actualizados");
        } catch (Exception e) {
            MessageUtil.enviarMensajeErrorGlobal("Error al modificar los datos del usuario", e.getStackTrace().toString());
        }
        
       
    
    
    }
    
}
