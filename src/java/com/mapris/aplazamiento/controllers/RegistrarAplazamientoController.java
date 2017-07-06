/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.aplazamiento.controllers;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.AplazamientoFacadeLocal;
import com.mapris.modelo.dao.ClienteFacadeLocal;
import com.mapris.modelo.dao.InscripcionFacadeLocal;
import com.mapris.modelo.dao.InscripcionFacadeLocal;
import com.mapris.modelo.entitie.Aplazamiento;
import com.mapris.modelo.entitie.Inscripcion;
import javax.inject.Named;
import com.mapris.util.Fecha;
import com.mapris.util.MessageUtil;
import java.io.Serializable;
import java.util.Date;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.*;
import javax.faces.view.ViewScoped;
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
    private InscripcionFacadeLocal inscripcionFacadeLocal;
    @EJB
    private AplazamientoFacadeLocal aplazamientoFacadeLocal;

    @EJB
    private ClienteFacadeLocal clienteFacadeLocal;

    private Inscripcion inscripcionSeleccionado;

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

    public InscripcionFacadeLocal getInscripcionFacadeLocal() {
        return inscripcionFacadeLocal;
    }

    public void setInscripcionFacadeLocal(InscripcionFacadeLocal inscripcionFacadeLocal) {
        this.inscripcionFacadeLocal = inscripcionFacadeLocal;
    }

    public Inscripcion getInscripcionSeleccionado() {
        return inscripcionSeleccionado;
    }

    public void setInscripcionSeleccionado(Inscripcion inscripcionSeleccionado) {
        this.inscripcionSeleccionado = inscripcionSeleccionado;
    }
    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
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

    public void preModificar(Inscripcion s) {
        setInscripcionSeleccionado(s);
    }

    public String existeInscripcionSeleccionado() {
        if (inscripcionSeleccionado != null) {
            return "true";
        } else {
            return "false";
        }
    }
    private void cambioDeFechaInscripcion(){
        try {
            inscripcionSeleccionado.setFechaRetornoAplazamiento(fechaHora);
            inscripcionFacadeLocal.edit(inscripcionSeleccionado);
            MessageUtil.enviarMensajeInformacion("form-registrarAplazamiento", "Actualización", "Se ha cambiado la fecha del inscripcion.");
        } catch (Exception e) {
            e.printStackTrace();
            MessageUtil.enviarMensajeError("form-registrarAplazamiento", "Error cambiar la fecha del inscripcion","");
        }      
    }
    public void registrar() {
        cambioDeFechaInscripcion();
        nuevoAplazamiento.setIdcliente(clienteFacadeLocal.find(sessionController.getDocumento()));
        nuevoAplazamiento.setMotivo(motivo);
        if (nuevoAplazamiento != null) {
            try {
                aplazamientoFacadeLocal.create(nuevoAplazamiento);
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

   
}
