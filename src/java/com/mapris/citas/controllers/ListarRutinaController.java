/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.citas.controllers;

import com.mapris.modelo.dao.RutinaFacadeLocal;
import com.mapris.modelo.entitie.Rutina;
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
@Named(value = "listarRutinasController")
@ViewScoped
public class ListarRutinaController implements Serializable
{

    @EJB
    private RutinaFacadeLocal rutinaFacadeLocal;

    private List<Rutina> rutinas;
    
    private Rutina rutina;

    public ListarRutinaController() {
    }

    @PostConstruct
    public void init() {
        recargarRutinas();
    }

    private void recargarRutinas() {
        rutinas = rutinaFacadeLocal.findAll();
    }

    public void eliminarRutina() {
            rutinaFacadeLocal.remove(rutina);
        }

    public Rutina getRutina() {
        return rutina;
    }

    public void setRutina(Rutina rutina) {
        this.rutina = rutina;
    }

    public List<Rutina> getRutinas() {
        return rutinas;
    }
    
    
    
    }


