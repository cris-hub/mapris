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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
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
@Table(name = "direcciones")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Direccion.findAll", query = "SELECT d FROM Direccion d")
    , @NamedQuery(name = "Direccion.findByIddirecciones", query = "SELECT d FROM Direccion d WHERE d.iddirecciones = :iddirecciones")
    , @NamedQuery(name = "Direccion.findByAvenida", query = "SELECT d FROM Direccion d WHERE d.avenida = :avenida")
    , @NamedQuery(name = "Direccion.findByCalle", query = "SELECT d FROM Direccion d WHERE d.calle = :calle")
    , @NamedQuery(name = "Direccion.findByCarrera", query = "SELECT d FROM Direccion d WHERE d.carrera = :carrera")})
public class Direccion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "iddirecciones")
    private Integer iddirecciones;
    @Size(max = 45)
    @Column(name = "avenida")
    private String avenida;
    @Size(max = 45)
    @Column(name = "calle")
    private String calle;
    @Size(max = 45)
    @Column(name = "carrera")
    private String carrera;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "direccionesIddirecciones", fetch = FetchType.LAZY)
    private List<UsuarioDireccione> direccionesUsuarios;
    @JoinColumn(name = "id_localidad", referencedColumnName = "id_localidad")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Localidad idLocalidad;

    public Direccion() {
    }

    public Direccion(Integer iddirecciones) {
        this.iddirecciones = iddirecciones;
    }

    public Integer getIddirecciones() {
        return iddirecciones;
    }

    public void setIddirecciones(Integer iddirecciones) {
        this.iddirecciones = iddirecciones;
    }

    public String getAvenida() {
        return avenida;
    }

    public void setAvenida(String avenida) {
        this.avenida = avenida;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }
   @XmlTransient
    public List<UsuarioDireccione> getDireccionesUsuarios() {
        return direccionesUsuarios;
    }

    public void setDireccionesUsuarios(List<UsuarioDireccione> direccionesUsuarios) {
        this.direccionesUsuarios = direccionesUsuarios;
    }

    public Localidad getIdLocalidad() {
        return idLocalidad;
    }

    public void setIdLocalidad(Localidad idLocalidad) {
        this.idLocalidad = idLocalidad;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddirecciones != null ? iddirecciones.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Direccion)) {
            return false;
        }
        Direccion other = (Direccion) object;
        if ((this.iddirecciones == null && other.iddirecciones != null) || (this.iddirecciones != null && !this.iddirecciones.equals(other.iddirecciones))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.Direccion[ iddirecciones=" + iddirecciones + " ]";
    }
    
}
