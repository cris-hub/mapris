package com.mapris.aplazamiento.controllers;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.AplazamientoFacadeLocal;
import com.mapris.modelo.dao.ClienteFacadeLocal;
import com.mapris.modelo.dao.EstadoFacadeLocal;

import com.mapris.modelo.dao.InscripcionFacadeLocal;
import com.mapris.modelo.dao.UsuarioFacadeLocal;
import com.mapris.modelo.entitie.Aplazamiento;
import com.mapris.modelo.entitie.Inscripcion;
import com.mapris.modelo.entitie.Usuario;
import javax.inject.Named;

import com.mapris.util.MessageUtil;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
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
@RequestScoped
public class RegistrarAplazamientoController{

    @Inject
    private SessionController sessionController;
    @EJB
    private InscripcionFacadeLocal inscripcionFacadeLocal;
    @EJB
    private AplazamientoFacadeLocal aplazamientoFacadeLocal;
    @EJB
    private EstadoFacadeLocal estadoFacadeLocal;
    @EJB
    private UsuarioFacadeLocal ufl;

    private Inscripcion inscripcionSeleccionado;
   

    private Aplazamiento nuevoAplazamiento;
    
    private Usuario usuarioAplazado;

    public RegistrarAplazamientoController() {
    }

    @PostConstruct
    public void init() {
        nuevoAplazamiento = new Aplazamiento();
        inscripcionSeleccionado =  sessionController.getUsuario().getCliente().getInscripciones().get(0);
        usuarioAplazado  = new Usuario();
        
                

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
    

    public Boolean existeInscripcionSeleccionado() {
        if (getInscripcionesCliente() != null ) {
            return true;
        } else {
            return false;
        }
    }

    public List<Inscripcion> getInscripcionesCliente() {
        return sessionController.getUsuario().getCliente().getInscripciones();
    }

    public String registrar() {

        if (existeInscripcionSeleccionado() == true) {
            
       
        if (nuevoAplazamiento != null) {
            try {
                
                inscripcionSeleccionado.setEstado("Aplazado");
                usuarioAplazado = sessionController.getUsuario();
                usuarioAplazado.setIdEstados(estadoFacadeLocal.find(4));
                nuevoAplazamiento.setidUsuario(sessionController.getUsuario().getIdUsuario());
                nuevoAplazamiento.setMotivo(nuevoAplazamiento.getMotivo());
                nuevoAplazamiento.setInicio(nuevoAplazamiento.getInicio());
                nuevoAplazamiento.setFin(nuevoAplazamiento.getFin());
                aplazamientoFacadeLocal.create(nuevoAplazamiento);
                ufl.edit(usuarioAplazado);
                inscripcionFacadeLocal.edit(inscripcionSeleccionado);
                init();
                MessageUtil.enviarMensajeInformacion("form-registrarAplazamiento", "Registro satisfactorio", "");
                 return sessionController.cerrarSesion();
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error aplazamiento registro");
                MessageUtil.enviarMensajeError("form-registrarAplazamiento", "Error al registrar el aplazamiento en la Base de Datos ", "");
                return null;
                
            }
        } else {
            System.out.println("NULO aplazamiento registro");
            MessageUtil.enviarMensajeError("form-registrarAplazamiento", "no se han diligenciado los campos ", "");
            return null;
        }
    } else {
        
      MessageUtil.enviarMensajeError("form-registrarAplazamiento", "No se puede completar el aplazamiento ", " Debido a que no esta inscrito a ningun servicio");
        return null;
        
        
        }
  }

}
