/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import java.util.List;
import java.util.List;
import java.util.Objects;
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
 * @author SMEGS
 */
@Entity
@Table(name = "rutinas")
@XmlRootElement
public class Rutina implements Serializable {


    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idRutinas")
    private Integer idRutinas;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idRutinas")
    private List<Rutinaservicio> rutinas;
    
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "descripcion")
    private String descripcion;

    public Rutina() {
    }

    public Rutina(Integer idRutinas, String nombre, List<Rutinaservicio> rutinas) {
        this.idRutinas = idRutinas;
        this.nombre = nombre;
        this.rutinas = rutinas;
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

    public List<Rutinaservicio> getRutinas() {
        return rutinas;
    }

    public void setRutinas(List<Rutinaservicio> rutinas) {
        this.rutinas = rutinas;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 23 * hash + Objects.hashCode(this.idRutinas);
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
        final Rutina other = (Rutina) obj;
        if (!Objects.equals(this.idRutinas, other.idRutinas)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Rutina{" + "idRutinas=" + idRutinas + '}';
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

  

   
    
}
