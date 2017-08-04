/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.datosclinicos.controllers;


import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.EstadoFacadeLocal;
import com.mapris.modelo.dao.ClienteFacadeLocal;
import com.mapris.modelo.dao.RolFacadeLocal;
import com.mapris.modelo.dao.DatoclinicoFacadeLocal;
import com.mapris.modelo.dao.UsuarioFacadeLocal;


import com.mapris.modelo.entitie.Cliente;
import com.mapris.modelo.entitie.Rol;
import com.mapris.modelo.entitie.Datoclinico;
import com.mapris.util.MessageUtil;
import java.util.ArrayList;

import java.util.Date;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "registroDatoClinicoController")
@RequestScoped
public class RegistrarDatoClinicoController {

    @Inject
    private SessionController sc;
    
    @EJB
    private DatoclinicoFacadeLocal  dcfl;
   
    @EJB
    private UsuarioFacadeLocal  ufl;
    
   
    private Datoclinico nuevoDatoclinico;
    
 
   

    public RegistrarDatoClinicoController() {
    }

    @PostConstruct
    public void init() {
        
        nuevoDatoclinico = new Datoclinico();

    }

    
    public Datoclinico getNuevoDatoclinico() {
        return nuevoDatoclinico;
    }

    public void setNuevoDatoclinico(Datoclinico nuevoDatoclinico) {
        this.nuevoDatoclinico = nuevoDatoclinico;
    }
    
    public void registrar() {
    
       
        if (nuevoDatoclinico != null) {
        
        
        try{
                
                
                Long document = Long.valueOf(sc.getUsuario().getIdUsuario());
                nuevoDatoclinico.setIdCliente(document);
                dcfl.create(nuevoDatoclinico);
                
                MessageUtil.enviarMensajeInformacionGlobal("Registro satisfactorio", "El cliente se ha creado con exito");
                init();
                
                
                
            } catch (Exception e) {
                e.printStackTrace();
               
            }
        } else {
            MessageUtil.enviarMensajeInformacionGlobal( "Error al registrar el usuario", "No se pudo registrar el cliente");
        }
    }
    
   
}
