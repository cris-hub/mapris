/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.servicios.controller;


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

  

    public RegistrarServicioController() {
    }

    @PostConstruct
    public void init() {
      

    }


    public void registrar() {
//        if (nuevoServicio != null) {
//            try {
//                nuevoServicio.setIdServicio(nuevoServicio.getIdServicio());
//                nuevoServicio.setNombre(nuevoServicio.getNombre());
//                nuevoServicio.setDescripcion(nuevoServicio.getDescripcion());
//                nuevoServicio.setIdCalendario(nuevoServicio.getIdCalendario());
//
//                servicioFacadeLocal.create(nuevoServicio);
//
//                MessageUtil.enviarMensajeInformacionGlobal("Registro satisfactorio", "El Servicio se ha registrado Correctamete");
//                init();
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        } else {
//            MessageUtil.enviarMensajeInformacionGlobal("Error al registrar el Servicio", "No se pudo registrar el Servicio");
//        }
    }

}
