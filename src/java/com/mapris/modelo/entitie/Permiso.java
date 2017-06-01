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
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
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
@Table(name = "permisos")
@XmlRootElement
public class Permiso implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    
    @Basic(optional = false)
    @Column(name = "url")
    private String url;
    
    @Basic(optional = false)
    @Column(name = "icon")
    private String icon;
    
    

    
    @JoinColumn(name = "permisos_padre", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Permiso permisoPadre;
    
    @OneToMany(mappedBy = "permisoPadre",fetch = FetchType.LAZY)
    private List<Permiso> subPermisos;
    
    @ManyToMany(mappedBy = "permisos")
    private List<Rol> roles;

    public Permiso() {
    }

    public Permiso(Integer id, String nombre, String url, String icon, Permiso permisoPadre, List<Permiso> subPermisos, List<Rol> roles) {
        this.id = id;
        this.nombre = nombre;
        this.url = url;
        this.icon = icon;
        this.permisoPadre = permisoPadre;
        this.subPermisos = subPermisos;
        this.roles = roles;
    }

    public Permiso(Integer id, String nombre, String url, String icon) {
        this.id = id;
        this.nombre = nombre;
        this.url = url;
        this.icon = icon;
    }

    public Permiso(Integer id, String nombre, String url, String icon, List<Rol> roles) {
        this.id = id;
        this.nombre = nombre;
        this.url = url;
        this.icon = icon;
        this.roles = roles;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Permiso getPermisoPadre() {
        return permisoPadre;
    }

    public void setPermisoPadre(Permiso permisoPadre) {
        this.permisoPadre = permisoPadre;
    }

    public List<Permiso> getSubPermisos() {
        return subPermisos;
    }

    public void setSubPermisos(List<Permiso> subPermisos) {
        this.subPermisos = subPermisos;
    }

    public List<Rol> getRoles() {
        return roles;
    }

    public void setRoles(List<Rol> roles) {
        this.roles = roles;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 83 * hash + Objects.hashCode(this.id);
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
        final Permiso other = (Permiso) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Permiso{" + "id=" + id + '}';
    }

   
  
    

   
}
