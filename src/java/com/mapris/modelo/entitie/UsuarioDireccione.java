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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "usuarios_has_direcciones")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UsuarioDireccione.findAll", query = "SELECT u FROM UsuarioDireccione u")
    , @NamedQuery(name = "UsuarioDireccione.findByIdDireccion", query = "SELECT u FROM UsuarioDireccione u WHERE u.idDireccion = :idDireccion")
    , @NamedQuery(name = "UsuarioDireccione.findByViveAqui", query = "SELECT u FROM UsuarioDireccione u WHERE u.viveAqui = :viveAqui")})
public class UsuarioDireccione implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_direccion")
    private Short idDireccion;
    @Column(name = "vive_aqui")
    private Boolean viveAqui;
    @JoinColumn(name = "direcciones_iddirecciones", referencedColumnName = "iddirecciones")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Direccion direccionesIddirecciones;
    @JoinColumn(name = "usuarios_cedula", referencedColumnName = "cedula")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Usuario usuariosCedula;

    public UsuarioDireccione() {
    }

    public UsuarioDireccione(Short idDireccion) {
        this.idDireccion = idDireccion;
    }

    public Short getIdDireccion() {
        return idDireccion;
    }

    public void setIdDireccion(Short idDireccion) {
        this.idDireccion = idDireccion;
    }

    public Boolean getViveAqui() {
        return viveAqui;
    }

    public void setViveAqui(Boolean viveAqui) {
        this.viveAqui = viveAqui;
    }

    public Direccion getDireccionesIddirecciones() {
        return direccionesIddirecciones;
    }

    public void setDireccionesIddirecciones(Direccion direccionesIddirecciones) {
        this.direccionesIddirecciones = direccionesIddirecciones;
    }

    public Usuario getUsuariosCedula() {
        return usuariosCedula;
    }

    public void setUsuariosCedula(Usuario usuariosCedula) {
        this.usuariosCedula = usuariosCedula;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDireccion != null ? idDireccion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UsuarioDireccione)) {
            return false;
        }
        UsuarioDireccione other = (UsuarioDireccione) object;
        if ((this.idDireccion == null && other.idDireccion != null) || (this.idDireccion != null && !this.idDireccion.equals(other.idDireccion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.UsuarioDireccione[ idDireccion=" + idDireccion + " ]";
    }
    
}
