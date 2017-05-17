/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "datosclinicos")
@XmlRootElement
public class Datoclinico implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Column(name = "rh")
    private String rh;
    @Column(name = "datosPosparto")
    private Integer datosPosparto;
    @Column(name = "datosPrenatales")
    private Integer datosPrenatales;
    @Id
    @JoinColumn(name = "idCliente", referencedColumnName = "idClientes")
    @OneToOne(optional = false)
    private Cliente clientes;

    public Datoclinico() {
    }

    public Datoclinico(String rh, Integer datosPosparto, Integer datosPrenatales, Cliente clientes) {
        this.rh = rh;
        this.datosPosparto = datosPosparto;
        this.datosPrenatales = datosPrenatales;
        this.clientes = clientes;
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

    public Usuario getClientes() {
        return clientes.getUsuario();
    }

    public void setClientes(Cliente clientes) {
        this.clientes = clientes;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 17 * hash + Objects.hashCode(this.clientes);
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
        final Datoclinico other = (Datoclinico) obj;
        if (!Objects.equals(this.clientes, other.clientes)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Datoclinico{" + "clientes=" + clientes + '}';
    }

   
    
    
    
}
