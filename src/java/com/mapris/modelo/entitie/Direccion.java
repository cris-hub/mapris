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

public class Direccion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "iddirecciones")
    private Integer iddirecciones;

    @JoinColumn(name = "id_localidad", referencedColumnName = "id_localidad", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Localidad idLocalidad;

    @Size(max = 45)
    @Column(name = "avenida")
    private String avenida;

    @Size(max = 45)
    @Column(name = "calle")
    private String calle;

    @Size(max = 45)
    @Column(name = "carrera")
    private String carrera;

    @JoinTable(name = "direcciones_has_empresa", joinColumns = {
        @JoinColumn(name = "direcciones_iddirecciones", referencedColumnName = "iddirecciones")}, inverseJoinColumns = {
        @JoinColumn(name = "empresa_idEmpresa", referencedColumnName = "idEmpresa")})
    @ManyToMany(fetch = FetchType.LAZY)
    private List<Empresa> empresas;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "direccion", fetch = FetchType.LAZY)
    private List<UsuarioDireccion> direcciones;

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

    public Localidad getIdLocalidad() {
        return idLocalidad;
    }

    public void setIdLocalidad(Localidad idLocalidad) {
        this.idLocalidad = idLocalidad;
    }
 
    
     
    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    @XmlTransient
    public List<Empresa> getEmpresas() {
        return empresas;
    }

    public void setEmpresas(List<Empresa> empresas) {
        this.empresas = empresas;
    }

    @XmlTransient
    public List<UsuarioDireccion> getDirecciones() {
        return direcciones;
    }

    public void setDirecciones(List<UsuarioDireccion> direcciones) {
        this.direcciones = direcciones;
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
