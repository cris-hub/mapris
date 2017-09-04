/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.inscripciones.controller;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.InscripcionFacadeLocal;
import com.mapris.modelo.entitie.Curso;
import com.mapris.modelo.entitie.Inscripcion;
import com.mapris.util.MessageUtil;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author Kolchito
 */
@Named(value = "registroClienteInscripcionController")
@SessionScoped
public class RegistrarInscripcionClienteController implements Serializable {

    @Inject
    private SessionController sessionCliente;

    @EJB
    private InscripcionFacadeLocal inscripcionFacadeLocal;

    private Inscripcion nuevoInscripcion;

    private Curso curso;

    public RegistrarInscripcionClienteController() {
    }

    @PostConstruct
    public void init() {
        curso = new Curso();
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

                nuevoInscripcion.setEstado("Activa");
                nuevoInscripcion.setIdUsuario(sessionCliente.getUsuario().getCliente());

                if (getCurso() != null) {
                    nuevoInscripcion.setFkIdCurso(getCurso());

                } else {
                    MessageUtil.enviarMensajeInformacionGlobal("Error al registrar el usuario", "No se pudo registrar el usuario");
                }

                inscripcionFacadeLocal.create(nuevoInscripcion);

                MessageUtil.enviarMensajeInformacionGlobal("Registro satisfactorio", "Se realizo la incripcion satisfacoria mente");
                init();

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            MessageUtil.enviarMensajeInformacionGlobal("Error al registrar el usuario", "No se pudo registrar el usuario");
        }
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

//    public void registrar() {
//        if (nuevoInscripcion != null) {
//            try {
//
//                nuevoInscripcion.setEstado("Activa");
//                nuevoInscripcion.setIdUsuario(sessionCliente.getUsuario().getCliente());
//
//
//                inscripcionFacadeLocal.create(nuevoInscripcion);
//
//                MessageUtil.enviarMensajeInformacionGlobal("Registro satisfactorio", "Se realizo la incripcion satisfacoria mente");
//                init();
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        } else {
//            MessageUtil.enviarMensajeInformacionGlobal("Error al registrar el usuario", "No se pudo registrar el usuario");
//        }
//    }
}
