/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.calendario.controllers;


import com.mapris.util.MessageUtil;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "listarCalendarioController")
@ViewScoped
public class ListarCalendarioController implements Serializable{
//    cdi 

;
    
    
    public ListarCalendarioController() {
    }

    @PostConstruct
    public void init() {
        
    }
    
   
    
    public void versionMojarra(){
    
    Package p = FacesContext.class.getPackage();
     System.out.println(p.getImplementationTitle() + " " + p.getImplementationVersion());
    }
    
    public void eliminarCalendario(){
        
      
           
            MessageUtil.enviarMensajeInformacionGlobal("Calendario eliminada con exito", "La empresa se ha eliminado correctamente");
            
            
     
      
    }
    


}
