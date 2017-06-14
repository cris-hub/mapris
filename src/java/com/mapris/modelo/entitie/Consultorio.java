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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "consultorios")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Consultorio.findAll", query = "SELECT c FROM Consultorio c")
    , @NamedQuery(name = "Consultorio.findByIdconsultorio", query = "SELECT c FROM Consultorio c WHERE c.idconsultorio = :idconsultorio")})
public class Consultorio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idconsultorio")
    private Integer idconsultorio;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "consultoriosIdconsultorio", fetch = FetchType.LAZY)
    private List<CitaMedica> citasMedicas;

    public Consultorio() {
    }

    public Consultorio(Integer idconsultorio) {
        this.idconsultorio = idconsultorio;
    }

    public Integer getIdconsultorio() {
        return idconsultorio;
    }

    public void setIdconsultorio(Integer idconsultorio) {
        this.idconsultorio = idconsultorio;
    }

    @XmlTransient
    public List<CitaMedica> getCitasMedicas() {
        return citasMedicas;
    }

    public void setCitasMedicas(List<CitaMedica> citasMedicas) {
        this.citasMedicas = citasMedicas;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idconsultorio != null ? idconsultorio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Consultorio)) {
            return false;
        }
        Consultorio other = (Consultorio) object;
        if ((this.idconsultorio == null && other.idconsultorio != null) || (this.idconsultorio != null && !this.idconsultorio.equals(other.idconsultorio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.Consultorio[ idconsultorio=" + idconsultorio + " ]";
    }
    
}
