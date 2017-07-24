/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.rutinasservicios.controller;

import com.mapris.modelo.dao.RutinaservicioFacadeLocal;
import com.mapris.modelo.entitie.Rutinaservicio;
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
@Named(value = "listarRutinasServiviosController")
@ViewScoped
public class ListarRutinasServiciosController implements Serializable {
//    cdi

    @EJB
    private RutinaservicioFacadeLocal rsfl;

    private List<Rutinaservicio> rutinaServicios;

    private Rutinaservicio rutinaServicioSeleccionada;

    public ListarRutinasServiciosController() {
    }

    @PostConstruct
    public void init() {
        recargarRutinaServicio();
    }

    private void recargarRutinaServicio() {
        rutinaServicios = rsfl.findAll();
    }

    public Rutinaservicio getRutinaSeleccionada() {
        return rutinaServicioSeleccionada;
    }

    public void setRutinaSeleccionada(Rutinaservicio rutinaServicioSeleccionada) {
        this.rutinaServicioSeleccionada = rutinaServicioSeleccionada;
    }

    public List<Rutinaservicio> getRutinaServicio() {
        return rutinaServicios;
    }

    public void setRutinaServicio(List<Rutinaservicio> rutinaServicio) {
        this.rutinaServicios = rutinaServicio;
    }

    public void eliminarRutinaServicio() {

        rutinaServicioSeleccionada.setIdRutinaServicios(rutinaServicioSeleccionada.getIdRutinaServicios());
        rutinaServicioSeleccionada.setIdRutinas(rutinaServicioSeleccionada.getIdRutinas());
        rutinaServicioSeleccionada.setIdServicios(rutinaServicioSeleccionada.getIdServicios());

        rsfl.remove(rutinaServicioSeleccionada);
        MessageUtil.enviarMensajeInformacionGlobal("Rutina Servicio eliminada con exito", "La rutina servicio se ha eliminado correctamente");

        recargarRutinaServicio();

    }

}
