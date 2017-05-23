/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.usuarios.controllers;

import com.mapris.modelo.dao.RolFacadeLocal;
import com.mapris.modelo.dao.UsuarioFacadeLocal;
import com.mapris.modelo.entitie.Rol;
import com.mapris.modelo.entitie.Usuario;
import com.mapris.util.MessageUtil;
import java.util.ArrayList;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "registroController")
@RequestScoped
public class RegistrarUsuario {
    
    @EJB
    private UsuarioFacadeLocal usuarioFacadeLocal;
    
    @EJB
    private RolFacadeLocal rolFacedaLocal;
    
    private Usuario nuevoUsuario;

    public RegistrarUsuario() {
    }
    
    
    @PostConstruct
    public void  init(){
        nuevoUsuario = new Usuario();
    }

    public Usuario getNuevoUsuario() {
        return nuevoUsuario;
    }

    public void setNuevoUsuario(Usuario nuevoUsuario) {
        this.nuevoUsuario = nuevoUsuario;
    }
    
    public void registrar(){
        if (nuevoUsuario != null) {
            nuevoUsuario.setRoles(new ArrayList<Rol>());
            nuevoUsuario.getRoles().add(rolFacedaLocal.find(2));
            nuevoUsuario.setEstado(2);
            usuarioFacadeLocal.create(nuevoUsuario);
            MessageUtil.enviarMensajeInformacion("form-registro", "Registro satisfactorio", "");
            init();
        } else{
            MessageUtil.enviarMensajeError("form-regitro", "no se han dioligenciado los campos ", "");
        }
    }
    
    
    
    
    
    
    
    
}
