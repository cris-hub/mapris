/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "sesiones")
@XmlRootElement

public class Sesion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idSesiones")
    private Integer idSesiones;
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Column(name = "hora")
    @Temporal(TemporalType.TIME)
    private Date hora;
    
    @Column(name = "numeroSesiones")
    private Integer numeroSesiones;
    
    @JoinColumn(name = "idPersonalMedico", referencedColumnName = "idPersonalMedico")
    @ManyToOne
    private Personalmedico idPersonalMedico;
    
    @JoinColumn(name = "idPrograma", referencedColumnName = "idProgramas")
    @ManyToOne
    private Programa idPrograma;

    public Sesion() {
    }

    public Sesion(Integer idSesiones, Date fecha, Date hora, Integer numeroSesiones, Personalmedico idPersonalMedico, Programa idPrograma) {
        this.idSesiones = idSesiones;
        this.fecha = fecha;
        this.hora = hora;
        this.numeroSesiones = numeroSesiones;
        this.idPersonalMedico = idPersonalMedico;
        this.idPrograma = idPrograma;
    }

    public Integer getIdSesiones() {
        return idSesiones;
    }

    public void setIdSesiones(Integer idSesiones) {
        this.idSesiones = idSesiones;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public Integer getNumeroSesiones() {
        return numeroSesiones;
    }

    public void setNumeroSesiones(Integer numeroSesiones) {
        this.numeroSesiones = numeroSesiones;
    }

    public Personalmedico getIdPersonalMedico() {
        return idPersonalMedico;
    }

    public void setIdPersonalMedico(Personalmedico idPersonalMedico) {
        this.idPersonalMedico = idPersonalMedico;
    }

    public Programa getIdPrograma() {
        return idPrograma;
    }

    public void setIdPrograma(Programa idPrograma) {
        this.idPrograma = idPrograma;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 47 * hash + Objects.hashCode(this.idSesiones);
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
        final Sesion other = (Sesion) obj;
        if (!Objects.equals(this.idSesiones, other.idSesiones)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Sesion{" + "idSesiones=" + idSesiones + '}';
    }

   

  
}
