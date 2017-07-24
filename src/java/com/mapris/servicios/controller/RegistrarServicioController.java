/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.servicios.controller;

import com.mapris.modelo.dao.ServicioFacadeLocal;
import com.mapris.modelo.entitie.Servicio;
import com.mapris.modelo.entitie.Sesion;
import com.mapris.util.MessageUtil;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;

/**
 *
 * @author KoLachito
 */
@Named(value = "registrarServicioController")
@RequestScoped
public class RegistrarServicioController {

    @EJB
    private ServicioFacadeLocal servicioFacadeLocal;
    private Servicio nuevoServicio;

    public RegistrarServicioController() {
    }

    @PostConstruct
    public void init() {
        nuevoServicio = new Servicio();

    }

    public Servicio getNuevoServicio() {
        return nuevoServicio;
    }

    public void setNuevoServicio(Servicio nuevaServicio) {
        this.nuevoServicio = nuevaServicio;
    }

    public void registrar() {
        if (nuevoServicio != null) {
            try {
                nuevoServicio.setIdServicio(nuevoServicio.getIdServicio());
                nuevoServicio.setNombre(nuevoServicio.getNombre());
                nuevoServicio.setDescripcion(nuevoServicio.getDescripcion());
                nuevoServicio.setIdCalendario(nuevoServicio.getIdCalendario());

                servicioFacadeLocal.create(nuevoServicio);

                MessageUtil.enviarMensajeInformacionGlobal("Registro satisfactorio", "El Servicio se ha registrado Correctamete");
                init();

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            MessageUtil.enviarMensajeInformacionGlobal("Error al registrar el Servicio", "No se pudo registrar el Servicio");
        }
    }

}
