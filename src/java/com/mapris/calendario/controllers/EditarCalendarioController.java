/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mapris.calendario.controllers;


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
@Named(value = "editarCalendarioController")
@SessionScoped
public class EditarCalendarioController implements Serializable {

    
    
    @PostConstruct
    public void init(){
    //Instancia una nueva empresa, para que pueda modificar la seleccionada
   
    }

    public EditarCalendarioController() {
    }

   

    public void actualizarDatos() {
        try {
            
            
           
            //Datos modificados
            
//            cfl.edit(calendarioSeleccionado);//Codigo de modificación de la empresa
            MessageUtil.enviarMensajeInformacion("form-editar", "Actualizacion", "los datos fueron actualizados");
        } catch (Exception e) {
            e.printStackTrace();
            MessageUtil.enviarMensajeErrorGlobal("Error al modificar los datos del calendario", e.getStackTrace().toString());
        }

    }
    
    public String preModificar(int e){
       
        return "/app/administrador/calendario/editar.xhtml?faces-redirect=true";
    }
    
      
    

}
