package com.mapris.solicitudcita.controller;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.ClienteFacadeLocal;
import com.mapris.modelo.dao.SolicitudCitaFacadeLocal;
import com.mapris.modelo.entitie.SolicitudCita;
import com.mapris.util.MessageUtil;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author KoLachito
 */
@Named(value = "registrarSolicitudCitaController")
@RequestScoped
public class RegistrarSolicitudCitaController {

    @Inject
    private SessionController sessionController;
    @EJB
    private SolicitudCitaFacadeLocal sCFacadeLocal;
    @EJB
    private ClienteFacadeLocal clienteFacadeLocal;
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
                nuevaSolicitudCita.setEstado("En Espera");
                nuevaSolicitudCita.setIdClientes(clienteFacadeLocal.find(sessionController.getDocumento()));
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
