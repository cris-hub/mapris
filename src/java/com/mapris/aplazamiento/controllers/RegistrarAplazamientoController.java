package com.mapris.aplazamiento.controllers;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.AplazamientoFacadeLocal;
import com.mapris.modelo.dao.ClienteFacadeLocal;

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


    private Inscripcion inscripcionSeleccionado;

    private Aplazamiento nuevoAplazamiento;


    public RegistrarAplazamientoController() {
    }

    @PostConstruct
    public void init() {
        nuevoAplazamiento = new Aplazamiento();
     
    }

    public Inscripcion getInscripcionSeleccionado() {
        return inscripcionSeleccionado;
    }

    public void setInscripcionSeleccionado(Inscripcion inscripcionSeleccionado) {
        this.inscripcionSeleccionado = inscripcionSeleccionado;
    }

    public Aplazamiento getNuevoAplazamiento() {
        return nuevoAplazamiento;
    }

    public void setNuevoAplazamiento(Aplazamiento nuevoAplazamiento) {
        this.nuevoAplazamiento = nuevoAplazamiento;
    }
    
    

    /**
     * Creates a new instance of RegistrarSesionController
     */
    

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

    private void cambioDeFechaInscripcion() {
        try {
            
            inscripcionFacadeLocal.edit(inscripcionSeleccionado);
            MessageUtil.enviarMensajeInformacion("form-registrarAplazamiento", "Actualización", "Se ha cambiado la fecha del inscripcion.");
        } catch (Exception e) {
            e.printStackTrace();
            MessageUtil.enviarMensajeError("form-registrarAplazamiento", "Error cambiar la fecha del inscripcion", "");
        }
    }

    public void registrar() {
       
        
        if (nuevoAplazamiento != null) {
            try {
                nuevoAplazamiento.getidUsuario();
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
