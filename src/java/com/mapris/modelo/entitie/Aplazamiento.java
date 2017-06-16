/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "aplazamientos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Aplazamiento.findAll", query = "SELECT a FROM Aplazamiento a")
    , @NamedQuery(name = "Aplazamiento.findByIdaplazamiento", query = "SELECT a FROM Aplazamiento a WHERE a.idaplazamiento = :idaplazamiento")
    , @NamedQuery(name = "Aplazamiento.findByFechaRetorno", query = "SELECT a FROM Aplazamiento a WHERE a.fechaRetorno = :fechaRetorno")})
public class Aplazamiento implements Serializable {

    @JoinColumn(name = "servicios_idServicio", referencedColumnName = "idServicio")
    @ManyToOne(optional = false)
    private Servicio serviciosidServicio;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idaplazamiento")
    private Integer idaplazamiento;
    @Lob
    @Size(max = 65535)
    @Column(name = "motivo")
    private String motivo;
    @JoinColumn(name = "idcliente", referencedColumnName = "idClientes")
    @ManyToOne(fetch = FetchType.LAZY)
    private Cliente idcliente;
    @JoinColumn(name = "id_tipo_aplazamiento", referencedColumnName = "id_tipo")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private TipoAplazamiento idTipoAplazamiento;

    public Aplazamiento() {
    }

    public Aplazamiento(Integer idaplazamiento) {
        this.idaplazamiento = idaplazamiento;
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

    public Cliente getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Cliente idcliente) {
        this.idcliente = idcliente;
    }

    public TipoAplazamiento getIdTipoAplazamiento() {
        return idTipoAplazamiento;
    }

    public void setIdTipoAplazamiento(TipoAplazamiento idTipoAplazamiento) {
        this.idTipoAplazamiento = idTipoAplazamiento;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idaplazamiento != null ? idaplazamiento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Aplazamiento)) {
            return false;
        }
        Aplazamiento other = (Aplazamiento) object;
        if ((this.idaplazamiento == null && other.idaplazamiento != null) || (this.idaplazamiento != null && !this.idaplazamiento.equals(other.idaplazamiento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.Aplazamiento[ idaplazamiento=" + idaplazamiento + " ]";
    }

    public Servicio getServiciosidServicio() {
        return serviciosidServicio;
    }

    public void setServiciosidServicio(Servicio serviciosidServicio) {
        this.serviciosidServicio = serviciosidServicio;
    }
    
}
