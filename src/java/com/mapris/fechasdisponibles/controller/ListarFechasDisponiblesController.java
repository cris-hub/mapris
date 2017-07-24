package com.mapris.fechasdisponibles.controller;

import com.mapris.modelo.dao.FechaDisponibleFacadeLocal;
import com.mapris.modelo.entitie.FechaDisponible;
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

    @EJB
    private FechaDisponibleFacadeLocal fechaDisponibleFacadeL;
    private List<FechaDisponible> fechasDisponibles;
    private FechaDisponible fechaSeleccionada;

    public ListarFechasDisponiblesController() {
    }

    @PostConstruct
    public void init() {
        recargarFechasDisponibles();

    }

    private void recargarFechasDisponibles() {
        fechasDisponibles = fechaDisponibleFacadeL.findAll();
    }

    public FechaDisponibleFacadeLocal getFechaDisponibleFacadeLocal() {
        return fechaDisponibleFacadeL;
    }

    public void setFechaDisponibleFacadeLocal(FechaDisponibleFacadeLocal fechaDisponibleFacadeLocal) {
        this.fechaDisponibleFacadeL = fechaDisponibleFacadeLocal;
    }

    public List<FechaDisponible> getFechasDisponibles() {
        return fechasDisponibles;
    }

    public void setFechaSeleccionada(FechaDisponible fechaSeleccionada) {
        this.fechaSeleccionada = fechaSeleccionada;
    }

    public FechaDisponible getfechaSeleccionada() {
        return this.fechaSeleccionada;
    }

    public void eliminarfechaSeleccionada() {

        try {
            fechaDisponibleFacadeL.remove(fechaSeleccionada);
            MessageUtil.enviarMensajeInformacionGlobal("Eliminación correcta", "Se elimino correctamente fecha Seleccionada ");
        } catch (Exception e) {
            MessageUtil.enviarMensajeErrorGlobal("Error al eliminar las sesiones", "No se puede eliminar la fechaSeleccionada");
        }

    }

}
