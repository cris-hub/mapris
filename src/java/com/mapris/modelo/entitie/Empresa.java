/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ruben
 */
@Entity
@Table(name = "empresa")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Empresa.findAll", query = "SELECT e FROM Empresa e")
    , @NamedQuery(name = "Empresa.findByIdEmpresa", query = "SELECT e FROM Empresa e WHERE e.idEmpresa = :idEmpresa")
    , @NamedQuery(name = "Empresa.findByNombre", query = "SELECT e FROM Empresa e WHERE e.nombre = :nombre")
    , @NamedQuery(name = "Empresa.findByDireccionP", query = "SELECT e FROM Empresa e WHERE e.direccionP = :direccionP")
    , @NamedQuery(name = "Empresa.findByDireccionO", query = "SELECT e FROM Empresa e WHERE e.direccionO = :direccionO")
    , @NamedQuery(name = "Empresa.findByTelefonoF", query = "SELECT e FROM Empresa e WHERE e.telefonoF = :telefonoF")
    , @NamedQuery(name = "Empresa.findByTelefonoC", query = "SELECT e FROM Empresa e WHERE e.telefonoC = :telefonoC")})
public class Empresa implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idEmpresa")
    private Long idEmpresa;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre")
    private String nombre;
    @Size(max = 45)
    @Column(name = "direccionP")
    private String direccionP;
    @Size(max = 45)
    @Column(name = "direccionO")
    private String direccionO;
    @Column(name = "telefonoF")
    private BigInteger telefonoF;
    @Column(name = "telefonoC")
    private BigInteger telefonoC;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEmpresa")
    private List<Cliente> clientes;

    public Empresa() {
    }

    public Empresa(Long idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public Empresa(Long idEmpresa, String nombre) {
        this.idEmpresa = idEmpresa;
        this.nombre = nombre;
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

    public String getDireccionP() {
        return direccionP;
    }

    public void setDireccionP(String direccionP) {
        this.direccionP = direccionP;
    }

    public String getDireccionO() {
        return direccionO;
    }

    public void setDireccionO(String direccionO) {
        this.direccionO = direccionO;
    }

    public BigInteger getTelefonoF() {
        return telefonoF;
    }

    public void setTelefonoF(BigInteger telefonoF) {
        this.telefonoF = telefonoF;
    }

    public BigInteger getTelefonoC() {
        return telefonoC;
    }

    public void setTelefonoC(BigInteger telefonoC) {
        this.telefonoC = telefonoC;
    }

    @XmlTransient
    public List<Cliente> getClientes() {
        return clientes;
    }

    public void setClientes(List<Cliente> clientes) {
        this.clientes = clientes;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEmpresa != null ? idEmpresa.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Empresa)) {
            return false;
        }
        Empresa other = (Empresa) object;
        if ((this.idEmpresa == null && other.idEmpresa != null) || (this.idEmpresa != null && !this.idEmpresa.equals(other.idEmpresa))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.Empresa[ idEmpresa=" + idEmpresa + " ]";
    }
    
}
