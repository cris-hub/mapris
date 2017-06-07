/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.usuarios.controllers;

import com.mapris.modelo.dao.UsuarioFacadeLocal;
import com.mapris.modelo.entitie.Correo;
import com.mapris.modelo.entitie.Usuario;
import com.mapris.util.MessageUtil;
import java.io.Serializable;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "editarUsuarioController")
@SessionScoped
public class EditarUsuarioController implements Serializable {

    @EJB
    private UsuarioFacadeLocal ufl;
    
    private Usuario usuarioSelecionado;

    public EditarUsuarioController() {
    }

    public Usuario getUsuarioSelecionado() {
        return usuarioSelecionado;
    }

    public void setUsuarioSelecionado(Usuario usuarioSelecionado) {
        this.usuarioSelecionado = usuarioSelecionado;
    }

    public void actualizarDatos() {
        try {
            ufl.edit(usuarioSelecionado);
            MessageUtil.enviarMensajeInformacion("form-editar", "Actualizacion", "los datos fueron actualizados");
        } catch (Exception e) {
            MessageUtil.enviarMensajeErrorGlobal("Error al modificar los datos del usuario", e.getStackTrace().toString());
        }

    }
    
    public String preModificar(Usuario u){
        setUsuarioSelecionado(u);
        return "/app/usuarios/editar.xhtml?faces-redirect=true";
    }
    
        public void cambioDeEstado(Usuario u){
        try {
            if (u.getEstado().getNombre().equals("1")) {
                u.getEstado().setNombre("2");
                u.setCorreos(usuarioSelecionado.getCorreos());
                u.setDirecciones(usuarioSelecionado.getDirecciones());
                u.setTelefonos(usuarioSelecionado.getTelefonos());
                u.setClientes(usuarioSelecionado.getClientes());
            } else {
                u.getEstado().setNombre("1");
            }
            ufl.edit(u);
            MessageUtil.enviarMensajeInformacion("form-data-table-usuarios", "Actualización", "Se ha cambiado el estado del usuario.");
        } catch (Exception e) {
            e.printStackTrace();
            MessageUtil.enviarMensajeErrorGlobal("Errcambiar el estado del usuario", e.getStackTrace().toString());
        }
        
        
    }
    
    public String getIconUsuarioBloqueo(Usuario u){
        return (u.getEstado().getNombre().equals("1")) ? "unlock": "lock";
    }

}
