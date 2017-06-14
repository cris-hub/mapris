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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "clientes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cliente.findAll", query = "SELECT c FROM Cliente c")
    , @NamedQuery(name = "Cliente.findByEstado", query = "SELECT c FROM Cliente c WHERE c.estado = :estado")})
public class Cliente implements Serializable {

 

    private static final long serialVersionUID = 1L;
    
//    @Basic(optional = false)
//    @NotNull
//    @Column(name = "idClientes")
//    private Long idClientes;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "estado")
    private String estado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idCliente", fetch = FetchType.LAZY)
    private List<Inscripcion> inscripcionList;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "cliente", fetch = FetchType.LAZY)
    private Datoclinico datoclinico;
    @OneToMany(mappedBy = "idcliente", fetch = FetchType.LAZY)
    private List<Aplazamiento> aplazamientoList;
    @JoinColumn(name = "idEmpresa", referencedColumnName = "idEmpresa")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Empresa idEmpresa;
    @Id
    @JoinColumn(name = "idClientes", referencedColumnName = "cedula")
    @OneToOne(optional = false, fetch = FetchType.LAZY)
    private Usuario usuario;

    public Cliente() {
    }

//    public Cliente(Long idClientes) {
//        this.idClientes = idClientes;
//    }
//
//    public Cliente(Long idClientes, String estado) {
//        this.idClientes = idClientes;
//        this.estado = estado;
//    }
//
//    public Long getIdClientes() {
//        return idClientes;
//    }
//
//    public void setIdClientes(Long idClientes) {
//        this.idClientes = idClientes;
//    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @XmlTransient
    public List<Inscripcion> getInscripcionList() {
        return inscripcionList;
    }

    public void setInscripcionList(List<Inscripcion> inscripcionList) {
        this.inscripcionList = inscripcionList;
    }

    public Datoclinico getDatoclinico() {
        return datoclinico;
    }

    public void setDatoclinico(Datoclinico datoclinico) {
        this.datoclinico = datoclinico;
    }

    @XmlTransient
    public List<Aplazamiento> getAplazamientoList() {
        return aplazamientoList;
    }

    public void setAplazamientoList(List<Aplazamiento> aplazamientoList) {
        this.aplazamientoList = aplazamientoList;
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
    
    
    
    

//    @Override
//    public int hashCode() {
//        int hash = 0;
//        hash += (idClientes != null ? idClientes.hashCode() : 0);
//        return hash;
//    }
//
//    @Override
//    public boolean equals(Object object) {
//        // TODO: Warning - this method won't work in the case the id fields are not set
//        if (!(object instanceof Cliente)) {
//            return false;
//        }
//        Cliente other = (Cliente) object;
//        if ((this.idClientes == null && other.idClientes != null) || (this.idClientes != null && !this.idClientes.equals(other.idClientes))) {
//            return false;
//        }
//        return true;
//    }
//
//    @Override
//    public String toString() {
//        return "com.mapris.modelo.entitie.Cliente[ idClientes=" + idClientes + " ]";
//    }

    @Override
    public int hashCode() {
        int hash = 7;
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
