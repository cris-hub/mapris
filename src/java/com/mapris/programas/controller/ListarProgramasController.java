
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.programas.controller;

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



    public ListarProgramasController() {
    }

    @PostConstruct
    public void init() {
        recargarProgramas();

    }

    private void recargarProgramas() {
//        programas = programaFacadeLocal.findAll();
    }

    

    public void eliminarPrograma() {

        try {
//            programaFacadeLocal.remove(programaSeleccionado);
            MessageUtil.enviarMensajeInformacionGlobal("Removido con exito", "El programa fue removido con exito");
        } catch (Exception e) {
            MessageUtil.enviarMensajeInformacionGlobal("Error al eliminar", "El programa no pudo ser eliminado");

        }

    }

}
