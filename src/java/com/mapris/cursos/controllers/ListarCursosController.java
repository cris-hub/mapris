/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.cursos.controllers;

import com.mapris.modelo.dao.CursoFacadeLocal;
import com.mapris.modelo.entitie.Curso;
import com.mapris.util.MessageUtil;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.view.ViewScoped;
import javax.inject.Named;

/**
 *
 * @author Ruben
 */
@Named(value = "listarCursosController")
@RequestScoped
public class ListarCursosController implements Serializable {

    public CursoFacadeLocal getCfl() {
        return cfl;
    }

    @EJB
    private CursoFacadeLocal cfl;
    

    private List<Curso> cursos;

    private Curso cursoSeleccionado;

    ArrayList<Curso> aux = new ArrayList();
    
    private List<Curso> programas;

    public ListarCursosController() {
    }

    @PostConstruct
    public void init() {
        cursos = new ArrayList();
        cursoSeleccionado = new Curso();
        ArrayList<Curso> aux = new ArrayList();
        programas = new ArrayList();
        recargarCursos();
        
        
    }

    private void recargarCursos() {
        cursos = cfl.findAll();
        
        for (Curso curso : cursos) {
            if (curso.getIdServicios().getTiposServicios().getIdTipoServicio().equals(1)) {

                programas.add(curso);
            }

        }

    }

    public List<Curso> getCursos() {
        return cursos;
    }

    public void setCursos(List<Curso> cursos) {
        this.cursos = cursos;
    }

    public Curso getCursoSeleccionado() {
        return cursoSeleccionado;
    }

    public void setCursoSeleccionado(Curso cursoSeleccionado) {
        this.cursoSeleccionado = cursoSeleccionado;
    }

     public List<Curso> getProgramasC() {
        return programas;
    }

    public void setProgramasC(List<Curso> programas) {
        this.programas = programas;
    }
    
    
    public List<Curso> getCitas() {

        for (Curso curso : cursos) {
            if (curso.getIdServicios().getTiposServicios().getIdTipoServicio().equals(3)) {
                if (curso.getEstado().equals("En proceso")) {                    
                aux.add(curso);
                }
            }

        }
        return aux;
    }

    public List<Curso> getActivides() {

        for (Curso curso : cursos) {
            if (curso.getIdServicios().getTiposServicios().getIdTipoServicio().equals(3)) {

                aux.add(curso);
            }

        }
        return aux;
    }

    public List<Curso> getProgramas() {

        for (Curso curso : cursos) {
            if (curso.getIdServicios().getTiposServicios().getIdTipoServicio().equals(1)) {

                aux.add(curso);
            }

        }
        return aux;
    }

    public List<Curso> getServicio() {

        for (Curso curso : cursos) {
            if (curso.getIdServicios().getTiposServicios().getIdTipoServicio().equals(2)) {

                aux.add(curso);
            }

        }
        return aux;
    }

    public void eliminarCurso() {

        if (cursoSeleccionado.getEstado().equalsIgnoreCase("En proceso")) {

            MessageUtil.enviarMensajeErrorGlobal("No se puede eliminar un curso en proceso", "Por favor cambie el estado del curso para poder eliminarlo");

        } else {

            try {
                cfl.remove(cursoSeleccionado);
                MessageUtil.enviarMensajeInformacionGlobal("Se ha eliminado satisfactoriamente el curso", "");

            } catch (Exception e) {
                e.getStackTrace();
                MessageUtil.enviarMensajeErrorGlobal("No se ha podido eliminar el curso", "Ha ocurrido un problema");

            }

        }

    }

}
