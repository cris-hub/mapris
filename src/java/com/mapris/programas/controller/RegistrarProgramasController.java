/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.programas.controller;


import com.mapris.util.MessageUtil;

import java.util.Calendar;
import java.util.Date;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "registrarProgramasController")
@RequestScoped
public class RegistrarProgramasController {




    public RegistrarProgramasController() {
    }

    @PostConstruct
    public void init() {
      

    }

  
    public void registrar() {
        
        Date hoy = new Date();
//        if (nuevoPrograma != null) {
//        
//        
//        try{
//                
//                nuevoPrograma.setIdPrograma(nuevoPrograma.getIdPrograma());
//               
//                nuevoPrograma.setFechaRegistro(hoy);
//                nuevoPrograma.setNombre(nuevoPrograma.getNombre());
//                nuevoPrograma.setIdRutinas(nuevoPrograma.getIdRutinas());
//                nuevoPrograma.setIdSalones(nuevoPrograma.getIdSalones());
//                
//                
//                programaFacadeLocal.create(nuevoPrograma);
//               
//                MessageUtil.enviarMensajeInformacionGlobal("Registro satisfactorio", "El salón se ha creado con exito");
//                init();
//                
//                
//                
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        } else {
//            MessageUtil.enviarMensajeInformacionGlobal( "Error al registrar el salón", "No se pudo registrar el salón");
//        }
    }

}
