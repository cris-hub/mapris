/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.salonesservicios.controller;


import com.mapris.modelo.dao.SalonHasServicioFacadeLocal;


import com.mapris.modelo.entitie.SalonHasServicio;
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
@Named(value = "registrarSalonesHasServiciosController")
@RequestScoped
public class RegistrarSalonesHasServiciosController {

    @EJB
    private SalonHasServicioFacadeLocal sfl;


    private SalonHasServicio nshs;


    public RegistrarSalonesHasServiciosController() {
    }

    @PostConstruct
    public void init() {
        nshs = new SalonHasServicio ();

    }

    public SalonHasServicio  getNuevoSalon() {
        return nshs;
    }

    public void setNuevoSalon(SalonHasServicio  nshs) {
        this.nshs = nshs;
    }

    public void registrar() {
        if (nshs != null) {
        
        
        try{
                             
                
                
                sfl.create(nshs);
               
                MessageUtil.enviarMensajeInformacionGlobal("Registro satisfactorio", "El salón se ha creado con exito");
                init();
                
                
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            MessageUtil.enviarMensajeInformacionGlobal( "Error al registrar el salón", "No se pudo registrar el salón");
        }
    }

}
