package com.mapris.modelo.controllers;

import com.mapris.modelo.entities.Cliente;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.inject.Inject;

@Named(value = "clienteController")
@ViewScoped
public class ClienteController extends AbstractController<Cliente> {

    @Inject
    private DatoclinicoController datoclinicoController;
    @Inject
    private EmpresaController idEmpresaController;
    @Inject
    private UsuarioController usuarioController;

    public ClienteController() {
        // Inform the Abstract parent controller of the concrete Cliente Entity
        super(Cliente.class);
    }

    /**
     * Resets the "selected" attribute of any parent Entity controllers.
     */
    public void resetParents() {
        datoclinicoController.setSelected(null);
        idEmpresaController.setSelected(null);
        usuarioController.setSelected(null);
    }

    /**
     * Sets the "items" attribute with a collection of Inscripcion entities that
     * are retrieved from Cliente?cap_first and returns the navigation outcome.
     *
     * @return navigation outcome for Inscripcion page
     */
    public String navigateInscripciones() {
        if (this.getSelected() != null) {
            FacesContext.getCurrentInstance().getExternalContext().getRequestMap().put("Inscripcion_items", this.getSelected().getInscripciones());
        }
        return "/entities/inscripcion/index";
    }

    /**
     * Sets the "selected" attribute of the Datoclinico controller in order to
     * display its data in its View dialog.
     *
     * @param event Event object for the widget that triggered an action
     */
    public void prepareDatoclinico(ActionEvent event) {
        if (this.getSelected() != null && datoclinicoController.getSelected() == null) {
            datoclinicoController.setSelected(this.getSelected().getDatoclinico());
        }
    }

    /**
     * Sets the "items" attribute with a collection of Aplazamiento entities
     * that are retrieved from Cliente?cap_first and returns the navigation
     * outcome.
     *
     * @return navigation outcome for Aplazamiento page
     */
    public String navigateAplazamientos() {
        if (this.getSelected() != null) {
            FacesContext.getCurrentInstance().getExternalContext().getRequestMap().put("Aplazamiento_items", this.getSelected().getAplazamientos());
        }
        return "/entities/aplazamiento/index";
    }

    /**
     * Sets the "selected" attribute of the Empresa controller in order to
     * display its data in its View dialog.
     *
     * @param event Event object for the widget that triggered an action
     */
    public void prepareIdEmpresa(ActionEvent event) {
        if (this.getSelected() != null && idEmpresaController.getSelected() == null) {
            idEmpresaController.setSelected(this.getSelected().getIdEmpresa());
        }
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
