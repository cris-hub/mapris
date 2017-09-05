/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.horario.controller;

import com.mapris.modelo.dao.DetalleHorarioFacadeLocal;
import com.mapris.modelo.dao.HorarioFacadeLocal;
import com.mapris.modelo.dao.ServicioFacadeLocal;
import com.mapris.modelo.entitie.Curso;
import com.mapris.modelo.entitie.DetalleHorario;
import com.mapris.modelo.entitie.Horario;
import com.mapris.modelo.entitie.Servicio;
import com.mapris.util.MessageUtil;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;

/**
 *
 * @author Ruben
 */
@Named(value = "registrarHorarioController")
@RequestScoped
public class RegistrarHorarioController {

    @EJB
    private HorarioFacadeLocal cfl;
    @EJB
    private DetalleHorarioFacadeLocal hdfl;
    
    private Horario horario;
    private Curso curso;
    private DetalleHorario dethorario;
    private List<DetalleHorario> dethorarios ;

    public RegistrarHorarioController() {
    }

    @PostConstruct
    public void init() {
        dethorarios = new ArrayList() ;
        dethorario = new DetalleHorario();
        curso = new Curso();
        horario = new Horario();

    }

    public List<DetalleHorario> getDethorarios() {
        return dethorarios;
    }

    public void setDethorarios(List<DetalleHorario> dethorarios) {
        this.dethorarios = dethorarios;
    }

 

    public Horario getHorario() {
        return horario;
    }

    public DetalleHorario getDethorario() {
        return dethorario;
    }

    public void setDethorario(DetalleHorario dethorario) {
        this.dethorario = dethorario;
    }

    public void setHorario(Horario horario) {
        this.horario = horario;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public void registrar() {
        if (horario != null) {
            try {
                if ( curso!= null) {
                horario.setIdCursos(curso);
                    System.out.println("se paso el curso");
                cfl.create(horario);
                    System.out.println(" se creo hotario");
                    System.out.println("se paso horario");
                dethorario.setIdHorarios(cfl.find(horario.getIdHorario()));
                    System.out.println("se crea");
                hdfl.create(dethorario);
                    System.out.println("termino se crea");
                
                
                }else{ 
                    
                MessageUtil.enviarMensajeInformacion(null, "Registro no  exito", "No Se ha registrado correctamente el curso");
                }
                MessageUtil.enviarMensajeInformacion(null, "Registro con exito", "Se ha registrado correctamente el curso");
            } catch (Exception e) {
                MessageUtil.enviarMensajeErrorGlobal("No se ha podido registrar", "El curso no se ha podido registrar correctamente");
                e.printStackTrace();
            }
            init();
        } else {
            MessageUtil.enviarMensajeErrorGlobal("No se ha podido registrar el curso", "Intentalo de nuevo");

        }

    }
   
    

}
