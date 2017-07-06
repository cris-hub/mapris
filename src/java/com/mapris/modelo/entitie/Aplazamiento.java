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
import javax.persistence.Lob;
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
@Table(name = "aplazamientos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Aplazamiento.findAll", query = "SELECT a FROM Aplazamiento a")
    , @NamedQuery(name = "Aplazamiento.findByIdaplazamiento", query = "SELECT a FROM Aplazamiento a WHERE a.idaplazamiento = :idaplazamiento")})
public class Aplazamiento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idaplazamiento")
    private Integer idaplazamiento;
    @Lob
    @Size(max = 65535)
    @Column(name = "motivo")
    private String motivo;
    @Column(name = "inicio")
    @Temporal(TemporalType.DATE)
    private Date fechaInicio;
    @Column(name = "fin")
    @Temporal(TemporalType.DATE)
    private Date fechaFin;
    
    @JoinColumn(name = "idcliente", referencedColumnName = "idClientes")
    @ManyToOne
    private Cliente idcliente;

    public Aplazamiento() {
    }

    public Aplazamiento(Integer idaplazamiento) {
        this.idaplazamiento = idaplazamiento;
    }

    public Integer getIdaplazamiento() {
        return idaplazamiento;
    }

    public void setIdaplazamiento(Integer idaplazamiento) {
        this.idaplazamiento = idaplazamiento;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
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

    
    public Cliente getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Cliente idcliente) {
        this.idcliente = idcliente;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idaplazamiento != null ? idaplazamiento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Aplazamiento)) {
            return false;
        }
        Aplazamiento other = (Aplazamiento) object;
        if ((this.idaplazamiento == null && other.idaplazamiento != null) || (this.idaplazamiento != null && !this.idaplazamiento.equals(other.idaplazamiento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.Aplazamiento[ idaplazamiento=" + idaplazamiento + " ]";
    }
    
}
