/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.programas.controller;

import com.mapris.modelo.dao.ProgramaFacadeLocal;
import com.mapris.modelo.entitie.Programa;
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
@Named(value = "editarProgramasController")
@SessionScoped
public class EditarProgramasController implements Serializable {

    @EJB
    private ProgramaFacadeLocal pfl;
    
    private Programa programaSeleccionado;

   
    
    @PostConstruct
    public void init(){
    programaSeleccionado = new Programa();
    }

    public EditarProgramasController() {
    }

    public Programa getProgramaSeleccionado() {
        return programaSeleccionado;
    }

    public void setProgramaSeleccionado(Programa programaSeleccionado) {
        this.programaSeleccionado = programaSeleccionado;
    }

   public void actualizarDatos() {
        try {
            
            
            
            programaSeleccionado.setNombre(programaSeleccionado.getNombre());
            
           
//       
            
            pfl.edit(programaSeleccionado);
            MessageUtil.enviarMensajeInformacionGlobal("Actualizacion", "los datos fueron actualizados");
        } catch (Exception e) {
            e.printStackTrace();
            MessageUtil.enviarMensajeErrorGlobal("Error al modificar los datos de la inscripción", e.getStackTrace().toString());
        }

    }
    
    public String preModificar(Programa i){
        setProgramaSeleccionado(i);
        return "/app/administrador/programas/editar.xhtml?faces-redirect=true";
    }
    
   

    
    
      
    

}
