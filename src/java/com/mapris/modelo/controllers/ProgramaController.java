package com.mapris.modelo.controllers;

import com.mapris.modelo.entities.Programa;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.inject.Inject;

@Named(value = "programaController")
@ViewScoped
public class ProgramaController extends AbstractController<Programa> {

    @Inject
    private RutinaservicioController rutinaserviciosidServiciosController;

    public ProgramaController() {
        // Inform the Abstract parent controller of the concrete Programa Entity
        super(Programa.class);
    }

    /**
     * Resets the "selected" attribute of any parent Entity controllers.
     */
    public void resetParents() {
        rutinaserviciosidServiciosController.setSelected(null);
    }

    /**
     * Sets the "items" attribute with a collection of Sesion entities that are
     * retrieved from Programa?cap_first and returns the navigation outcome.
     *
     * @return navigation outcome for Sesion page
     */
    public String navigateSesiones() {
        if (this.getSelected() != null) {
            FacesContext.getCurrentInstance().getExternalContext().getRequestMap().put("Sesion_items", this.getSelected().getSesiones());
        }
        return "/entities/sesion/index";
    }

    /**
     * Sets the "items" attribute with a collection of Inscripcion entities that
     * are retrieved from Programa?cap_first and returns the navigation outcome.
     *
     * @return navigation outcome for Inscripcion page
     */
    public String navigateInscripciones() {
        if (this.getSelected() != null) {
            FacesContext.getCurrentInstance().getExternalContext().getRequestMap().put("Inscripcion_items", this.getSelected().getInscripciones());
        }
        return "/entities/inscripcion/index";
    }

    /**
     * Sets the "selected" attribute of the Rutinaservicio controller in order
     * to display its data in its View dialog.
     *
     * @param event Event object for the widget that triggered an action
     */
    public void prepareRutinaserviciosidServicios(ActionEvent event) {
        if (this.getSelected() != null && rutinaserviciosidServiciosController.getSelected() == null) {
            rutinaserviciosidServiciosController.setSelected(this.getSelected().getRutinaserviciosidServicios());
        }
    }
}
