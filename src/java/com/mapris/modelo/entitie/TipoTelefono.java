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
@Table(name = "tipo_telefono")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoTelefono.findAll", query = "SELECT t FROM TipoTelefono t")
    , @NamedQuery(name = "TipoTelefono.findByIdtipoTelefono", query = "SELECT t FROM TipoTelefono t WHERE t.idtipoTelefono = :idtipoTelefono")
    , @NamedQuery(name = "TipoTelefono.findByTipo", query = "SELECT t FROM TipoTelefono t WHERE t.tipo = :tipo")})
public class TipoTelefono implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idtipo_telefono")
    private Integer idtipoTelefono;
    @Size(max = 10)
    @Column(name = "tipo")
    private String tipo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoTelefono", fetch = FetchType.LAZY)
    private List<Telefono> telefonos;

    public TipoTelefono() {
    }

    public TipoTelefono(Integer idtipoTelefono) {
        this.idtipoTelefono = idtipoTelefono;
    }

    public Integer getIdtipoTelefono() {
        return idtipoTelefono;
    }

    public void setIdtipoTelefono(Integer idtipoTelefono) {
        this.idtipoTelefono = idtipoTelefono;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    @XmlTransient
    public List<Telefono> getTelefonos() {
        return telefonos;
    }

    public void setTelefonos(List<Telefono> telefonos) {
        this.telefonos = telefonos;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtipoTelefono != null ? idtipoTelefono.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoTelefono)) {
            return false;
        }
        TipoTelefono other = (TipoTelefono) object;
        if ((this.idtipoTelefono == null && other.idtipoTelefono != null) || (this.idtipoTelefono != null && !this.idtipoTelefono.equals(other.idtipoTelefono))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.TipoTelefono[ idtipoTelefono=" + idtipoTelefono + " ]";
    }
    
}
