/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.rutinasservicios.controller;

import com.mapris.modelo.dao.RutinaservicioFacadeLocal;
import com.mapris.modelo.entitie.Rutinaservicio;
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
@Named(value = "registrarRutinaServicioController")
@RequestScoped
public class RegistrarRutinaServicioController {

    @EJB
    private RutinaservicioFacadeLocal rutinaServicioFacadeLocal;
    private Rutinaservicio nuevoRutinaservicio;

    public RegistrarRutinaServicioController() {
    }

    @PostConstruct
    public void init() {
        nuevoRutinaservicio = new Rutinaservicio();

    }

    public Rutinaservicio getNuevoRutinaservicio() {
        return nuevoRutinaservicio;
    }

    public void setNuevoRutinaservicio(Rutinaservicio nuevaRutinaservicio) {
        this.nuevoRutinaservicio = nuevaRutinaservicio;
    }

    public void registrar() {
        if (nuevoRutinaservicio != null) {
            try {
                

                rutinaServicioFacadeLocal.create(nuevoRutinaservicio);

                MessageUtil.enviarMensajeInformacionGlobal("Registro satisfactorio", "El Rutina Servicio se ha registrado Correctamete");
                init();

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            MessageUtil.enviarMensajeInformacionGlobal("Error al registrar el Rutina Servicio", "No se pudo registrar el Rutina Servicio");
        }
    }

}
