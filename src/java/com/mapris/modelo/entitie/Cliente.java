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
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
@Table(name = "clientes")
@XmlRootElement
public class Cliente implements Serializable {



    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JoinColumn(name = "idClientes", referencedColumnName = "cedula")
    @OneToOne(optional = true,fetch =  FetchType.EAGER,cascade = CascadeType.ALL)
    private Usuario usuario;

    
    @Column(name = "estado")
    private String estado;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idCliente")
    private List<Inscripcion> inscripciones;
    
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "clientes")
    private Datoclinico datoclinico;
    
    @OneToMany(mappedBy = "idcliente",cascade = CascadeType.ALL)
    private List<Aplazamiento> aplazamientos;
    
    @JoinColumn(name = "idEmpresa", referencedColumnName = "idEmpresa")
    @ManyToOne(cascade = CascadeType.ALL)
    private Empresa idEmpresa;

    public Cliente() {
    }

    public Cliente(String estado, List<Inscripcion> inscripciones, Datoclinico datoclinico, List<Aplazamiento> aplazamientos, Empresa idEmpresa, Usuario usuario) {
        this.estado = estado;
        this.inscripciones = inscripciones;
        this.datoclinico = datoclinico;
        this.aplazamientos = aplazamientos;
        this.idEmpresa = idEmpresa;
        this.usuario = usuario;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public List<Inscripcion> getInscripciones() {
        return inscripciones;
    }

    public void setInscripciones(List<Inscripcion> inscripciones) {
        this.inscripciones = inscripciones;
    }

    public Datoclinico getDatoclinico() {
        return datoclinico;
    }

    public void setDatoclinico(Datoclinico datoclinico) {
        this.datoclinico = datoclinico;
    }

    public List<Aplazamiento> getAplazamientos() {
        return aplazamientos;
    }

    public void setAplazamientos(List<Aplazamiento> aplazamientos) {
        this.aplazamientos = aplazamientos;
    }

    public Empresa getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(Empresa idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 37 * hash + Objects.hashCode(this.usuario);
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
        final Cliente other = (Cliente) obj;
        if (!Objects.equals(this.usuario, other.usuario)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Cliente{" + "usuario=" + usuario + '}';
    }

 
  


    

    

    
    

    
    
}
