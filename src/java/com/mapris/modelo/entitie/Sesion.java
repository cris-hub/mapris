/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "sesiones")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sesion.findAll", query = "SELECT s FROM Sesion s")
    , @NamedQuery(name = "Sesion.findByHora", query = "SELECT s FROM Sesion s WHERE s.hora = :hora")
    , @NamedQuery(name = "Sesion.findByEstado", query = "SELECT s FROM Sesion s WHERE s.estado = :estado")})
public class Sesion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idSesiones")
    private int idSesiones;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;

    
    @Column(name = "hora")
    @Temporal(TemporalType.TIME)
    private Date hora;
    
    @Column(name = "estado")
    private Short estado;
    
    @JoinColumn(name = "idPersonalMedico", referencedColumnName = "idPersonalMedico")
    @ManyToOne(fetch = FetchType.LAZY)
    private Personalmedico idPersonalMedico;
    
    @JoinColumn(name = "inscripciones_idInscripciones", referencedColumnName = "idInscripciones")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Inscripcion inscripcionesidInscripciones;

    public Sesion() {
    }

 

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public Short getEstado() {
        return estado;
    }

    public void setEstado(Short estado) {
        this.estado = estado;
    }

    public Personalmedico getIdPersonalMedico() {
        return idPersonalMedico;
    }

    public void setIdPersonalMedico(Personalmedico idPersonalMedico) {
        this.idPersonalMedico = idPersonalMedico;
    }

    public Inscripcion getInscripcionesidInscripciones() {
        return inscripcionesidInscripciones;
    }

    public void setInscripcionesidInscripciones(Inscripcion inscripcionesidInscripciones) {
        this.inscripcionesidInscripciones = inscripcionesidInscripciones;
    }

    public int getIdSesiones() {
        return idSesiones;
    }

    public void setIdSesiones(int idSesiones) {
        this.idSesiones = idSesiones;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 83 * hash + this.idSesiones;
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
        if (this.idSesiones != other.idSesiones) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Sesion{" + "idSesiones=" + idSesiones + '}';
    }

  
    
}
