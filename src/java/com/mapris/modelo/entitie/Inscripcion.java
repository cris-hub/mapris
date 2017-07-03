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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ruben
 */
@Entity
@Table(name = "inscripciones")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Inscripcion.findAll", query = "SELECT i FROM Inscripcion i")
    , @NamedQuery(name = "Inscripcion.findByIdInscripciones", query = "SELECT i FROM Inscripcion i WHERE i.idInscripciones = :idInscripciones")
    , @NamedQuery(name = "Inscripcion.findByFechaInicio", query = "SELECT i FROM Inscripcion i WHERE i.fechaInicio = :fechaInicio")
    , @NamedQuery(name = "Inscripcion.findByValor", query = "SELECT i FROM Inscripcion i WHERE i.valor = :valor")
    , @NamedQuery(name = "Inscripcion.findByIdCliente", query = "SELECT i FROM Inscripcion i WHERE i.idCliente = :idCliente")
    , @NamedQuery(name = "Inscripcion.findByEstado", query = "SELECT i FROM Inscripcion i WHERE i.estado = :estado")})
public class Inscripcion implements Serializable {

    

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idInscripciones")
    private Integer idInscripciones;
    @Column(name = "fechaInicio")
    @Temporal(TemporalType.DATE)
    private Date fechaInicio;
    @Column(name = "valor")
    private Integer valor;
    @Size(max = 25)
    @Column(name = "estado")
    private String estado;
    @Column(name = "fechaAplazamiento")
    @Temporal(TemporalType.DATE)
    private Date fechaAplazamiento;
    @Column(name = "fechaRetornoAplazamiento")
    @Temporal(TemporalType.DATE)
    private Date fechaRetornoAplazamiento;
    @JoinColumn(name = "idCliente", referencedColumnName = "idClientes")
    @ManyToOne(optional = false)
    private Cliente idCliente;
    @JoinColumn(name = "idPrograma", referencedColumnName = "idPrograma")
    @ManyToOne(optional = false)
    private Programa idPrograma;
    @JoinColumn(name = "idSesiones", referencedColumnName = "idSesiones")
    @ManyToOne(optional = false)
    private Sesion idSesiones;

    public Inscripcion() {
    }

    public Inscripcion(Integer idInscripciones) {
        this.idInscripciones = idInscripciones;
    }

    public Integer getIdInscripciones() {
        return idInscripciones;
    }

    public void setIdInscripciones(Integer idInscripciones) {
        this.idInscripciones = idInscripciones;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Integer getValor() {
        return valor;
    }

    public void setValor(Integer valor) {
        this.valor = valor;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFechaAplazamiento() {
        return fechaAplazamiento;
    }

    public void setFechaAplazamiento(Date fechaAplazamiento) {
        this.fechaAplazamiento = fechaAplazamiento;
    }

    public Date getFechaRetornoAplazamiento() {
        return fechaRetornoAplazamiento;
    }

    public void setFechaRetornoAplazamiento(Date fechaRetornoAplazamiento) {
        this.fechaRetornoAplazamiento = fechaRetornoAplazamiento;
    }
    
    

    public Cliente getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Cliente idCliente) {
        this.idCliente = idCliente;
    }

    public Programa getIdPrograma() {
        return idPrograma;
    }

    public void setIdPrograma(Programa idPrograma) {
        this.idPrograma = idPrograma;
    }
    
    public Sesion getIdSesiones() {
        return idSesiones;
    }

    public void setIdSesiones(Sesion idSesiones) {
        this.idSesiones = idSesiones;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idInscripciones != null ? idInscripciones.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Inscripcion)) {
            return false;
        }
        Inscripcion other = (Inscripcion) object;
        if ((this.idInscripciones == null && other.idInscripciones != null) || (this.idInscripciones != null && !this.idInscripciones.equals(other.idInscripciones))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.Inscripcion[ idInscripciones=" + idInscripciones + " ]";
    }

    
}
