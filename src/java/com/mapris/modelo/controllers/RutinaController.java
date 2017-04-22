package com.mapris.modelo.controllers;

import com.mapris.modelo.entities.Rutina;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;

@Named(value = "rutinaController")
@ViewScoped
public class RutinaController extends AbstractController<Rutina> {

    public RutinaController() {
        // Inform the Abstract parent controller of the concrete Rutina Entity
        super(Rutina.class);
    }

    /**
     * Sets the "items" attribute with a collection of Rutinaservicio entities
     * that are retrieved from Rutina?cap_first and returns the navigation
     * outcome.
     *
     * @return navigation outcome for Rutinaservicio page
     */
    public String navigateRutinas() {
        if (this.getSelected() != null) {
            FacesContext.getCurrentInstance().getExternalContext().getRequestMap().put("Rutinaservicio_items", this.getSelected().getRutinas());
        }
        return "/entities/rutinaservicio/index";
    }

}
