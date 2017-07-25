/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.clientes.controllers;


import com.mapris.modelo.dao.EstadoFacadeLocal;
import com.mapris.modelo.dao.ClienteFacadeLocal;
import com.mapris.modelo.dao.RolFacadeLocal;
import com.mapris.modelo.dao.UsuarioFacadeLocal;


import com.mapris.modelo.entitie.Cliente;
import com.mapris.modelo.entitie.Rol;
import com.mapris.modelo.entitie.Usuario;
import com.mapris.util.MessageUtil;
import java.util.ArrayList;

import java.util.Calendar;
import java.util.Date;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "registroClienteController")
@RequestScoped
public class RegistrarClienteController {

    @EJB
    
    private EstadoFacadeLocal   efl;
    
    @EJB
    private UsuarioFacadeLocal  usuarioFacadeLocal;
    
    @EJB
    private ClienteFacadeLocal cfl;
    
    @EJB
    private RolFacadeLocal rolFacedaLocal;
    @EJB
    private EstadoFacadeLocal estadoFacadeLocal;


    private Cliente nuevoCliente;
    
    private Usuario nuevoUsuario;
   

    public RegistrarClienteController() {
    }

    @PostConstruct
    public void init() {
        nuevoCliente = new Cliente();
        nuevoUsuario = new Usuario();

    }

    public Cliente getNuevoCliente() {
        return nuevoCliente;
    }

    public void setNuevoCliente(Cliente nuevoCliente) {
        this.nuevoCliente = nuevoCliente;
    }

    public Usuario getNuevoUsuario() {
        return nuevoUsuario;
    }

    public void setNuevoUsuario(Usuario nuevoUsuario) {
        this.nuevoUsuario = nuevoUsuario;
    }
    
    public void registrar() {
       Date hoy = new Date();
       
        if (nuevoUsuario != null && nuevoCliente != null) {
        
        
        try{
                
                
               
                nuevoUsuario.setCedula(nuevoUsuario.getCedula());
                nuevoUsuario.setFechaRegistro(hoy);
                nuevoUsuario.setRoles(new ArrayList<Rol>());
                nuevoUsuario.getRoles().add(rolFacedaLocal.find(2));
                nuevoUsuario.setEstado(estadoFacadeLocal.find(2));
                
                nuevoCliente.setIdClientes(nuevoUsuario.getCedula());
                nuevoCliente.setEstado("Habilitado");
                
                usuarioFacadeLocal.create(nuevoUsuario);
                cfl.create(nuevoCliente);
                MessageUtil.enviarMensajeInformacionGlobal("Registro satisfactorio", "El personal medico se ha creado con exito");
                init();
                
                
                
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("No paso pez" + e.getMessage());
            }
        } else {
            MessageUtil.enviarMensajeInformacionGlobal( "Error al registrar el usuario", "No se pudo registrar el usuario");
        }
    }
    
    
   public void cambioDeEstado(Usuario u, Cliente c) {
        try {
            if (u.getEstado().getIdEstados() == 1 && c.getEstado().equalsIgnoreCase("Habilitado")) {
                u.setEstado(efl.find(2));
                c.setEstado("Deshabilitado");
                

            } else {
                u.setEstado(efl.find(1));
                c.setEstado("Habilitado");
            }
            usuarioFacadeLocal.edit(u);
            cfl.edit(c);
            MessageUtil.enviarMensajeInformacion("form-data-table-usuarios", "Actualización", "Se ha cambiado el estado del usuario.");
        } catch (Exception e) {
            e.printStackTrace();
            MessageUtil.enviarMensajeErrorGlobal("Errcambiar el estado del usuario", e.getStackTrace().toString());
        }

    }

    public String getIconUsuarioBloqueo(Usuario u, Cliente c) {
        return (u.getEstado().getIdEstados() == 2 && c.getEstado().equalsIgnoreCase("Deshablitado")) ? "lock" : "unlock";
    }
}
