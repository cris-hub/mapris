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
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ruben
 */
@Entity
@Table(name = "sesiones")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sesion.findAll", query = "SELECT s FROM Sesion s")
    , @NamedQuery(name = "Sesion.findByIdSesiones", query = "SELECT s FROM Sesion s WHERE s.idSesiones = :idSesiones")
    , @NamedQuery(name = "Sesion.findByNumeroSesiones", query = "SELECT s FROM Sesion s WHERE s.numeroSesiones = :numeroSesiones")})
public class Sesion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idSesiones")
    private Integer idSesiones;
    @Basic(optional = false)
    @NotNull
    @Column(name = "numero_sesiones")
    private int numeroSesiones;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idSesiones")
    private List<Inscripcion> inscripcionList;

    public Sesion() {
    }

    public Sesion(Integer idSesiones) {
        this.idSesiones = idSesiones;
    }

    public Sesion(Integer idSesiones, int numeroSesiones) {
        this.idSesiones = idSesiones;
        this.numeroSesiones = numeroSesiones;
    }

    public Integer getIdSesiones() {
        return idSesiones;
    }

    public void setIdSesiones(Integer idSesiones) {
        this.idSesiones = idSesiones;
    }

    public int getNumeroSesiones() {
        return numeroSesiones;
    }

    public void setNumeroSesiones(int numeroSesiones) {
        this.numeroSesiones = numeroSesiones;
    }

    @XmlTransient
    public List<Inscripcion> getInscripcionList() {
        return inscripcionList;
    }

    public void setInscripcionList(List<Inscripcion> inscripcionList) {
        this.inscripcionList = inscripcionList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSesiones != null ? idSesiones.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sesion)) {
            return false;
        }
        Sesion other = (Sesion) object;
        if ((this.idSesiones == null && other.idSesiones != null) || (this.idSesiones != null && !this.idSesiones.equals(other.idSesiones))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.Sesion[ idSesiones=" + idSesiones + " ]";
    }
    
}
