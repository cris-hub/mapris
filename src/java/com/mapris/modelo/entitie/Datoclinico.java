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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ruben
 */
@Entity
@Table(name = "datosclinicos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Datoclinico.findAll", query = "SELECT d FROM Datoclinico d")
    , @NamedQuery(name = "Datoclinico.findByIdCliente", query = "SELECT d FROM Datoclinico d WHERE d.idCliente = :idCliente")
    , @NamedQuery(name = "Datoclinico.findByRh", query = "SELECT d FROM Datoclinico d WHERE d.rh = :rh")
    , @NamedQuery(name = "Datoclinico.findByDatosPosparto", query = "SELECT d FROM Datoclinico d WHERE d.datosPosparto = :datosPosparto")
    , @NamedQuery(name = "Datoclinico.findByDatosPrenatales", query = "SELECT d FROM Datoclinico d WHERE d.datosPrenatales = :datosPrenatales")})
public class Datoclinico implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idCliente")
    private Long idCliente;
    @Size(max = 2)
    @Column(name = "rh")
    private String rh;
    @Column(name = "datosPosparto")
    private Integer datosPosparto;
    @Column(name = "datosPrenatales")
    private Integer datosPrenatales;
    @JoinColumn(name = "idCliente", referencedColumnName = "idClientes", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Cliente cliente;

    public Datoclinico() {
    }

    public Datoclinico(Long idCliente) {
        this.idCliente = idCliente;
    }

    public Long getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Long idCliente) {
        this.idCliente = idCliente;
    }

    public String getRh() {
        return rh;
    }

    public void setRh(String rh) {
        this.rh = rh;
    }

    public Integer getDatosPosparto() {
        return datosPosparto;
    }

    public void setDatosPosparto(Integer datosPosparto) {
        this.datosPosparto = datosPosparto;
    }

    public Integer getDatosPrenatales() {
        return datosPrenatales;
    }

    public void setDatosPrenatales(Integer datosPrenatales) {
        this.datosPrenatales = datosPrenatales;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
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
        if (!(object instanceof Datoclinico)) {
            return false;
        }
        Datoclinico other = (Datoclinico) object;
        if ((this.idCliente == null && other.idCliente != null) || (this.idCliente != null && !this.idCliente.equals(other.idCliente))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.Datoclinico[ idCliente=" + idCliente + " ]";
    }
    
}
