/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ruben
 */
@Entity
@Table(name = "fechas_disponibles")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "FechaDisponible.findAll", query = "SELECT f FROM FechaDisponible f")
    , @NamedQuery(name = "FechaDisponible.findByIdFechas", query = "SELECT f FROM FechaDisponible f WHERE f.idFechas = :idFechas")
    , @NamedQuery(name = "FechaDisponible.findByFechasDisponibles", query = "SELECT f FROM FechaDisponible f WHERE f.fechasDisponibles = :fechasDisponibles")})
public class FechaDisponible implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idFechas")
    private Integer idFechas;
    @Column(name = "fechas_disponibles")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechasDisponibles;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idFecha")
    private List<SolicitudCita> solicitudesCitas;

    public FechaDisponible() {
    }

    public FechaDisponible(Integer idFechas) {
        this.idFechas = idFechas;
    }

    public Integer getIdFechas() {
        return idFechas;
    }

    public void setIdFechas(Integer idFechas) {
        this.idFechas = idFechas;
    }

    public Date getFechasDisponibles() {
        return fechasDisponibles;
    }

    public void setFechasDisponibles(Date fechasDisponibles) {
        this.fechasDisponibles = fechasDisponibles;
    }

    @XmlTransient
    public List<SolicitudCita> getSolicitudesCitas() {
        return solicitudesCitas;
    }

    public void setSolicitudesCitas(List<SolicitudCita> solicitudesCitas) {
        this.solicitudesCitas = solicitudesCitas;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idFechas != null ? idFechas.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FechaDisponible)) {
            return false;
        }
        FechaDisponible other = (FechaDisponible) object;
        if ((this.idFechas == null && other.idFechas != null) || (this.idFechas != null && !this.idFechas.equals(other.idFechas))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.FechaDisponible[ idFechas=" + idFechas + " ]";
    }
    
}
