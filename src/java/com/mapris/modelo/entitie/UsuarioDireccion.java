/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "usuarios_has_direcciones")
@XmlRootElement

public class UsuarioDireccion implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id_direccion")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer entidadDireccion;

    @JoinColumn(name = "direcciones_iddirecciones", referencedColumnName = "iddirecciones", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Direccion direccion;

    @JoinColumn(name = "usuarios_cedula", referencedColumnName = "cedula", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Usuario usuario;

    @Column(name = "vive_aqui")
    private Boolean viveAqui;

    public UsuarioDireccion() {
    }

    public UsuarioDireccion(Boolean viveAqui, Direccion direccion, Usuario usuario) {
        this.viveAqui = viveAqui;
        this.direccion = direccion;
        this.usuario = usuario;
    }

    public Boolean getViveAqui() {
        return viveAqui;
    }

    public void setViveAqui(Boolean viveAqui) {
        this.viveAqui = viveAqui;
    }

    public Direccion getDireccion() {
        return direccion;
    }

    public void setDireccion(Direccion direccion) {
        this.direccion = direccion;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Integer getEntidadDireccion() {
        return entidadDireccion;
    }

    public void setEntidadDireccion(Integer entidadDireccion) {
        this.entidadDireccion = entidadDireccion;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 19 * hash + Objects.hashCode(this.usuario);
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
        final UsuarioDireccion other = (UsuarioDireccion) obj;
        if (!Objects.equals(this.usuario, other.usuario)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "UsuarioDireccion{" + "direccion=" + direccion + ", usuario=" + usuario + '}';
    }

}
