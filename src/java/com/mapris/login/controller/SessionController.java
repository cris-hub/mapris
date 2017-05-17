/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.login.controller;

import com.mapris.controller.rules.SessionRule;
import com.mapris.modelo.entitie.Permiso;
import com.mapris.modelo.entitie.Rol;
import com.mapris.modelo.entitie.Usuario;


import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.ejb.EJB;
import javax.faces.context.FacesContext;

/**
 *
 * @author Ismael
 */
@Named(value = "sessionController")
@SessionScoped
public class SessionController implements Serializable {

    @EJB
    private SessionRule sr;
    
    private String clave;
    private Long documento;
    private Rol rolSeleccionado;
    private Usuario usuario;
    /**
     * Creates a new instance of SessionController
     */
    public SessionController() {
    }
    
    @PostConstruct
    public void init(){
    }
    public String iniciarSesion(){
        String urlDestino = "";
        usuario = sr.iniciar(documento, clave);
        if(usuario != null){
            rolSeleccionado = sr.validarRol(usuario);
            if(rolSeleccionado != null){
                urlDestino = "/app/index.xhtml?faces-redirect=true";
            } else{
                usuario = null;
            }
        }
        return urlDestino;
    }

    public String cerrarSesion(){
        
        usuario = null;
        clave = null;
        documento = null;
        rolSeleccionado = null;
        FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
     
        return "/login.xhtml?faces-redirect=true";
    }
    public String getClave() {
        return clave;
    }
      public Boolean tienePermiso(String urlRecurso){
        if(urlRecurso.endsWith("app/index.xhtml")){
            return true;
        }
        for (Permiso p : rolSeleccionado.getPermisos()) {
            if(p.getUrl() != null && urlRecurso.endsWith(p.getUrl())){
                return true;
            }
        }
        return false;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public Long getDocumento() {
        return documento;
    }

    public void setDocumento(Long documento) {
        this.documento = documento;
    }

    public Rol getRolSeleccionado() {
        return rolSeleccionado;
    }

    public void setRolSeleccionado(Rol rolSeleccionado) {
        this.rolSeleccionado = rolSeleccionado;
    }

    public Usuario getUsuario() {
        return usuario;
    }
    
    
    public Boolean inicioSesion(){
        return (usuario != null);
    }
    
  
    
    
    @PreDestroy
    public void perDestroy(){
        cerrarSesion();
    }
    
    
}
