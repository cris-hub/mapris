/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.persistence.Basic;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "actividades")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Actividad.findAll", query = "SELECT c FROM Actividad c")
    
})
public class Actividad implements Serializable {

    private static final long serialVersionUID = 1L;
//    @Basic(optional = false)
//    @NotNull
//    @Column(name = "idadtividad")
//    private Integer idadtividad;
    @JoinTable(name = "programas_has_actividades", joinColumns = {
        @JoinColumn(name = "idactividad", referencedColumnName = "idadtividad")}, inverseJoinColumns = {
        @JoinColumn(name = "idprograma", referencedColumnName = "idprograma")})
    @ManyToMany(fetch = FetchType.LAZY)
    private List<Programa> programas;
    @JoinColumn(name = "idRutinas", referencedColumnName = "idRutinas")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Rutina idRutinas;
    @Id
    @JoinColumn(name = "idadtividad", referencedColumnName = "idServicio")
    @OneToOne(optional = false, fetch = FetchType.LAZY)
    private Servicio servicio;
    @OneToMany(mappedBy = "actividad", fetch = FetchType.LAZY)
    private List<Salon> salonList;

    public Actividad() {
    }

//    public Actividad(Integer idadtividad) {
//        this.idadtividad = idadtividad;
//    }
//
//    public Integer getIdadtividad() {
//        return idadtividad;
//    }
//
//    public void setIdadtividad(Integer idadtividad) {
//        this.idadtividad = idadtividad;
//    }

    @XmlTransient
    public List<Programa> getProgramas() {
        return programas;
    }

    public void setProgramas(List<Programa> programas) {
        this.programas = programas;
    }

    public Rutina getIdRutinas() {
        return idRutinas;
    }

    public void setIdRutinas(Rutina idRutinas) {
        this.idRutinas = idRutinas;
    }

    public Servicio getServicio() {
        return servicio;
    }

    public void setServicio(Servicio servicio) {
        this.servicio = servicio;
    }

    @XmlTransient
    public List<Salon> getSalonList() {
        return salonList;
    }

    public void setSalonList(List<Salon> salonList) {
        this.salonList = salonList;
    }

    @Override
    public String toString() {
        return "Actividad{" + "servicio=" + servicio + '}';
    }

    
    
//    @Override
//    public int hashCode() {
//        int hash = 0;
//        hash += (idadtividad != null ? idadtividad.hashCode() : 0);
//        return hash;
//    }
//
//    @Override
//    public boolean equals(Object object) {
//        // TODO: Warning - this method won't work in the case the id fields are not set
//        if (!(object instanceof Actividad)) {
//            return false;
//        }
//        Actividad other = (Actividad) object;
//        if ((this.idadtividad == null && other.idadtividad != null) || (this.idadtividad != null && !this.idadtividad.equals(other.idadtividad))) {
//            return false;
//        }
//        return true;
//    }
//
//    @Override
//    public String toString() {
//        return "com.mapris.modelo.entitie.Actividad[ idadtividad=" + idadtividad + " ]";
//    }
//    

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + Objects.hashCode(this.servicio);
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
        final Actividad other = (Actividad) obj;
        if (!Objects.equals(this.servicio, other.servicio)) {
            return false;
        }
        return true;
    }
}
