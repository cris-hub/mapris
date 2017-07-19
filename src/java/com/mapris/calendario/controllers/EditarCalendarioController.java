/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mapris.calendario.controllers;


import com.mapris.modelo.dao.CalendarioFacadeLocal;
import com.mapris.modelo.entitie.Calendario;
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

    @EJB
    private CalendarioFacadeLocal cfl;
    
    private Calendario calendarioSeleccionado;
    
    @PostConstruct
    public void init(){
    //Instancia una nueva empresa, para que pueda modificar la seleccionada
    calendarioSeleccionado = new Calendario();
    }

    public EditarCalendarioController() {
    }

    public Calendario getCalendarioSelecionado() {
        return calendarioSeleccionado;
    }

    public void setCalendarioSelecionada(Calendario calendarioSeleccionado) {
        this.calendarioSeleccionado = calendarioSeleccionado;
    }

    public void actualizarDatos() {
        try {
            
            
            calendarioSeleccionado.setLunes(calendarioSeleccionado.getLunes());
            calendarioSeleccionado.setMartes(calendarioSeleccionado.getMartes());
            calendarioSeleccionado.setMiercoles(calendarioSeleccionado.getMiercoles());
            calendarioSeleccionado.setJueves(calendarioSeleccionado.getJueves());
            calendarioSeleccionado.setViernes(calendarioSeleccionado.getViernes());
            calendarioSeleccionado.setSabado(calendarioSeleccionado.getSabado());
            calendarioSeleccionado.setDomingo(calendarioSeleccionado.getDomingo());
            //Datos modificados
            
            cfl.edit(calendarioSeleccionado);//Codigo de modificación de la empresa
            MessageUtil.enviarMensajeInformacion("form-editar", "Actualizacion", "los datos fueron actualizados");
        } catch (Exception e) {
            e.printStackTrace();
            MessageUtil.enviarMensajeErrorGlobal("Error al modificar los datos del calendario", e.getStackTrace().toString());
        }

    }
    
    public String preModificar(Calendario e){
        
        setCalendarioSelecionada(e);//Datos de la empresa que se selecciono
        return "/app/administrador/calendario/editar.xhtml?faces-redirect=true";
    }
    
      
    

}
