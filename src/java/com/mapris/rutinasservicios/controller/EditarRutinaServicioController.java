/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.rutinasservicios.controller;

import com.mapris.modelo.dao.RutinaservicioFacadeLocal;
import com.mapris.modelo.entitie.Rutinaservicio;
import com.mapris.util.MessageUtil;
import java.io.Serializable;
import java.util.Date;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author Ruben
 */
@Named(value = "editarRutinaServicioController")
@SessionScoped
public class EditarRutinaServicioController implements Serializable {

    @EJB
    private RutinaservicioFacadeLocal rsfl;
    
    private Rutinaservicio rutinaServicioSeleccionada;
   
    
    @PostConstruct
    public void init(){
    rutinaServicioSeleccionada = new Rutinaservicio();
    }

    public EditarRutinaServicioController() {
    }

    public Rutinaservicio getRutinaservicioSelecionada() {
        return rutinaServicioSeleccionada;
    }

    public void setRutinaservicioSelecionada(Rutinaservicio rutinaServicioSeleccionada) {
        this.rutinaServicioSeleccionada = rutinaServicioSeleccionada;
    }

   public void actualizarDatos() {
        try {
            
            
          
//       
            
            rsfl.edit(rutinaServicioSeleccionada);
            MessageUtil.enviarMensajeInformacionGlobal("Actualizacion", "los datos fueron actualizados");
        } catch (Exception e) {
            e.printStackTrace();
            MessageUtil.enviarMensajeErrorGlobal("Error al modificar los datos de las rutinas y servicios", e.getStackTrace().toString());
        }

    }
    
    public String preModificar(Rutinaservicio i){
        setRutinaservicioSelecionada(i);
        return "/app/administrador/rutinaservicios/editar.xhtml?faces-redirect=true";
    }
    
   

    
    
      
    

}
