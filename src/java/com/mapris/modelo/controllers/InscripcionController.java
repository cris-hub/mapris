package com.mapris.modelo.controllers;

import com.mapris.modelo.entities.Inscripcion;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.faces.event.ActionEvent;
import javax.inject.Inject;

@Named(value = "inscripcionController")
@ViewScoped
public class InscripcionController extends AbstractController<Inscripcion> {

    @Inject
    private ProgramaController idProgramaController;
    @Inject
    private ClienteController idClienteController;

    public InscripcionController() {
        // Inform the Abstract parent controller of the concrete Inscripcion Entity
        super(Inscripcion.class);
    }

    /**
     * Resets the "selected" attribute of any parent Entity controllers.
     */
    public void resetParents() {
        idProgramaController.setSelected(null);
        idClienteController.setSelected(null);
    }

    /**
     * Sets the "selected" attribute of the Programa controller in order to
     * display its data in its View dialog.
     *
     * @param event Event object for the widget that triggered an action
     */
    public void prepareIdPrograma(ActionEvent event) {
        if (this.getSelected() != null && idProgramaController.getSelected() == null) {
            idProgramaController.setSelected(this.getSelected().getIdPrograma());
        }
    }

    /**
     * Sets the "selected" attribute of the Cliente controller in order to
     * display its data in its View dialog.
     *
     * @param event Event object for the widget that triggered an action
     */
    public void prepareIdCliente(ActionEvent event) {
        if (this.getSelected() != null && idClienteController.getSelected() == null) {
            idClienteController.setSelected(this.getSelected().getIdCliente());
        }
    }
}
