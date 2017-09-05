/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.detallehorario.controller;

import com.mapris.modelo.dao.DetalleHorarioFacadeLocal;
import com.mapris.modelo.dao.HorarioFacadeLocal;
import com.mapris.modelo.entitie.Curso;
import com.mapris.modelo.entitie.DetalleHorario;
import com.mapris.modelo.entitie.Horario;
import com.mapris.util.MessageUtil;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.view.ViewScoped;
import javax.inject.Named;

/**
 *
 * @author SMEGS
 */
@Named(value = "registroDetalleHorarioController")
@ViewScoped
public class RegistrarDetalleHorarioController implements Serializable{

    @EJB
    private DetalleHorarioFacadeLocal dhfl;
    @EJB
    private HorarioFacadeLocal hfl;
    
    
    private DetalleHorario nuevoDetalleHorario;
    private Horario horario;
    private Curso curso;

    public RegistrarDetalleHorarioController() {
    }

    @PostConstruct
    public void init() {
        nuevoDetalleHorario = new DetalleHorario();
        horario = new Horario();
        curso = new Curso();

    }

    public DetalleHorario getNuevoDetalleHorario() {
        return nuevoDetalleHorario;
    }

    public void setNuevoDetalleHorario(DetalleHorario nuevoDetalleHorario) {
        this.nuevoDetalleHorario = nuevoDetalleHorario;
    }



    public void registrar() {

        if ( horario != null ) {
            
         
            dhfl.create(getNuevoDetalleHorario());
            System.out.println("se creo detalle");
            
            MessageUtil.enviarMensajeInformacionGlobal("Registro satisfactorio del calendario", "");

            init();

        } else {
            MessageUtil.enviarMensajeErrorGlobal("Registro fallido del calendario ", "");
        }
    }

    public Horario getHorario() {
        return horario;
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

}
