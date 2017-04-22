package com.mapris.modelo.controllers;

import com.mapris.modelo.entities.Aplazamiento;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.faces.event.ActionEvent;
import javax.inject.Inject;

@Named(value = "aplazamientoController")
@ViewScoped
public class AplazamientoController extends AbstractController<Aplazamiento> {

    @Inject
    private ClienteController idclienteController;

    public AplazamientoController() {
        // Inform the Abstract parent controller of the concrete Aplazamiento Entity
        super(Aplazamiento.class);
    }

    /**
     * Resets the "selected" attribute of any parent Entity controllers.
     */
    public void resetParents() {
        idclienteController.setSelected(null);
    }

    /**
     * Sets the "selected" attribute of the Cliente controller in order to
     * display its data in its View dialog.
     *
     * @param event Event object for the widget that triggered an action
     */
    public void prepareIdcliente(ActionEvent event) {
        if (this.getSelected() != null && idclienteController.getSelected() == null) {
            idclienteController.setSelected(this.getSelected().getIdcliente());
        }
    }
}
