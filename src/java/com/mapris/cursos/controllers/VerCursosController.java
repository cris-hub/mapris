/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.cursos.controllers;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.entitie.Curso;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author Ruben
 */
@Named(value = "verCursoController")
@SessionScoped

public class VerCursosController implements Serializable {

    @Inject
    private SessionController sc;
    private Curso curso;

    public VerCursosController() {
    }

    @PostConstruct
    public void init() {

    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public String verCurso(Curso c) {
        this.curso = c;
        if (sc.getRolSeleccionado().getIdRoles().equals(2)) {
            return "/app/cliente/cursos/ver.xhtml?faces-redirect=true";
        } else {
            return "/app/administrador/cursos/ver.xhtml?faces-redirect=true";

        }
    }

}
