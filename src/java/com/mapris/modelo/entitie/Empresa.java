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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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
@Table(name = "empresa")
@XmlRootElement
public class Empresa implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idEmpresa")
    private Long idEmpresa;
    
    @JoinTable(name = "empresa_has_telefonos", joinColumns = {
        @JoinColumn(name = "empresa_idEmpresa", referencedColumnName = "idEmpresa")}, inverseJoinColumns = {
        @JoinColumn(name = "telefonos_id_telefono", referencedColumnName = "id_telefono")})
    @ManyToMany(fetch = FetchType.LAZY)
    private List<Telefono> telefonos;
    
    @ManyToMany(mappedBy = "empresas", fetch = FetchType.LAZY)
    private List<Direccion> direcciones;
    
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    
    
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEmpresa")
    private List<Cliente> clientes;

    public Empresa() {
    }

    public Empresa(Long idEmpresa, String nombre, List<Cliente> clientes) {
        this.idEmpresa = idEmpresa;
        this.nombre = nombre;
        
        
        this.clientes = clientes;
    }

    public Long getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(Long idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


    public List<Cliente> getClientes() {
        return clientes;
    }

    public void setClientes(List<Cliente> clientes) {
        this.clientes = clientes;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 97 * hash + Objects.hashCode(this.idEmpresa);
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
        final Empresa other = (Empresa) obj;
        if (!Objects.equals(this.idEmpresa, other.idEmpresa)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Empresa{" + "idEmpresa=" + idEmpresa + '}';
    }

    @XmlTransient
    public List<Telefono> getTelefonos() {
        return telefonos;
    }

    public void setTelefonos(List<Telefono> telefonos) {
        this.telefonos = telefonos;
    }

    @XmlTransient
    public List<Direccion> getDirecciones() {
        return direcciones;
    }

    public void setDirecciones(List<Direccion> direcciones) {
        this.direcciones = direcciones;
    }

 
   
    

    
    
}
