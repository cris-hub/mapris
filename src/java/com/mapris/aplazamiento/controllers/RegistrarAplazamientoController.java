/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.aplazamiento.controllers;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.AplazamientoFacadeLocal;
import com.mapris.modelo.dao.ClienteFacadeLocal;
import com.mapris.modelo.dao.ServicioFacadeLocal;
import com.mapris.modelo.entitie.Aplazamiento;
import com.mapris.modelo.entitie.Servicio;
import javax.inject.Named;
import com.mapris.util.Fecha;
import com.mapris.util.MessageUtil;
import java.io.Serializable;
import java.util.Date;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.*;
import javax.inject.Inject;

/**
 *
 * @author andres
 */
@Named(value = "registrarAplazamientoController")
@SessionScoped
public class RegistrarAplazamientoController implements Serializable {

    @Inject
    private SessionController sessionController;
    @EJB
    private ServicioFacadeLocal servicioFacadeLocal;
    @EJB
    private AplazamientoFacadeLocal aplazamientoFacadeLocal;

    @EJB
    private ClienteFacadeLocal clienteFacadeLocal;

    private Servicio servicioSeleccionado;

    private Aplazamiento nuevoAplazamiento;

    private String motivo;

    private Date fechaHora;

    public Date getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public AplazamientoFacadeLocal getAplazamientoFacadeLocal() {
        return aplazamientoFacadeLocal;
    }

    public void setAplazamientoFacadeLocal(AplazamientoFacadeLocal aplazamientoFacadeLocal) {
        this.aplazamientoFacadeLocal = aplazamientoFacadeLocal;
    }

    public Aplazamiento getNuevoAplazamiento() {
        return nuevoAplazamiento;
    }

    public void setNuevoAplazamiento(Aplazamiento nuevoAplazamiento) {
        this.nuevoAplazamiento = nuevoAplazamiento;
    }

    @PostConstruct
    public void init() {
        nuevoAplazamiento = new Aplazamiento();
        fechaHora = getFechaHoraActual();
    }

    public ServicioFacadeLocal getServicioFacadeLocal() {
        return servicioFacadeLocal;
    }

    public void setServicioFacadeLocal(ServicioFacadeLocal servicioFacadeLocal) {
        this.servicioFacadeLocal = servicioFacadeLocal;
    }

    public Servicio getServicioSeleccionado() {
        return servicioSeleccionado;
    }

    public void setServicioSeleccionado(Servicio servicioSeleccionado) {
        this.servicioSeleccionado = servicioSeleccionado;
    }

    /**
     * Creates a new instance of RegistrarSesionController
     */
    public RegistrarAplazamientoController() {
    }

    public Date getFechaHoraActual() {
        Fecha fecha = new Fecha();
        return fecha.getFechaActual();
    }

    public String preModificar(Servicio s) {
        setServicioSeleccionado(s);
        return "/app/aplazamientos/registrarAplazamiento.xhtml?faces-redirect=true";
    }

    public String existeServicioSeleccionado() {
        if (servicioSeleccionado != null) {
            return "true";
        } else {
            return "false";
        }
    }

    public void registrar() {
        nuevoAplazamiento.setIdaplazamiento(2);
        nuevoAplazamiento.setIdcliente(clienteFacadeLocal.find(sessionController.getDocumento()));
        nuevoAplazamiento.setServiciosidServicio(servicioFacadeLocal.find(servicioSeleccionado.getIdServicio()));
        nuevoAplazamiento.setMotivo(motivo);
        if (nuevoAplazamiento != null) {
            try {
                aplazamientoFacadeLocal.registrarAplazamiento(nuevoAplazamiento);
                init();
                MessageUtil.enviarMensajeInformacion("form-registrarAplazamiento", "Registro satisfactorio", "");
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error aplazamiento registro");
                MessageUtil.enviarMensajeError("form-registrarAplazamiento", "Error al registrar el aplazamiento en la Base de Datos ", "");
            }
        } else {
            System.out.println("NULO aplazamiento registro");
             MessageUtil.enviarMensajeError("form-registrarAplazamiento", "no se han diligenciado los campos ", "");
        }
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }
}
