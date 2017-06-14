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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
@Table(name = "personalmedico")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Personalmedico.findAll", query = "SELECT p FROM Personalmedico p")
    , @NamedQuery(name = "Personalmedico.findByPerfilProfesional", query = "SELECT p FROM Personalmedico p WHERE p.perfilProfesional = :perfilProfesional")
    , @NamedQuery(name = "Personalmedico.findByCargo", query = "SELECT p FROM Personalmedico p WHERE p.cargo = :cargo")})
public class Personalmedico implements Serializable {



    private static final long serialVersionUID = 1L;
//    @Id
//    @Basic(optional = false)
//    @NotNull
//    @Column(name = "idPersonalMedico")
//    private Long idPersonalMedico;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "perfilProfesional")
    private String perfilProfesional;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "cargo")
    private String cargo;
    @OneToMany(mappedBy = "idPersonalMedico", fetch = FetchType.LAZY)
    private List<Sesion> sesiones;
    @Id
    @JoinColumn(name = "idPersonalMedico", referencedColumnName = "cedula")
    @OneToOne(optional = false, fetch = FetchType.EAGER)
    private Usuario usuario;

    public Personalmedico() {
    }

//    public Personalmedico(Long idPersonalMedico) {
//        this.idPersonalMedico = idPersonalMedico;
//    }
//
//    public Personalmedico(Long idPersonalMedico, String perfilProfesional, String cargo) {
//        this.idPersonalMedico = idPersonalMedico;
//        this.perfilProfesional = perfilProfesional;
//        this.cargo = cargo;
//    }
//
//    public Long getIdPersonalMedico() {
//        return idPersonalMedico;
//    }
//
//    public void setIdPersonalMedico(Long idPersonalMedico) {
//        this.idPersonalMedico = idPersonalMedico;
//    }

    public String getPerfilProfesional() {
        return perfilProfesional;
    }

    public void setPerfilProfesional(String perfilProfesional) {
        this.perfilProfesional = perfilProfesional;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    @XmlTransient
    public List<Sesion> getSesiones() {
        return sesiones;
    }

    public void setSesiones(List<Sesion> sesiones) {
        this.sesiones = sesiones;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    

//    @Override
//    public int hashCode() {
//        int hash = 0;
//        hash += (idPersonalMedico != null ? idPersonalMedico.hashCode() : 0);
//        return hash;
//    }
//
//    @Override
//    public boolean equals(Object object) {
//        // TODO: Warning - this method won't work in the case the id fields are not set
//        if (!(object instanceof Personalmedico)) {
//            return false;
//        }
//        Personalmedico other = (Personalmedico) object;
//        if ((this.idPersonalMedico == null && other.idPersonalMedico != null) || (this.idPersonalMedico != null && !this.idPersonalMedico.equals(other.idPersonalMedico))) {
//            return false;
//        }
//        return true;
//    }
//
//    @Override
//    public String toString() {
//        return "com.mapris.modelo.entitie.Personalmedico[ idPersonalMedico=" + idPersonalMedico + " ]";
//    }
//    

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 29 * hash + Objects.hashCode(this.usuario);
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
        final Personalmedico other = (Personalmedico) obj;
        if (!Objects.equals(this.usuario, other.usuario)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Personalmedico{" + "usuario=" + usuario + '}';
    }

   
  
}
