package com.mapris.modelo.controllers;

import com.mapris.modelo.entities.Datoclinico;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.faces.event.ActionEvent;
import javax.inject.Inject;

@Named(value = "datoclinicoController")
@ViewScoped
public class DatoclinicoController extends AbstractController<Datoclinico> {

    @Inject
    private UsuarioController clientesController;

    public DatoclinicoController() {
        // Inform the Abstract parent controller of the concrete Datoclinico Entity
        super(Datoclinico.class);
    }

    /**
     * Resets the "selected" attribute of any parent Entity controllers.
     */
    public void resetParents() {
        clientesController.setSelected(null);
    }

    /**
     * Sets the "selected" attribute of the Usuario controller in order to
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
