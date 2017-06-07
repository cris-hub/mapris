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
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
@Table(name = "personalmedico")
@XmlRootElement
public class Personalmedico implements Serializable {

 

    private static final long serialVersionUID = 1L;
    @Id
    @JoinColumn(name = "idPersonalMedico", referencedColumnName = "cedula")
    @OneToOne(optional = true,fetch =  FetchType.EAGER,cascade = CascadeType.ALL)
    private Usuario usuario;

    
    @Column(name = "perfilProfesional")
    private String perfilProfesional;
    
    
    @Column(name = "cargo")
    private String cargo;
    
    @OneToMany(mappedBy = "idPersonalMedico")
    private List<Sesion> sesiones;
    
    public Personalmedico() {
    
    }

    public Personalmedico(String perfilProfesional, String cargo) {
        this.perfilProfesional = perfilProfesional;
        this.cargo = cargo;
    }



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

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 89 * hash + Objects.hashCode(this.usuario);
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
