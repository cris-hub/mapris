/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.controllers;

import com.mapris.modelo.entities.Usuario;
import com.mapris.modelo.facade.UsuarioFacade;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.enterprise.context.Dependent;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;

/**
 *
 * @author SMEGS
 */
@Named(value = "registroController")
@ViewScoped
public class RegistroController implements Serializable {

    @EJB
    private UsuarioFacade usuarioEJB;

    private Usuario usuario;

    @PostConstruct
    public void init() {
        usuario = new Usuario();

    }

    /**
     * Creates a new instance of RegistroController
     */
    public RegistroController() {

    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String  registrar() {
        String url;
        try {
            usuarioEJB.create(usuario);
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Aviso", "Se registro Exitosamente"));
             return url = "/login.xhtml?faces-redict=true";
        } catch (Exception e) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Aviso", "Error "));
        }
        return null;
    }

}
