package com.mapris.modelo.controllers;

import com.mapris.modelo.entities.Rol;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;

@Named(value = "rolController")
@ViewScoped
public class RolController extends AbstractController<Rol> {

    public RolController() {
        // Inform the Abstract parent controller of the concrete Rol Entity
        super(Rol.class);
    }

    /**
     * Sets the "items" attribute with a collection of Usuario entities that are
     * retrieved from Rol?cap_first and returns the navigation outcome.
     *
     * @return navigation outcome for Usuario page
     */
    public String navigateUsuarios() {
        if (this.getSelected() != null) {
            FacesContext.getCurrentInstance().getExternalContext().getRequestMap().put("Usuario_items", this.getSelected().getUsuarios());
        }
        return "/entities/usuario/index";
    }

    /**
     * Sets the "items" attribute with a collection of Permiso entities that are
     * retrieved from Rol?cap_first and returns the navigation outcome.
     *
     * @return navigation outcome for Permiso page
     */
    public String navigatePermisos() {
        if (this.getSelected() != null) {
            FacesContext.getCurrentInstance().getExternalContext().getRequestMap().put("Permiso_items", this.getSelected().getPermisos());
        }
        return "/entities/permiso/index";
    }

}
