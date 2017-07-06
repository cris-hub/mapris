/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ruben
 */
@Entity
@Table(name = "solicitud_citas")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SolicitudCita.findAll", query = "SELECT s FROM SolicitudCita s")
    , @NamedQuery(name = "SolicitudCita.findByIdCitas", query = "SELECT s FROM SolicitudCita s WHERE s.idCitas = :idCitas")
    , @NamedQuery(name = "SolicitudCita.findByEstado", query = "SELECT s FROM SolicitudCita s WHERE s.estado = :estado")})
public class SolicitudCita implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idCitas")
    private Integer idCitas;
    @Size(max = 45)
    @Column(name = "estado")
    private String estado;
    @JoinColumn(name = "idClientes", referencedColumnName = "idClientes")
    @ManyToOne(optional = false)
    private Cliente idClientes;
    @JoinColumn(name = "idFecha", referencedColumnName = "idFechas")
    @ManyToOne(optional = false)
    private FechaDisponible idFecha;
    @JoinColumn(name = "idServicio", referencedColumnName = "idServicio")
    @ManyToOne(optional = false)
    private Servicio idServicio;

    public SolicitudCita() {
    }

    public SolicitudCita(Integer idCitas) {
        this.idCitas = idCitas;
    }

    public Integer getIdCitas() {
        return idCitas;
    }

    public void setIdCitas(Integer idCitas) {
        this.idCitas = idCitas;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Cliente getIdClientes() {
        return idClientes;
    }

    public void setIdClientes(Cliente idClientes) {
        this.idClientes = idClientes;
    }

    public FechaDisponible getIdFecha() {
        return idFecha;
    }

    public void setIdFecha(FechaDisponible idFecha) {
        this.idFecha = idFecha;
    }

    public Servicio getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(Servicio idServicio) {
        this.idServicio = idServicio;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCitas != null ? idCitas.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SolicitudCita)) {
            return false;
        }
        SolicitudCita other = (SolicitudCita) object;
        if ((this.idCitas == null && other.idCitas != null) || (this.idCitas != null && !this.idCitas.equals(other.idCitas))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.SolicitudCita[ idCitas=" + idCitas + " ]";
    }
    
}
