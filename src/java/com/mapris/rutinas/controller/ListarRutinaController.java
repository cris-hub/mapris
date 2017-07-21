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
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "listarRutinaController")
@ViewScoped
public class ListarRutinaController implements Serializable{
//    cdi 


    @EJB
    private RutinaFacadeLocal rfl;

    private List<Rutina> rutina;
    
    private Rutina rutinaSeleccionada;
    
    
    public ListarRutinaController() {
    }

    @PostConstruct
    public void init() {
        recargarRutina();
    }
    
    private void recargarRutina(){
        rutina =  rfl.findAll();
    }

    public Rutina getRutinaSeleccionada() {
        return rutinaSeleccionada;
    }

    public void setRutinaSeleccionada(Rutina rutinaSeleccionada) {
        this.rutinaSeleccionada = rutinaSeleccionada;
    }

    public List<Rutina> getRutina() {
        return rutina;
    }

    public void setRutina(List<Rutina> rutina) {
        this.rutina = rutina;
    }

  
    
    
    
    public void eliminarRutina(){
        
        rutinaSeleccionada.setIdRutinas(rutinaSeleccionada.getIdRutinas());
        rutinaSeleccionada.setNombre(rutinaSeleccionada.getNombre());
        rutinaSeleccionada.setDescripcion(rutinaSeleccionada.getDescripcion());
      
            rfl.remove(rutinaSeleccionada);
            MessageUtil.enviarMensajeInformacionGlobal("Rutina eliminada con exito", "La rutina se ha eliminado correctamente");
            
            recargarRutina();
     
      
    }
    


}