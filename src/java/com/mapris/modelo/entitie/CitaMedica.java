/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "cita_medica")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CitaMedica.findAll", query = "SELECT c FROM CitaMedica c")
    
})
public class CitaMedica implements Serializable {



    private static final long serialVersionUID = 1L;
//    @Basic(optional = false)
//    @NotNull
//    @Column(name = "idcita_medica")
//    private Integer idcitaMedica;
    @JoinColumn(name = "consultorios_idconsultorio", referencedColumnName = "idconsultorio")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Consultorio consultoriosIdconsultorio;
    
    @Id
    @JoinColumn(name = "idcita_medica", referencedColumnName = "idServicio")
    @OneToOne(optional = false, fetch = FetchType.EAGER)
    private Servicio servicio;

    public CitaMedica() {
    }

//    public CitaMedica(Integer idcitaMedica) {
//        this.idcitaMedica = idcitaMedica;
//    }
//
//    public Integer getIdcitaMedica() {
//        return idcitaMedica;
//    }
//
//    public void setIdcitaMedica(Integer idcitaMedica) {
//        this.idcitaMedica = idcitaMedica;
//    }

    public Consultorio getConsultoriosIdconsultorio() {
        return consultoriosIdconsultorio;
    }

    public void setConsultoriosIdconsultorio(Consultorio consultoriosIdconsultorio) {
        this.consultoriosIdconsultorio = consultoriosIdconsultorio;
    }

    public Servicio getServicio() {
        return servicio;
    }

    public void setServicio(Servicio servicio) {
        this.servicio = servicio;
    }

    
    
//    @Override
//    public int hashCode() {
//        int hash = 0;
//        hash += (idcitaMedica != null ? idcitaMedica.hashCode() : 0);
//        return hash;
//    }
//
//    @Override
//    public boolean equals(Object object) {
//        // TODO: Warning - this method won't work in the case the id fields are not set
//        if (!(object instanceof CitaMedica)) {
//            return false;
//        }
//        CitaMedica other = (CitaMedica) object;
//        if ((this.idcitaMedica == null && other.idcitaMedica != null) || (this.idcitaMedica != null && !this.idcitaMedica.equals(other.idcitaMedica))) {
//            return false;
//        }
//        return true;
//    }
//
//    @Override
//    public String toString() {
//        return "com.mapris.modelo.entitie.CitaMedica[ idcitaMedica=" + idcitaMedica + " ]";
//    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 23 * hash + Objects.hashCode(this.servicio);
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
        final CitaMedica other = (CitaMedica) obj;
        if (!Objects.equals(this.servicio, other.servicio)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "CitaMedica{" + "servicio=" + servicio + '}';
    }


 

}
