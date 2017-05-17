/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "inscripciones")
@XmlRootElement
public class Inscripcion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idInscripciones")
    private Integer idInscripciones;
    
    
    @Column(name = "fechaInicio")
    @Temporal(TemporalType.DATE)
    private Date fechaInicio;
    
    
    @Column(name = "fechaFin")
    @Temporal(TemporalType.DATE)
    private Date fechaFin;
    
    @Column(name = "valor")
    private Integer valor;
    
    @JoinColumn(name = "idPrograma", referencedColumnName = "idProgramas")
    @ManyToOne(optional = false)
    private Programa idPrograma;
    
    
    @JoinColumn(name = "idCliente", referencedColumnName = "idClientes")
    @ManyToOne(optional = false)
    private Cliente idCliente;

    public Inscripcion() {
    }

    
    public Inscripcion(Integer idInscripciones, Date fechaInicio, Date fechaFin, Integer valor, Programa idPrograma, Cliente idCliente) {
        this.idInscripciones = idInscripciones;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.valor = valor;
        this.idPrograma = idPrograma;
        this.idCliente = idCliente;
    }

    public Inscripcion(Integer idInscripciones, Integer valor, Programa idPrograma, Cliente idCliente) {
        this.idInscripciones = idInscripciones;
        this.valor = valor;
        this.idPrograma = idPrograma;
        this.idCliente = idCliente;
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

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public Integer getValor() {
        return valor;
    }

    public void setValor(Integer valor) {
        this.valor = valor;
    }

    public Programa getIdPrograma() {
        return idPrograma;
    }

    public void setIdPrograma(Programa idPrograma) {
        this.idPrograma = idPrograma;
    }

    public Cliente getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Cliente idCliente) {
        this.idCliente = idCliente;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 11 * hash + Objects.hashCode(this.idInscripciones);
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
        final Inscripcion other = (Inscripcion) obj;
        if (!Objects.equals(this.idInscripciones, other.idInscripciones)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Inscripcion{" + "idCliente=" + idCliente + '}';
    }

  

    
    
    
}
