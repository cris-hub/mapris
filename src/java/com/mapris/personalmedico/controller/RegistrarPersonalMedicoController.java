/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.personalmedico.controller;


import com.mapris.modelo.dao.PersonalmedicoFacadeLocal;
import com.mapris.modelo.dao.UsuarioFacadeLocal;


import com.mapris.modelo.entitie.Personalmedico;
import com.mapris.modelo.entitie.Usuario;
import com.mapris.util.MessageUtil;

import java.util.Calendar;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "registroPersonalMedicoController")
@RequestScoped
public class RegistrarPersonalMedicoController {

    @EJB
    private UsuarioFacadeLocal  usuarioFacadeLocal;
    
    @EJB
    private PersonalmedicoFacadeLocal personalMedicoFacadeLocal;


    private Personalmedico nuevoPersonalMedico;
    
    private Usuario nuevoUsuario;
   

    public RegistrarPersonalMedicoController() {
    }

    @PostConstruct
    public void init() {
        nuevoPersonalMedico = new Personalmedico();

    }

    public Personalmedico getNuevoPersonalmedico() {
        return nuevoPersonalMedico;
    }

    public void setNuevoPersonalmedico(Personalmedico nuevoPersonalMedico) {
        this.nuevoPersonalMedico = nuevoPersonalMedico;
    }

    public void registrar() {
        if (nuevoPersonalMedico != null) {
        
        
        try{
                
                
                
                nuevoUsuario.setCedula(nuevoUsuario.getCedula());
                nuevoPersonalMedico.setIdPersonalMedico(nuevoUsuario.getCedula());
               
                
                
                personalMedicoFacadeLocal.create(nuevoPersonalMedico);
                usuarioFacadeLocal.create(nuevoUsuario);
                MessageUtil.enviarMensajeInformacionGlobal("Registro satisfactorio", "El usuario se ha creado con exito");
                init();
                
                
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            MessageUtil.enviarMensajeInformacionGlobal( "Error al registrar el usuario", "No se pudo registrar el usuario");
        }
    }

}
