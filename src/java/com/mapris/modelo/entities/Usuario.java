/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entities;

import java.io.InputStream;
import java.io.Serializable;
import java.sql.Blob;
import java.util.List;
import java.util.Date;
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
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "usuarios")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuario.findLogin", query = "SELECT u FROM Usuario u WHERE u.cedula = :doc AND u.clave = :clv")})

public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "cedula")
    private Long cedula;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @Column(name = "apellidos")
    private String apellidos;
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @Column(name = "clave")
    private String clave;
    @Column(name = "telefono")
    private Integer telefono;
    @Column(name = "dirreccion")
    private String dirreccion;
    @Lob()
    @Column(name = "imegen_perfil")
    private String imagen;
    @Basic(optional = false)
    @Column(name = "fechaNaci")
    @Temporal(TemporalType.DATE)
    private Date fechaNaci;

    @JoinTable(name = "rolesusuarios",
            joinColumns = @JoinColumn(name = "idUsuarios", referencedColumnName = "cedula"),
            inverseJoinColumns = @JoinColumn(name = "idRoles", referencedColumnName = "idRoles"))
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Rol> roles;

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "usuario")
    private Personalmedico personalmedico;

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "usuario")
    private Cliente clientes;

    public Usuario() {
    }

    public Usuario(Long cedula, String nombre, String apellidos, String email, String clave, Integer telefono, String dirreccion, String imagen, Date fechaNaci, List<Rol> roles, Personalmedico personalmedico, Cliente clientes) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.email = email;
        this.clave = clave;
        this.telefono = telefono;
        this.dirreccion = dirreccion;
        this.imagen = imagen;
        this.fechaNaci = fechaNaci;
        this.roles = roles;
        this.personalmedico = personalmedico;
        this.clientes = clientes;
    }

    public Usuario(Long cedula, String nombre, String apellidos, Date fechaNaci, List<Rol> roles, Personalmedico personalmedico, Cliente clientes) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.fechaNaci = fechaNaci;
        this.roles = roles;
        this.personalmedico = personalmedico;
        this.clientes = clientes;
    }

    public Usuario(Long cedula, String nombre, String apellidos, String clave, Date fechaNaci) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.clave = clave;
        this.fechaNaci = fechaNaci;
    }

    public Usuario(Long cedula, String nombre, String apellidos, String email, Integer telefono, String dirreccion, Date fechaNaci, List<Rol> roles, Personalmedico personalmedico, Cliente clientes) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.email = email;
        this.telefono = telefono;
        this.dirreccion = dirreccion;
        this.fechaNaci = fechaNaci;
        this.roles = roles;
        this.personalmedico = personalmedico;
        this.clientes = clientes;
    }

    public Long getCedula() {
        return cedula;
    }

    public void setCedula(Long cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getTelefono() {
        return telefono;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public void setTelefono(Integer telefono) {
        this.telefono = telefono;
    }

    public String getDirreccion() {
        return dirreccion;
    }

    public void setDirreccion(String dirreccion) {
        this.dirreccion = dirreccion;
    }

    public Date getFechaNaci() {
        return fechaNaci;
    }

    public void setFechaNaci(Date fechaNaci) {
        this.fechaNaci = fechaNaci;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public List<Rol> getRoles() {
        return roles;
    }

    public void setRoles(List<Rol> roles) {
        this.roles = roles;
    }

    public Personalmedico getPersonalmedico() {
        return personalmedico;
    }

    public void setPersonalmedico(Personalmedico personalmedico) {
        this.personalmedico = personalmedico;
    }

    public Cliente getClientes() {
        return clientes;
    }

    public void setClientes(Cliente clientes) {
        this.clientes = clientes;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + Objects.hashCode(this.cedula);
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
        final Usuario other = (Usuario) obj;
        if (!Objects.equals(this.cedula, other.cedula)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Usuario{" + "cedula=" + cedula + '}';
    }

}
