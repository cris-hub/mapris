/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.aplazamiento.controllers;

import com.mapris.modelo.dao.AplazamientoFacadeLocal;
import com.mapris.modelo.entitie.Aplazamiento;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */

@Named(value = "listarAplazamientoController")
@ViewScoped
public class ListarAplazamientoController implements Serializable{
    
    @EJB
    private AplazamientoFacadeLocal aplazamientoFacadeLocal;
    
    private List<Aplazamiento> aplazamientos;
    
    private Aplazamiento aplazamientoSeleccionado;

    public ListarAplazamientoController() {
    }

    @PostConstruct
    public void init(){
        recargarAplazamientos();
    }
    
    public void recargarAplazamientos(){
        aplazamientos = aplazamientoFacadeLocal.findAll();
    }
    
    public void eliminarAplazamiento(){
    aplazamientoFacadeLocal.remove(aplazamientoSeleccionado);
    }
    
    public List<Aplazamiento> getAplazamientos() {
        return aplazamientos;
    }

    
    
    public Aplazamiento getAplazamientoSeleccionado() {
        return aplazamientoSeleccionado;
    }

    public void setAplazamientoSeleccionado(Aplazamiento aplazamientoSeleccionado) {
        this.aplazamientoSeleccionado = aplazamientoSeleccionado;
    }
    
    
    
    
    
}
