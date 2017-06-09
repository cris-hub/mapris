/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.citas.controllers;

import com.mapris.modelo.dao.RutinaFacadeLocal;
import com.mapris.modelo.entitie.Rutina;
import com.mapris.util.MessageUtil;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */

@Named(value="verUsuarioController")
@RequestScoped
public class RegistrarRutnaController {
    
    @EJB
    private RutinaFacadeLocal rutinaFacadeLocal;
    
    private Rutina nuevaRutina;

    public RegistrarRutnaController() {
    }
    
    
    public void registrar(){
        if (nuevaRutina != null) {
            try {
                rutinaFacadeLocal.create(nuevaRutina);
                MessageUtil.enviarMensajeInformacion(null, "Se ha registrado", "elregistro ha sido satisfactoria menten guardado");
            } catch (Exception e) {
                MessageUtil.enviarMensajeErrorGlobal("No se ha podido Registrar", "intentalo denuevo");
                e.printStackTrace();
            }
            
        }else{
                MessageUtil.enviarMensajeErrorGlobal("No se ha podido Registrar", "intentalo denuevo");
        
        }
    
    }
    
    

    public Rutina getNuevaRutina() {
        return nuevaRutina;
    }

    public void setNuevaRutina(Rutina nuevaRutina) {
        this.nuevaRutina = nuevaRutina;
    }
    
    
    
}
