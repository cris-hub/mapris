package com.mapris.modelo.controllers;

import com.mapris.modelo.entities.Servicio;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;

@Named(value = "servicioController")
@ViewScoped
public class ServicioController extends AbstractController<Servicio> {

    public ServicioController() {
        // Inform the Abstract parent controller of the concrete Servicio Entity
        super(Servicio.class);
    }

    /**
     * Sets the "items" attribute with a collection of Rutinaservicio entities
     * that are retrieved from Servicio?cap_first and returns the navigation
     * outcome.
     *
     * @return navigation outcome for Rutinaservicio page
     */
    public String navigateRutinasServicios() {
        if (this.getSelected() != null) {
            FacesContext.getCurrentInstance().getExternalContext().getRequestMap().put("Rutinaservicio_items", this.getSelected().getRutinasServicios());
        }
        return "/entities/rutinaservicio/index";
    }

}
