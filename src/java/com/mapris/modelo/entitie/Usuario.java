/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
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
import javax.persistence.ManyToOne;

import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "usuarios")
@XmlRootElement
@NamedQuery(name = "Usuario.findLogin", query = "SELECT u FROM Usuario u WHERE u.cedula = :doc AND u.clave = :clv")
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull(message = "Este campo es obligatorio")
    @Column(name = "cedula")
    private Long cedula;

    @Basic(optional = false)
    @Column(name = "clave")
    private String clave;

    @Basic(optional = false)
    @Column(name = "primer_nombre")
    private String primerNombre;

    @Basic(optional = true)
    @Column(name = "segundo_nombre")
    private String segundoNombre;

    @Basic(optional = false)
    @Column(name = "primer_apellido")
    private String primerApellido;

    @Basic(optional = true)
    @Column(name = "segundo_apellido")
    private String segundoApellido;

    @Lob
    @Column(name = "imegen_perfil")
    private byte[] imegenPerfil;

    @Basic(optional = true)
    @Column(name = "fechaNaci")
    @Temporal(TemporalType.DATE)
    private Date fechaNaci;

    @JoinColumn(name = "id_estados", referencedColumnName = "id_estados", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Estado estado;

    @ManyToMany(mappedBy = "usuarios", fetch = FetchType.LAZY)
    private List<Telefono> telefonos;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usuario", fetch = FetchType.LAZY)
    private List<UsuarioDireccion> direcciones;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idUsuario", fetch = FetchType.LAZY)
    private List<Correo> correos;

    @JoinTable(name = "rolesusuarios",
            joinColumns = @JoinColumn(name = "idUsuarios", referencedColumnName = "cedula"),
            inverseJoinColumns = @JoinColumn(name = "idRoles", referencedColumnName = "idRoles"))
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Rol> roles;

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "usuario")
    private Personalmedico personalmedico;

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "usuario")
    private Cliente clientes;

    //Contructores para la entidad
    public Usuario() {
    }

    public Usuario(Long cedula, String primerNombre, String segundoNombre, String primerApellido, String segundoApellido, byte[] imegenPerfil, String clave, Date fechaNaci, Estado estado, List<Telefono> telefonos, List<UsuarioDireccion> direcciones, List<Correo> correos, List<Rol> roles, Personalmedico personalmedico, Cliente clientes) {
        this.cedula = cedula;
        this.primerNombre = primerNombre;
        this.segundoNombre = segundoNombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.imegenPerfil = imegenPerfil;
        this.clave = clave;
        this.fechaNaci = fechaNaci;
        this.estado = estado;
        this.telefonos = telefonos;
        this.direcciones = direcciones;
        this.correos = correos;
        this.roles = roles;
        this.personalmedico = personalmedico;
        this.clientes = clientes;
    }

    public Usuario(Long cedula, String primerNombre, String primerApellido, String clave, Date fechaNaci) {
        this.cedula = cedula;
        this.primerNombre = primerNombre;
        this.primerApellido = primerApellido;
        this.clave = clave;

        this.fechaNaci = fechaNaci;
    }

    public Usuario(Long cedula, String primerNombre, String segundoNombre, String primerApellido, String segundoApellido, String clave, Date fechaNaci, List<Rol> roles, Personalmedico personalmedico, Cliente clientes) {
        this.cedula = cedula;
        this.primerNombre = primerNombre;
        this.segundoNombre = segundoNombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.clave = clave;

        this.fechaNaci = fechaNaci;
        this.roles = roles;
        this.personalmedico = personalmedico;
        this.clientes = clientes;
    }

    //Getteers And Setters para los atributos de la entidad
    public String getSegundoNombre() {
        return segundoNombre;
    }

    public void setSegundoNombre(String segundoNombre) {
        this.segundoNombre = segundoNombre;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    public String getSegundoApellido() {
        return segundoApellido;
    }

    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Long getCedula() {
        return cedula;
    }

    public void setCedula(Long cedula) {
        this.cedula = cedula;
    }

    public String getPrimerNombre() {
        return primerNombre;
    }

    public void setPrimerNombre(String primerNombre) {
        this.primerNombre = primerNombre;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public Date getFechaNaci() {
        return fechaNaci;
    }

    public void setFechaNaci(Date fechaNaci) {
        this.fechaNaci = fechaNaci;
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

    //Hashcode para y equals para la entidad
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

    public byte[] getImegenPerfil() {
        return imegenPerfil;
    }

    public void setImegenPerfil(byte[] imegenPerfil) {
        this.imegenPerfil = imegenPerfil;
    }

    @XmlTransient
    public List<Correo> getCorreos() {
        return correos;
    }

    public void setCorreos(List<Correo> correos) {
        this.correos = correos;
    }

    @XmlTransient
    public List<Telefono> getTelefonos() {
        return telefonos;
    }

    public void setTelefonos(List<Telefono> telefonos) {
        this.telefonos = telefonos;
    }

    @XmlTransient
    public List<UsuarioDireccion> getDirecciones() {
        return direcciones;
    }

    public void setDirecciones(List<UsuarioDireccion> direcciones) {
        this.direcciones = direcciones;
    }

    // toString para la entidad
    @Override
    public String toString() {
        return "Usuario{" + "cedula=" + cedula + '}';
    }
}
