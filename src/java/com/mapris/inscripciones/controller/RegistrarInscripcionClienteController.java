package com.mapris.inscripciones.controller;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.ClienteFacadeLocal;
import com.mapris.modelo.dao.InscripcionFacadeLocal;
import com.mapris.modelo.entitie.Inscripcion;
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
@Named(value = "registroInscripcionClienteController")
@RequestScoped
public class RegistrarInscripcionClienteController {

    @Inject
    private SessionController sessionC;

    @EJB
    private InscripcionFacadeLocal inscripcionFacadeLocal;
    @EJB
    private ClienteFacadeLocal clienteFacadeLocal;

    private Inscripcion nuevoInscripcion;

    public RegistrarInscripcionClienteController() {
    }

    @PostConstruct
    public void init() {
        nuevoInscripcion = new Inscripcion();

    }

    public Inscripcion getNuevoInscripcion() {
        return nuevoInscripcion;
    }

    public void setNuevoInscripcion(Inscripcion nuevoInscripcion) {
        this.nuevoInscripcion = nuevoInscripcion;
    }

    public void registrar() {
        if (nuevoInscripcion != null) {
            try {

//                nuevoInscripcion.setIdInscripciones(nuevoInscripcion.getIdInscripciones());
                nuevoInscripcion.setEstado("activo");
//                nuevoInscripcion.setFechaInicio(nuevoInscripcion.getFechaInicio());
//                nuevoInscripcion.setIdSesiones(nuevoInscripcion.getIdSesiones());
//                nuevoInscripcion.setIdCliente(clienteFacadeLocal.find(sessionC.getDocumento()));
//                nuevoInscripcion.setIdPrograma(nuevoInscripcion.getIdPrograma());
//                nuevoInscripcion.setValor(nuevoInscripcion.getValor());

                inscripcionFacadeLocal.create(nuevoInscripcion);

                MessageUtil.enviarMensajeInformacionGlobal("Registro satisfactorio", "El usuario se ha creado con exito");
                init();

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            MessageUtil.enviarMensajeInformacionGlobal("Error al registrar el usuario", "No se pudo registrar el usuario");
        }
    }

}
