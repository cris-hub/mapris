/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "tipo_servicio")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoServicio.findAll", query = "SELECT t FROM TipoServicio t")
    , @NamedQuery(name = "TipoServicio.findByIdtipoServicio", query = "SELECT t FROM TipoServicio t WHERE t.idtipoServicio = :idtipoServicio")
    , @NamedQuery(name = "TipoServicio.findByTipoServicio", query = "SELECT t FROM TipoServicio t WHERE t.tipoServicio = :tipoServicio")})
public class TipoServicio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idtipo_servicio")
    private Integer idtipoServicio;
    @Size(max = 45)
    @Column(name = "tipo_servicio")
    private String tipoServicio;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoServicioIdtipoServicio", fetch = FetchType.LAZY)
    private List<Servicio> servicios;

    public TipoServicio() {
    }

    public TipoServicio(Integer idtipoServicio) {
        this.idtipoServicio = idtipoServicio;
    }

    public Integer getIdtipoServicio() {
        return idtipoServicio;
    }

    public void setIdtipoServicio(Integer idtipoServicio) {
        this.idtipoServicio = idtipoServicio;
    }

    public String getTipoServicio() {
        return tipoServicio;
    }

    public void setTipoServicio(String tipoServicio) {
        this.tipoServicio = tipoServicio;
    }

    @XmlTransient
    public List<Servicio> getServicios() {
        return servicios;
    }

    public void setServicios(List<Servicio> servicios) {
        this.servicios = servicios;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtipoServicio != null ? idtipoServicio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoServicio)) {
            return false;
        }
        TipoServicio other = (TipoServicio) object;
        if ((this.idtipoServicio == null && other.idtipoServicio != null) || (this.idtipoServicio != null && !this.idtipoServicio.equals(other.idtipoServicio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.TipoServicio[ idtipoServicio=" + idtipoServicio + " ]";
    }
    
}
