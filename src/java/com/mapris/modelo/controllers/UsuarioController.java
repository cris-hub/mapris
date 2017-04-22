package com.mapris.modelo.controllers;

import com.mapris.modelo.entities.Usuario;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.inject.Inject;

@Named(value = "usuarioController")
@ViewScoped
public class UsuarioController extends AbstractController<Usuario> {

    @Inject
    private PersonalmedicoController personalmedicoController;
    @Inject
    private ClienteController clientesController;

    public UsuarioController() {
        // Inform the Abstract parent controller of the concrete Usuario Entity
        super(Usuario.class);
    }

    /**
     * Resets the "selected" attribute of any parent Entity controllers.
     */
    public void resetParents() {
        personalmedicoController.setSelected(null);
        clientesController.setSelected(null);
    }

    /**
     * Sets the "items" attribute with a collection of Rol entities that are
     * retrieved from Usuario?cap_first and returns the navigation outcome.
     *
     * @return navigation outcome for Rol page
     */
    public String navigateRoles() {
        if (this.getSelected() != null) {
            FacesContext.getCurrentInstance().getExternalContext().getRequestMap().put("Rol_items", this.getSelected().getRoles());
        }
        return "/entities/rol/index";
    }

    /**
     * Sets the "selected" attribute of the Personalmedico controller in order
     * to display its data in its View dialog.
     *
     * @param event Event object for the widget that triggered an action
     */
    public void preparePersonalmedico(ActionEvent event) {
        if (this.getSelected() != null && personalmedicoController.getSelected() == null) {
            personalmedicoController.setSelected(this.getSelected().getPersonalmedico());
        }
    }

    /**
     * Sets the "selected" attribute of the Cliente controller in order to
     * display its data in its View dialog.
     *
     * @param event Event object for the widget that triggered an action
     */
    public void prepareClientes(ActionEvent event) {
        if (this.getSelected() != null && clientesController.getSelected() == null) {
            clientesController.setSelected(this.getSelected().getClientes());
        }
    }
}
