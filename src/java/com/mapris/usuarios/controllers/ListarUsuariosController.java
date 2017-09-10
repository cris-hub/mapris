
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
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;

import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "listarUsuaariosController")
@ViewScoped
public class ListarUsuariosController implements Serializable {
//    cdi 

    
    @Inject
    private SessionController sc;
    @EJB
    private UsuarioFacadeLocal usuarioFacadeLocal;

    private List<Usuario> usuarios;

    private Usuario usuarioSeleccionado;
    private Properties properties;

    public ListarUsuariosController() {
    }

    @PostConstruct
    public void init() {
        leerArchivo();
        recargarUsuarios();
         
    }

    private void recargarUsuarios() {
        usuarios = usuarioFacadeLocal.findAdministrador();
    }

    public void eliminarUsuario() {
        Usuario uS = sc.getUsuario();
     
        if (uS.getIdUsuario() != usuarioSeleccionado.getIdUsuario()) {
            usuarioFacadeLocal.remove(usuarioSeleccionado);
            recargarUsuarios();
            
        } else {

            MessageUtil.enviarMensajeErrorGlobal("Error al eliminar el administrador","El administrador al que intentas eliminar es el usuario en sesión y no se puede eliminar");
        }
    }

    public Properties getProperties() {
        return properties;
    }

    public void setProperties(Properties properties) {
        this.properties = properties;
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

    public static ExternalContext getExternalContext() {
        ExternalContext ec = FacesContext.getCurrentInstance().getExternalContext();
        return ec;
    }

    private Properties leerArchivo() {
        try {
            
            Properties prop = new Properties();
            if (sc.getSeleccionarLenguaje().toString().substring(0, 2).equals("es")) {
            prop.load(ListarUsuariosController.class.getClassLoader().getResourceAsStream("com/mapris/languages/app/App.properties"));
                
            }
            if (sc.getSeleccionarLenguaje() == null) {
                sc.setSeleccionarLenguaje(new Locale("es"));
                prop.load(ListarUsuariosController.class.getClassLoader().getResourceAsStream("com/mapris/languages/app/App_en.properties"));
                
            } else{
                sc.setSeleccionarLenguaje(new Locale("es"));
            prop.load(ListarUsuariosController.class.getClassLoader().getResourceAsStream("com/mapris/languages/app/App_en.properties"));
            
            }
            
            return prop;
        } catch (FileNotFoundException e) {
            System.out.println("Error, El archivo no exite");
        } catch (IOException e) {
            System.out.println("Error, No se puede leer el archivo");
        }
        return null;
    }
}
