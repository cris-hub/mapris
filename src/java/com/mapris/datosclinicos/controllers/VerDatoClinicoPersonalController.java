/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.datosclinicos.controllers;

import com.mapris.login.controller.SessionController;
import com.mapris.modelo.dao.DatoclinicoFacadeLocal;
import com.mapris.modelo.entitie.Cliente;
import com.mapris.modelo.entitie.Datoclinico;
import com.mapris.util.MessageUtil;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.view.ViewScoped;

import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author Ruben
 */
@Named(value="verDatoClinicoPersonalController")
@ViewScoped
public class VerDatoClinicoPersonalController implements Serializable{
    
    
    
    @EJB
    private DatoclinicoFacadeLocal dcfl;
    
    private Datoclinico datoClinico;
    
  
    
   

    public VerDatoClinicoPersonalController() {
            
    }
    
    @PostConstruct
    public void init(){

       
        
    }

    public Datoclinico getDatoClinico() {
        return datoClinico;
    }

    public void setDatoClinico(Datoclinico datoClinico) {
        this.datoClinico = datoClinico;
    }
  
    


    
    
    
    
    
    
    public String verDatoclinico(Datoclinico i){
    this.datoClinico = i;
    
    System.out.println(this.datoClinico.getAlergias());
   
    return "/app/personal/datos/ver.xhtml?faces-redirect=true";
    }
    
    
    
    
    
    
    
    public void eliminarDatoclinico(){
        if (datoClinico != null) {
            
            dcfl.remove(datoClinico);
            MessageUtil.enviarMensajeInformacionGlobal("Se elimino satisfactoriamente", "Se elimino satisfactoriamente el dato clinico");
            
        }else{
        
            MessageUtil.enviarMensajeErrorGlobal("No se pudo eliminar", "No se pudo elimnar el dato clinico");
        }
        
    }
    
    
}
