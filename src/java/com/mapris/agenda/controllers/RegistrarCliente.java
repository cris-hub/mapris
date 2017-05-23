/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.agenda.controllers;

import com.mapris.modelo.dao.ClienteFacadeLocal;
import com.mapris.modelo.dao.RolFacadeLocal;
import com.mapris.modelo.entitie.Cliente;
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
@Named(value = "registroClienteController")
@RequestScoped
public class RegistrarCliente {
    
    @EJB
    private ClienteFacadeLocal cfl;
    
    @EJB
    private RolFacadeLocal rolFacedaLocal;
    
    private Cliente nuevoCliente;

    public RegistrarCliente() {
    }
    
    
    @PostConstruct
    public void  init(){
        nuevoCliente  = new Cliente();
    }

    public Cliente getNuevoCliente() {
        return nuevoCliente;
    }

    public void setNuevoCliente(Cliente nuevoUsuario) {
        this.nuevoCliente = nuevoUsuario;
    }
    
    public void registrar(){
        if (nuevoCliente != null) {
            nuevoCliente.getUsuario().setRoles(new ArrayList<Rol>());
            nuevoCliente.getUsuario().getRoles().add(rolFacedaLocal.find(2));
            nuevoCliente.getUsuario().setEstado(2);
            cfl.create(nuevoCliente);
            MessageUtil.enviarMensajeInformacion("form-registro", "Registro satisfactorio del cliente", "");
            init();
        } else{
            MessageUtil.enviarMensajeError("form-regitro", "no se han diligenciado los campos del cliente ", "");
        }
    }
    
    
    
    
    
    
    
    
}
