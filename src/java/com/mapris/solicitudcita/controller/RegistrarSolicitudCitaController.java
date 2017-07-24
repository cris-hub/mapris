package com.mapris.solicitudcita.controller;

import com.mapris.modelo.dao.SolicitudCitaFacadeLocal;
import com.mapris.modelo.entitie.SolicitudCita;
import com.mapris.util.MessageUtil;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;

/**
 *
 * @author KoLachito
 */
@Named(value = "registrarSolicitudCitaController")
@RequestScoped
public class RegistrarSolicitudCitaController {

    @EJB
    private SolicitudCitaFacadeLocal sCFacadeLocal;
    private SolicitudCita nuevaSolicitudCita;

    public RegistrarSolicitudCitaController() {
    }

    @PostConstruct
    public void init() {
        nuevaSolicitudCita = new SolicitudCita();

    }

    public SolicitudCita getNuevaSolicitudCita() {
        return nuevaSolicitudCita;
    }

    public void setNuevaSolicitudCita(SolicitudCita nuevaSolicitudCita) {
        this.nuevaSolicitudCita = nuevaSolicitudCita;
    }

    public void registrar() {
        if (nuevaSolicitudCita != null) {
            try {
                nuevaSolicitudCita.setIdCitas(nuevaSolicitudCita.getIdCitas());
                nuevaSolicitudCita.setEstado(nuevaSolicitudCita.getEstado());
                nuevaSolicitudCita.setIdClientes(nuevaSolicitudCita.getIdClientes());
                nuevaSolicitudCita.setIdServicio(nuevaSolicitudCita.getIdServicio());
                nuevaSolicitudCita.setIdFecha(nuevaSolicitudCita.getIdFecha());

                sCFacadeLocal.create(nuevaSolicitudCita);

                MessageUtil.enviarMensajeInformacionGlobal("Registro satisfactorio", "El Solicitud de cita se ha registrado Correctamete");
                init();

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            MessageUtil.enviarMensajeInformacionGlobal("Error al registrar la solicitud de cita", "No se pudo registrar la solicitud de cita");
        }
    }

}
