/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
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
@Table(name = "telefonos")
@XmlRootElement

public class Telefono implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_telefono")
    private int idTelefono;
    
    
    @Size(max = 15)
    @Column(name = "numero")
    private String numero;
    
    @ManyToMany(mappedBy = "telefonos", fetch = FetchType.LAZY)
    private List<Empresa> empresas;
    
    @JoinTable(name = "usuarios_has_telefonos", joinColumns = {
        @JoinColumn(name = "telefonos_id_telefono", referencedColumnName = "id_telefono")}, inverseJoinColumns = {
        @JoinColumn(name = "usuarios_cedula", referencedColumnName = "cedula")})
    @ManyToMany(fetch = FetchType.LAZY)
    private List<Usuario> usuarios;
    
    
    @JoinColumn(name = "tipo_telefono_idtipo_telefono", referencedColumnName = "idtipo_telefono", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private TipoTelefono tipoTelefono;

    public Telefono() {
    }

    public Telefono(int idTelefono, String numero, List<Empresa> empresas, List<Usuario> usuarios, TipoTelefono tipoTelefono) {
        this.idTelefono = idTelefono;
        this.numero = numero;
        this.empresas = empresas;
        this.usuarios = usuarios;
        this.tipoTelefono = tipoTelefono;
    }
    
    
    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public int getIdTelefono() {
        return idTelefono;
    }

    public void setIdTelefono(int idTelefono) {
        this.idTelefono = idTelefono;
    }
    @XmlTransient
    public List<Empresa> getEmpresas() {
        return empresas;
    }

    public void setEmpresas(List<Empresa> empresas) {
        this.empresas = empresas;
    }

    @XmlTransient
    public List<Usuario> getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(List<Usuario> usuarios) {
        this.usuarios = usuarios;
    }

    public TipoTelefono getTipoTelefono() {
        return tipoTelefono;
    }

    public void setTipoTelefono(TipoTelefono tipoTelefono) {
        this.tipoTelefono = tipoTelefono;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 29 * hash + this.idTelefono;
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
        final Telefono other = (Telefono) obj;
        if (this.idTelefono != other.idTelefono) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Telefono{" + "idTelefono=" + idTelefono + '}';
    }

    
   
}