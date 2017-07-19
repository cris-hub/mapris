/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mapris.rutinas.controller;


import com.mapris.modelo.dao.RutinaFacadeLocal;
import com.mapris.modelo.entitie.Rutina;
import com.mapris.util.MessageUtil;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author Ruben
 */
@Named(value = "editarRutinaController")
@SessionScoped
public class EditarRutinaController implements Serializable {

    @EJB
    private RutinaFacadeLocal cfl;
    
    private Rutina rutinaSeleccionada;
    
    @PostConstruct
    public void init(){
    //Instancia una nueva empresa, para que pueda modificar la seleccionada
    rutinaSeleccionada = new Rutina();
    }

    public EditarRutinaController() {
    }

    public Rutina getRutinaSelecionado() {
        return rutinaSeleccionada;
    }

    public void setRutinaSelecionada(Rutina rutinaSeleccionada) {
        this.rutinaSeleccionada = rutinaSeleccionada;
    }

    public void actualizarDatos() {
        try {
            
            
            rutinaSeleccionada.setNombre(rutinaSeleccionada.getNombre());
            rutinaSeleccionada.setDescripcion(rutinaSeleccionada.getDescripcion());
           
            //Datos modificados
            
            cfl.edit(rutinaSeleccionada);//Codigo de modificación de la empresa
            MessageUtil.enviarMensajeInformacion("form-editar", "Actualizacion", "los datos fueron actualizados");
        } catch (Exception e) {
            e.printStackTrace();
            MessageUtil.enviarMensajeErrorGlobal("Error al modificar los datos del rutina", e.getStackTrace().toString());
        }

    }
    
    public String preModificar(Rutina e){
        
        setRutinaSelecionada(e);//Datos de la empresa que se selecciono
        return "/app/administrador/rutinas/editar.xhtml?faces-redirect=true";
    }
    
      
    

}
