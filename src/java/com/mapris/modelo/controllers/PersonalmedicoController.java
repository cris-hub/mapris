package com.mapris.modelo.controllers;

import com.mapris.modelo.entities.Personalmedico;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.inject.Inject;

@Named(value = "personalmedicoController")
@ViewScoped
public class PersonalmedicoController extends AbstractController<Personalmedico> {

    @Inject
    private UsuarioController usuarioController;

    public PersonalmedicoController() {
        // Inform the Abstract parent controller of the concrete Personalmedico Entity
        super(Personalmedico.class);
    }

    /**
     * Resets the "selected" attribute of any parent Entity controllers.
     */
    public void resetParents() {
        usuarioController.setSelected(null);
    }

    /**
     * Sets the "items" attribute with a collection of Sesion entities that are
     * retrieved from Personalmedico?cap_first and returns the navigation
     * outcome.
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
     * Sets the "selected" attribute of the Usuario controller in order to
     * display its data in its View dialog.
     *
     * @param event Event object for the widget that triggered an action
     */
    public void prepareUsuario(ActionEvent event) {
        if (this.getSelected() != null && usuarioController.getSelected() == null) {
            usuarioController.setSelected(this.getSelected().getUsuario());
        }
    }
}
