/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.usuarios.controllers;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.UsuarioFacadeLocal;
import com.mapris.modelo.entitie.Usuario;
import com.mapris.util.MessageUtil;
import java.io.Serializable;
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
@Named(value = "listarUsuaariosController")
@ViewScoped
public class ListarUsuariosController implements Serializable{
//    cdi 

    @Inject
    private SessionController sessionController;

    @EJB
    private UsuarioFacadeLocal usuarioFacadeLocal;

    private List<Usuario> usuarios;

    private Usuario usuarioSeleccionado;

    
    
    
    public ListarUsuariosController() {
    }

    @PostConstruct
    public void init() {
        recargarUsuarios();
    }
    
    private void recargarUsuarios(){
        usuarios = usuarioFacadeLocal.findAll();
    }
    
    public void eliminarUsuario(){
        Usuario uS = sessionController.getUsuario();
        System.out.println("El usuario que inicio sesión es: " + uS.getPrimerNombre());
        System.out.println("Voy a eliminar el usuario: " + usuarioSeleccionado.getPrimerNombre());
        if(uS.getCedula().intValue() != usuarioSeleccionado.getCedula()){
            usuarioFacadeLocal.remove(usuarioSeleccionado);
            recargarUsuarios();
        } else{
            MessageUtil.enviarMensajeError(null, "Error al eliminar", "No puede elimarse usted mismo");
        }
    }
        
    
    
    

    public UsuarioFacadeLocal getUsuarioFacadeLocal() {
        return usuarioFacadeLocal;
    }

    public void setUsuarioFacadeLocal(UsuarioFacadeLocal usuarioFacadeLocal) {
        this.usuarioFacadeLocal = usuarioFacadeLocal;
    }

    public List<Usuario> getUsuarios() {
        return usuarios;
    }

    public void setUsuarioSeleccionado(Usuario usuarioSeleccionado) {
        this.usuarioSeleccionado = usuarioSeleccionado;
    }


    public Usuario getUsuarioSeleccionado() {
        return usuarioSeleccionado;
    }


}
