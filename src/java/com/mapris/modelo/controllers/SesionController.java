package com.mapris.modelo.controllers;

import com.mapris.modelo.entities.Sesion;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.faces.event.ActionEvent;
import javax.inject.Inject;

@Named(value = "sesionController")
@ViewScoped
public class SesionController extends AbstractController<Sesion> {

    @Inject
    private PersonalmedicoController idPersonalMedicoController;
    @Inject
    private ProgramaController idProgramaController;

    public SesionController() {
        // Inform the Abstract parent controller of the concrete Sesion Entity
        super(Sesion.class);
    }

    /**
     * Resets the "selected" attribute of any parent Entity controllers.
     */
    public void resetParents() {
        idPersonalMedicoController.setSelected(null);
        idProgramaController.setSelected(null);
    }

    /**
     * Sets the "selected" attribute of the Personalmedico controller in order
     * to display its data in its View dialog.
     *
     * @param event Event object for the widget that triggered an action
     */
    public void prepareIdPersonalMedico(ActionEvent event) {
        if (this.getSelected() != null && idPersonalMedicoController.getSelected() == null) {
            idPersonalMedicoController.setSelected(this.getSelected().getIdPersonalMedico());
        }
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
}
