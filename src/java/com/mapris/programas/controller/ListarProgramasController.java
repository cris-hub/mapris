
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.programas.controller;

import com.mapris.modelo.dao.ProgramaFacadeLocal;
import com.mapris.modelo.entitie.Programa;
import com.mapris.util.MessageUtil;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author Ruben
 */
@Named(value = "listarProgramaController")
@ViewScoped
public class ListarProgramasController implements Serializable {
//    Code Dependention Injection

    @EJB
    private ProgramaFacadeLocal programaFacadeLocal;

    private List<Programa> programas;

    private Programa programaSeleccionado;

    public ListarProgramasController() {
    }

    @PostConstruct
    public void init() {
        recargarProgramas();

    }

    private void recargarProgramas() {
        programas = programaFacadeLocal.findAll();
    }

    public ProgramaFacadeLocal getProgramaFacadeLocal() {
        return programaFacadeLocal;
    }

    public void setProgramaFacadeLocal(ProgramaFacadeLocal programaFacadeLocal) {
        this.programaFacadeLocal = programaFacadeLocal;
    }

    public List<Programa> getProgramas() {
        return programas;
    }

    public void setProgramaSeleccionado(Programa programaSeleccionado) {
        this.programaSeleccionado = programaSeleccionado;
    }

    public Programa getProgramaSeleccionado() {
        return this.programaSeleccionado;
    }

    public void eliminarPrograma() {

        try {
            programaFacadeLocal.remove(programaSeleccionado);
            MessageUtil.enviarMensajeInformacionGlobal("Removido con exito", "El programa fue removido con exito");
        } catch (Exception e) {
            MessageUtil.enviarMensajeInformacionGlobal("Error al eliminar", "El programa no pudo ser eliminado");

        }

    }

}
