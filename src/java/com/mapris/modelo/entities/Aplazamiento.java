/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "aplazamientos")
@XmlRootElement
//@NamedQueries({
//    @NamedQuery(name = "Aplazamiento.findAll", query = "SELECT a FROM Aplazamiento a")
//    , @NamedQuery(name = "Aplazamiento.findByIdaplazamiento", query = "SELECT a FROM Aplazamiento a WHERE a.idaplazamiento = :idaplazamiento")
//    , @NamedQuery(name = "Aplazamiento.findByFechaRetorno", query = "SELECT a FROM Aplazamiento a WHERE a.fechaRetorno = :fechaRetorno")})
public class Aplazamiento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "idaplazamiento")
    private Integer idaplazamiento;
    @Lob
    @Column(name = "motivo")
    private String motivo;
    @Column(name = "fechaRetorno")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaRetorno;
    @JoinColumn(name = "idcliente", referencedColumnName = "idClientes")
    @ManyToOne
    private Cliente idcliente;

    public Aplazamiento() {
    }

    public Aplazamiento(Integer idaplazamiento, String motivo, Date fechaRetorno, Cliente idcliente) {
        this.idaplazamiento = idaplazamiento;
        this.motivo = motivo;
        this.fechaRetorno = fechaRetorno;
        this.idcliente = idcliente;
    }

    public Aplazamiento(Integer idaplazamiento, Cliente idcliente) {
        this.idaplazamiento = idaplazamiento;
        this.idcliente = idcliente;
    }

    public Integer getIdaplazamiento() {
        return idaplazamiento;
    }

    public void setIdaplazamiento(Integer idaplazamiento) {
        this.idaplazamiento = idaplazamiento;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public Date getFechaRetorno() {
        return fechaRetorno;
    }

    public void setFechaRetorno(Date fechaRetorno) {
        this.fechaRetorno = fechaRetorno;
    }

    public Cliente getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Cliente idcliente) {
        this.idcliente = idcliente;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 31 * hash + Objects.hashCode(this.idcliente);
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
        final Aplazamiento other = (Aplazamiento) obj;
        if (!Objects.equals(this.idcliente, other.idcliente)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Aplazamiento{" + "idaplazamiento=" + idaplazamiento + '}';
    }

    

   

   
}
