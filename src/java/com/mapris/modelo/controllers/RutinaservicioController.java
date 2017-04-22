package com.mapris.modelo.controllers;

import com.mapris.modelo.entities.Rutinaservicio;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.inject.Inject;

@Named(value = "rutinaservicioController")
@ViewScoped
public class RutinaservicioController extends AbstractController<Rutinaservicio> {

    @Inject
    private RutinaController idRutinasController;
    @Inject
    private ServicioController idServiciosController;

    public RutinaservicioController() {
        // Inform the Abstract parent controller of the concrete Rutinaservicio Entity
        super(Rutinaservicio.class);
    }

    /**
     * Resets the "selected" attribute of any parent Entity controllers.
     */
    public void resetParents() {
        idRutinasController.setSelected(null);
        idServiciosController.setSelected(null);
    }

    /**
     * Sets the "selected" attribute of the Rutina controller in order to
     * display its data in its View dialog.
     *
     * @param event Event object for the widget that triggered an action
     */
    public void prepareIdRutinas(ActionEvent event) {
        if (this.getSelected() != null && idRutinasController.getSelected() == null) {
            idRutinasController.setSelected(this.getSelected().getIdRutinas());
        }
    }

    /**
     * Sets the "selected" attribute of the Servicio controller in order to
     * display its data in its View dialog.
     *
     * @param event Event object for the widget that triggered an action
     */
    public void prepareIdServicios(ActionEvent event) {
        if (this.getSelected() != null && idServiciosController.getSelected() == null) {
            idServiciosController.setSelected(this.getSelected().getIdServicios());
        }
    }

    /**
     * Sets the "items" attribute with a collection of Programa entities that
     * are retrieved from Rutinaservicio?cap_first and returns the navigation
     * outcome.
     *
     * @return navigation outcome for Programa page
     */
    public String navigateProgramas() {
        if (this.getSelected() != null) {
            FacesContext.getCurrentInstance().getExternalContext().getRequestMap().put("Programa_items", this.getSelected().getProgramas());
        }
        return "/entities/programa/index";
    }

}
