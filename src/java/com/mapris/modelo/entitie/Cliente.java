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
 * @author APRENDIZ
 */
@Entity
@Table(name = "clientes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cliente.findAll", query = "SELECT c FROM Cliente c")
    , @NamedQuery(name = "Cliente.findByFkIdUsuario", query = "SELECT c FROM Cliente c WHERE c.fkIdUsuario = :fkIdUsuario")
    , @NamedQuery(name = "Cliente.findByEstado", query = "SELECT c FROM Cliente c WHERE c.estado = :estado")})
public class Cliente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "fk_id_usuario")
    private Integer idCliente;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "estado")
    private String estado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkIdUsuario")
    private List<Inscripcion> inscripciones;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fkIdUsuario")
    private List<DatoClinico> datosClinicos;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "cliente")
    private Aplazamiento aplazamiento;
    @JoinColumn(name = "fk_id_empresa", referencedColumnName = "id_empresa")
    @ManyToOne
    private Empresa idEmpresa;
    @JoinColumn(name = "fk_id_usuario", referencedColumnName = "id_usuario", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Usuario usuario;

    public Cliente() {
    }

    public Cliente(Integer fkIdUsuario) {
        this.idCliente = fkIdUsuario;
    }

    public Cliente(Integer fkIdUsuario, String estado) {
        this.idCliente = fkIdUsuario;
        this.estado = estado;
    }

    public Integer getFkIdUsuario() {
        return idCliente;
    }

    public void setFkIdUsuario(Integer fkIdUsuario) {
        this.idCliente = fkIdUsuario;
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
    public List<DatoClinico> getDatosClinicos() {
        return datosClinicos;
    }

    public void setDatosClinicos(List<DatoClinico> datosClinicos) {
        this.datosClinicos = datosClinicos;
    }

    public Aplazamiento getAplazamiento() {
        return aplazamiento;
    }

    public void setAplazamiento(Aplazamiento aplazamiento) {
        this.aplazamiento = aplazamiento;
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
        hash += (idCliente != null ? idCliente.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cliente)) {
            return false;
        }
        Cliente other = (Cliente) object;
        if ((this.idCliente == null && other.idCliente != null) || (this.idCliente != null && !this.idCliente.equals(other.idCliente))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.Cliente[ fkIdUsuario=" + idCliente + " ]";
    }
    
}
