/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import java.util.List;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "programas")
@XmlRootElement
public class Programa implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idProgramas")
    private Integer idProgramas;
    
    @Column(name = "fechaInicio")
    @Temporal(TemporalType.DATE)
    private Date fechaInicio;
    
    @OneToMany(mappedBy = "idPrograma")
    private List<Sesion> sesiones;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idPrograma")
    private List<Inscripcion> inscripciones;
    
    @JoinColumn(name = "idRutinaServicios", referencedColumnName = "idRutinaServicios")
    @ManyToOne(optional = false)
    private Rutinaservicio rutinaserviciosidServicios;
    

    public Programa() {
    }

    public Programa(Integer idProgramas, Date fechaInicio, List<Sesion> sesiones, List<Inscripcion> inscripciones, Rutinaservicio rutinaserviciosidServicios) {
        this.idProgramas = idProgramas;
        this.fechaInicio = fechaInicio;
        this.sesiones = sesiones;
        this.inscripciones = inscripciones;
        this.rutinaserviciosidServicios = rutinaserviciosidServicios;
    }

    public Integer getIdProgramas() {
        return idProgramas;
    }

    public void setIdProgramas(Integer idProgramas) {
        this.idProgramas = idProgramas;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public List<Sesion> getSesiones() {
        return sesiones;
    }

    public void setSesiones(List<Sesion> sesiones) {
        this.sesiones = sesiones;
    }

    public List<Inscripcion> getInscripciones() {
        return inscripciones;
    }

    public void setInscripciones(List<Inscripcion> inscripciones) {
        this.inscripciones = inscripciones;
    }

    public Rutinaservicio getRutinaserviciosidServicios() {
        return rutinaserviciosidServicios;
    }

    public void setRutinaserviciosidServicios(Rutinaservicio rutinaserviciosidServicios) {
        this.rutinaserviciosidServicios = rutinaserviciosidServicios;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 53 * hash + Objects.hashCode(this.idProgramas);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Programa other = (Programa) obj;
        if (!Objects.equals(this.idProgramas, other.idProgramas)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Programa{" + "idProgramas=" + idProgramas + '}';
    }

   
   
}
