package com.mapris.fechasdisponibles.controller;

import com.mapris.util.MessageUtil;
import java.io.Serializable;

import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;

/**
 *
 * @author KoLachito
 */
@Named(value = "listarFechasDisponiblesController")
@ViewScoped
public class ListarFechasDisponiblesController implements Serializable {
//    Code Dependention Injection

  

    public ListarFechasDisponiblesController() {
    }

    @PostConstruct
    public void init() {
        recargarFechasDisponibles();

    }

    private void recargarFechasDisponibles() {
//        fechasDisponibles = fechaDisponibleFacadeL.findAll();
    }


    public void eliminarfechaSeleccionada() {

//        try {
//            fechaDisponibleFacadeL.remove(fechaSeleccionada);
//            MessageUtil.enviarMensajeInformacionGlobal("Eliminación correcta", "Se elimino correctamente fecha Seleccionada ");
//        } catch (Exception e) {
//            MessageUtil.enviarMensajeErrorGlobal("Error al eliminar las sesiones", "No se puede eliminar la fechaSeleccionada");
//        }

    }

}
