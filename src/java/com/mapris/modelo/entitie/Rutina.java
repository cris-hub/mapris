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
import javax.persistence.Lob;
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
 * @author Ruben
 */
@Entity
@Table(name = "rutinas")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Rutina.findAll", query = "SELECT r FROM Rutina r")
    , @NamedQuery(name = "Rutina.findByIdRutinas", query = "SELECT r FROM Rutina r WHERE r.idRutinas = :idRutinas")
    , @NamedQuery(name = "Rutina.findByNombre", query = "SELECT r FROM Rutina r WHERE r.nombre = :nombre")})
public class Rutina implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idRutinas")
    private Integer idRutinas;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "descripcion")
    private String descripcion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idRutinas")
    private List<Rutinaservicio> rutinaServicios;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idRutinas")
    private List<Programa> programas;

    public Rutina() {
    }

    public Rutina(Integer idRutinas) {
        this.idRutinas = idRutinas;
    }

    public Rutina(Integer idRutinas, String nombre, String descripcion) {
        this.idRutinas = idRutinas;
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    public Integer getIdRutinas() {
        return idRutinas;
    }

    public void setIdRutinas(Integer idRutinas) {
        this.idRutinas = idRutinas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @XmlTransient
    public List<Rutinaservicio> getRutinaServicios() {
        return rutinaServicios;
    }

    public void setRutinaServicios(List<Rutinaservicio> rutinaServicios) {
        this.rutinaServicios = rutinaServicios;
    }

    @XmlTransient
    public List<Programa> getProgramas() {
        return programas;
    }

    public void setProgramas(List<Programa> programas) {
        this.programas = programas;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idRutinas != null ? idRutinas.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Rutina)) {
            return false;
        }
        Rutina other = (Rutina) object;
        if ((this.idRutinas == null && other.idRutinas != null) || (this.idRutinas != null && !this.idRutinas.equals(other.idRutinas))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.Rutina[ idRutinas=" + idRutinas + " ]";
    }
    
}
