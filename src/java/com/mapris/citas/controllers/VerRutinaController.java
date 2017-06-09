/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.citas.controllers;

import com.mapris.modelo.entitie.Rutina;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named
@SessionScoped
public class VerRutinaController implements Serializable {

    private Rutina rutina;

    public VerRutinaController() {
    }

    @PostConstruct
    public void init() {

    }

    public String verRutina(Rutina rutina) {

        this.rutina = rutina;

        return "app/citas/verrutina.xhtml?faces-redict=true";
    }

    public Rutina getRutina() {
        return rutina;
    }

    public void setRutina(Rutina rutina) {
        this.rutina = rutina;
    }

}
