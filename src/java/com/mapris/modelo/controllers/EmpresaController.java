package com.mapris.modelo.controllers;

import com.mapris.modelo.entities.Empresa;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;

@Named(value = "empresaController")
@ViewScoped
public class EmpresaController extends AbstractController<Empresa> {

    public EmpresaController() {
        // Inform the Abstract parent controller of the concrete Empresa Entity
        super(Empresa.class);
    }

    /**
     * Sets the "items" attribute with a collection of Cliente entities that are
     * retrieved from Empresa?cap_first and returns the navigation outcome.
     *
     * @return navigation outcome for Cliente page
     */
    public String navigateClientes() {
        if (this.getSelected() != null) {
            FacesContext.getCurrentInstance().getExternalContext().getRequestMap().put("Cliente_items", this.getSelected().getClientes());
        }
        return "/entities/cliente/index";
    }

}
