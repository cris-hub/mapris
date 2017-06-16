/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.aplazamiento.controllers;

import javax.inject.Named;
import javax.enterprise.context.RequestScoped;
import com.mapris.util.Fecha;
import java.util.Date;
/**
 *
 * @author andres
 */
@Named(value = "registrarAplazamientoController")
@RequestScoped
public class RegistrarAplazamientoController {

    /**
     * Creates a new instance of RegistrarSesionController
     */
    public RegistrarAplazamientoController() {
    }
    
    public Date getFechaHoraActual(){
    Fecha fecha = new Fecha ();
    return fecha.getFechaActual();
    }
    
}