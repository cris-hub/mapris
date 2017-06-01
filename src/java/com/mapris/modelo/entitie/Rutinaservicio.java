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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "rutinaservicios")
@XmlRootElement
public class Rutinaservicio implements Serializable {

   

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdRutinaServicios")
    private Integer idRutinaServicios;
    
    @JoinColumn(name = "idRutinas", referencedColumnName = "idRutinas")
    @ManyToOne(optional = false)
    private Rutina idRutinas;
    
    @JoinColumn(name = "idServicios", referencedColumnName = "idServicio")
    @ManyToOne(optional = false)
    private Servicio idServicios;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "rutinaserviciosidServicios")
    private List<Programa> programas;

    public Rutinaservicio() {
    }

    public Rutinaservicio(Integer idRutinaServicios, Rutina idRutinas, Servicio idServicios, List<Programa> programas) {
        this.idRutinaServicios = idRutinaServicios;
        this.idRutinas = idRutinas;
        this.idServicios = idServicios;
        this.programas = programas;
    }

    public Integer getIdRutinaServicios() {
        return idRutinaServicios;
    }

    public void setIdRutinaServicios(Integer idRutinaServicios) {
        this.idRutinaServicios = idRutinaServicios;
    }

    public Rutina getIdRutinas() {
        return idRutinas;
    }

    public void setIdRutinas(Rutina idRutinas) {
        this.idRutinas = idRutinas;
    }

    public Servicio getIdServicios() {
        return idServicios;
    }

    public void setIdServicios(Servicio idServicios) {
        this.idServicios = idServicios;
    }

    public List<Programa> getProgramas() {
        return programas;
    }

    public void setProgramas(List<Programa> programas) {
        this.programas = programas;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 73 * hash + Objects.hashCode(this.idRutinaServicios);
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
        final Rutinaservicio other = (Rutinaservicio) obj;
        if (!Objects.equals(this.idRutinaServicios, other.idRutinaServicios)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Rutinaservicio{" + "idRutinaServicios=" + idRutinaServicios + '}';
    }

    public Rutinaservicio(Integer idRutinaServicios) {
        this.idRutinaServicios = idRutinaServicios;
    }

    
   
}
