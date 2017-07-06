/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
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
 * @author Ruben
 */
@Entity
@Table(name = "clientes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cliente.findAll", query = "SELECT c FROM Cliente c")
    , @NamedQuery(name = "Cliente.findByIdClientes", query = "SELECT c FROM Cliente c WHERE c.idClientes = :idClientes")
    , @NamedQuery(name = "Cliente.findByEstado", query = "SELECT c FROM Cliente c WHERE c.estado = :estado")})
public class Cliente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idClientes")
    private Long idClientes;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "estado")
    private String estado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idCliente")
    private List<Inscripcion> inscripciones;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idClientes")
    private List<SolicitudCita> solicitudesCitas;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "cliente")
    private Datoclinico datoclinico;
    @OneToMany(mappedBy = "idcliente")
    private List<Aplazamiento> aplazamientos;
    @JoinColumn(name = "idEmpresa", referencedColumnName = "idEmpresa")
    @ManyToOne(optional = false)
    private Empresa idEmpresa;
    @JoinColumn(name = "idClientes", referencedColumnName = "cedula", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Usuario usuario;

    public Cliente() {
    }

    public Cliente(Long idClientes) {
        this.idClientes = idClientes;
    }

    public Cliente(Long idClientes, String estado) {
        this.idClientes = idClientes;
        this.estado = estado;
    }

    public Long getIdClientes() {
        return idClientes;
    }

    public void setIdClientes(Long idClientes) {
        this.idClientes = idClientes;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @XmlTransient
    public List<Inscripcion> getInscripciones() {
        return inscripciones;
    }

    public void setInscripciones(List<Inscripcion> inscripciones) {
        this.inscripciones = inscripciones;
    }

    @XmlTransient
    public List<SolicitudCita> getSolicitudesCitas() {
        return solicitudesCitas;
    }

    public void setSolicitudesCitas(List<SolicitudCita> solicitudesCitas) {
        this.solicitudesCitas = solicitudesCitas;
    }

    public Datoclinico getDatoclinico() {
        return datoclinico;
    }

    public void setDatoclinico(Datoclinico datoclinico) {
        this.datoclinico = datoclinico;
    }

    @XmlTransient
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
        int hash = 0;
        hash += (idClientes != null ? idClientes.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cliente)) {
            return false;
        }
        Cliente other = (Cliente) object;
        if ((this.idClientes == null && other.idClientes != null) || (this.idClientes != null && !this.idClientes.equals(other.idClientes))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.Cliente[ idClientes=" + idClientes + " ]";
    }
    
}
