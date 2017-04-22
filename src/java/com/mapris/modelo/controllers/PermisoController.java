package com.mapris.modelo.controllers;

import com.mapris.modelo.entities.Permiso;
import com.mapris.modelo.entities.Rol;
import com.mapris.modelo.entities.Usuario;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.inject.Inject;
import org.primefaces.model.menu.DefaultMenuItem;
import org.primefaces.model.menu.DefaultMenuModel;
import org.primefaces.model.menu.DefaultSubMenu;
import org.primefaces.model.menu.MenuModel;

@Named(value = "permisoController")
@ViewScoped
public class PermisoController extends AbstractController<Permiso> {

    @Inject
    private PermisoController permisoPadreController;
    @EJB
    private com.mapris.modelo.facade.PermisoFacade ejbFacade;
    private List<Permiso> lista;
    private MenuModel model;

    public PermisoController() {
        // Inform the Abstract parent controller of the concrete Permiso Entity
        super(Permiso.class);
    }

    /**
     * Resets the "selected" attribute of any parent Entity controllers.
     */
    public void resetParents() {
        permisoPadreController.setSelected(null);
    }

    /**
     * Sets the "selected" attribute of the Permiso controller in order to
     * display its data in its View dialog.
     *
     * @param event Event object for the widget that triggered an action
     */
    public void preparePermisoPadre(ActionEvent event) {
        if (this.getSelected() != null && permisoPadreController.getSelected() == null) {
            permisoPadreController.setSelected(this.getSelected().getPermisoPadre());
        }
    }

    /**
     * Sets the "items" attribute with a collection of Permiso entities that are
     * retrieved from Permiso?cap_first and returns the navigation outcome.
     *
     * @return navigation outcome for Permiso page
     */
    public String navigateSubPermisos() {
        if (this.getSelected() != null) {
            FacesContext.getCurrentInstance().getExternalContext().getRequestMap().put("Permiso_items", this.getSelected().getSubPermisos());
        }
        return "/entities/permiso/index";
    }

    /**
     * Sets the "items" attribute with a collection of Rol entities that are
     * retrieved from Permiso?cap_first and returns the navigation outcome.
     *
     * @return navigation outcome for Rol page
     */
    public String navigateRoles() {
        if (this.getSelected() != null) {
            FacesContext.getCurrentInstance().getExternalContext().getRequestMap().put("Rol_items", this.getSelected().getRoles());
        }
        return "/entities/rol/index";
    }

    @PostConstruct
    public void init() {
        this.listarMenus();
        model = new DefaultMenuModel();
        this.establecerPermisos();
    }

    public void listarMenus() {
        try {
            lista = ejbFacade.findAll();
        } catch (Exception e) {
//            mensaje jsf
        }
    }

    public void establecerPermisos() {
//        usuario que inicia session
        Usuario us = (Usuario) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("user");
//        variable para el rol del usuario que inicia session

        Rol permisoRol = null;

//recorre los permisos
        for (Permiso p : lista) {
//        recorrido de roles en permisos
            for (Rol role : p.getRoles()) {
//                compara que el rol del usuario y el del permisos tienen alguna relacion

//                    variable del permiso en comun
                permisoRol = role;
if (p.getTipo().equals("S") && permisoRol.getId().equals(us.getRoles().get(0).getId())) {
                DefaultSubMenu firstSubmenu = new DefaultSubMenu(p.getNombre());

                for (Permiso i : lista) {
                    Permiso subpermiso = i.getPermisoPadre();
                    if (subpermiso != null) {
                        if (subpermiso.getId() == p.getId()) {

                            DefaultMenuItem item = new DefaultMenuItem(i.getNombre(), i.getIcon(), i.getUrl());
                            firstSubmenu.addElement(item);

                        }

                    }

                }

                model.addElement(firstSubmenu);
            } else {
                if (p.getPermisoPadre() == null && permisoRol.getId().equals(us.getRoles().get(0).getId())) {
                    DefaultMenuItem item = new DefaultMenuItem(p.getNombre());
                    model.addElement(item);

                }
    
            }
            }

            
        }

    }

    public MenuModel getModel() {
        return model;
    }

    public void setModel(MenuModel model) {
        this.model = model;
    }

}
