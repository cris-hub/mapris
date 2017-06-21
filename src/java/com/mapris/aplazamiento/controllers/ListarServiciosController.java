
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.aplazamiento.controllers;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.ServicioFacadeLocal;
import com.mapris.modelo.entitie.Servicio;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;


import javax.inject.Inject;
import javax.inject.Named;

@Named(value = "listarServiciosController")
@ViewScoped
public class ListarServiciosController implements Serializable{
//    cdi 

    @Inject
    private SessionController sessionController;

    @EJB
    private ServicioFacadeLocal servicioFacadeLocal;

    private List<Servicio> servicios;

    private Servicio servicioSeleccionado;

    
    
    
    public ListarServiciosController() {
    }

    @PostConstruct
    public void init() {
        recargarServicios();
    }
    
    private void recargarServicios(){
        servicios = servicioFacadeLocal.findAll();
    }
    
    public ServicioFacadeLocal getServicioFacadeLocal() {
        return servicioFacadeLocal;
    }

    public void setServicioFacadeLocal(ServicioFacadeLocal servicioFacadeLocal) {
        this.servicioFacadeLocal = servicioFacadeLocal;
    }

    public List<Servicio> getServicios() {
        return servicios;
    }

    public void setServicioSeleccionado(Servicio servicioSeleccionado) {
        this.servicioSeleccionado = servicioSeleccionado;
    }


    public Servicio getServicioSeleccionado() {
        return servicioSeleccionado;
    }
}
