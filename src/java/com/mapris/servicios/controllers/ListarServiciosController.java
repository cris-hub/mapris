/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.servicios.controllers;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.ServicioFacadeLocal;
import com.mapris.modelo.entitie.Servicio;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;

/**
 *
 * @author andres
 */
@Named(value = "listarServiciosController")
@Dependent
public class ListarServiciosController {
  @EJB
    private ServicioFacadeLocal servicioFacadeLocal;
     @Inject
    private SessionController sessionController;
     
      private List<Servicio> servicios;

    private Servicio servicioSeleccionado;
    /**
     * Creates a new instance of ListarServiciosController
     */
    public ListarServiciosController() {
    }
        @PostConstruct
    public void init() {
        recargarServicios();
    }
    
    private void recargarServicios(){
        servicios = servicioFacadeLocal.findAll();
    }
    public void setServicioSeleccionado(Servicio servicioSeleccionado) {
        this.servicioSeleccionado = servicioSeleccionado;
    }


    public Servicio getUsuarioSeleccionado() {
        return servicioSeleccionado;
    }

}