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
@Table(name = "calendario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Calendario.findAll", query = "SELECT c FROM Calendario c")
    , @NamedQuery(name = "Calendario.findByIdCalendario", query = "SELECT c FROM Calendario c WHERE c.idCalendario = :idCalendario")
    , @NamedQuery(name = "Calendario.findByLunes", query = "SELECT c FROM Calendario c WHERE c.lunes = :lunes")
    , @NamedQuery(name = "Calendario.findByMartes", query = "SELECT c FROM Calendario c WHERE c.martes = :martes")
    , @NamedQuery(name = "Calendario.findByMiercoles", query = "SELECT c FROM Calendario c WHERE c.miercoles = :miercoles")
    , @NamedQuery(name = "Calendario.findByJueves", query = "SELECT c FROM Calendario c WHERE c.jueves = :jueves")
    , @NamedQuery(name = "Calendario.findByViernes", query = "SELECT c FROM Calendario c WHERE c.viernes = :viernes")
    , @NamedQuery(name = "Calendario.findBySabado", query = "SELECT c FROM Calendario c WHERE c.sabado = :sabado")
    , @NamedQuery(name = "Calendario.findByDomingo", query = "SELECT c FROM Calendario c WHERE c.domingo = :domingo")})
public class Calendario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idCalendario")
    private Integer idCalendario;
    @Column(name = "lunes")
    @Temporal(TemporalType.TIMESTAMP)
    private Date lunes;
    @Column(name = "martes")
    @Temporal(TemporalType.TIMESTAMP)
    private Date martes;
    @Column(name = "miercoles")
    @Temporal(TemporalType.TIMESTAMP)
    private Date miercoles;
    @Column(name = "jueves")
    @Temporal(TemporalType.TIMESTAMP)
    private Date jueves;
    @Column(name = "viernes")
    @Temporal(TemporalType.TIMESTAMP)
    private Date viernes;
    @Column(name = "sabado")
    @Temporal(TemporalType.TIMESTAMP)
    private Date sabado;
    @Column(name = "domingo")
    @Temporal(TemporalType.TIMESTAMP)
    private Date domingo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idCalendario")
    private List<Servicio> servicios;

    public Calendario() {
    }

    public Calendario(Integer idCalendario) {
        this.idCalendario = idCalendario;
    }

    public Integer getIdCalendario() {
        return idCalendario;
    }

    public void setIdCalendario(Integer idCalendario) {
        this.idCalendario = idCalendario;
    }

    public Date getLunes() {
        return lunes;
    }

    public void setLunes(Date lunes) {
        this.lunes = lunes;
    }

    public Date getMartes() {
        return martes;
    }

    public void setMartes(Date martes) {
        this.martes = martes;
    }

    public Date getMiercoles() {
        return miercoles;
    }

    public void setMiercoles(Date miercoles) {
        this.miercoles = miercoles;
    }

    public Date getJueves() {
        return jueves;
    }

    public void setJueves(Date jueves) {
        this.jueves = jueves;
    }

    public Date getViernes() {
        return viernes;
    }

    public void setViernes(Date viernes) {
        this.viernes = viernes;
    }

    public Date getSabado() {
        return sabado;
    }

    public void setSabado(Date sabado) {
        this.sabado = sabado;
    }

    public Date getDomingo() {
        return domingo;
    }

    public void setDomingo(Date domingo) {
        this.domingo = domingo;
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
        hash += (idCalendario != null ? idCalendario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Calendario)) {
            return false;
        }
        Calendario other = (Calendario) object;
        if ((this.idCalendario == null && other.idCalendario != null) || (this.idCalendario != null && !this.idCalendario.equals(other.idCalendario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.Calendario[ idCalendario=" + idCalendario + " ]";
    }
    
}
