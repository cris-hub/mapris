/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ruben
 */
@Entity
@Table(name = "tg_roles_usuarios_after_update")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TgRolUsuarioAfterUpdate.findAll", query = "SELECT t FROM TgRolUsuarioAfterUpdate t")
    , @NamedQuery(name = "TgRolUsuarioAfterUpdate.findByIdActualizacionRol", query = "SELECT t FROM TgRolUsuarioAfterUpdate t WHERE t.idActualizacionRol = :idActualizacionRol")
    , @NamedQuery(name = "TgRolUsuarioAfterUpdate.findByFecha", query = "SELECT t FROM TgRolUsuarioAfterUpdate t WHERE t.fecha = :fecha")
    , @NamedQuery(name = "TgRolUsuarioAfterUpdate.findByHora", query = "SELECT t FROM TgRolUsuarioAfterUpdate t WHERE t.hora = :hora")
    , @NamedQuery(name = "TgRolUsuarioAfterUpdate.findByActualizaId", query = "SELECT t FROM TgRolUsuarioAfterUpdate t WHERE t.actualizaId = :actualizaId")
    , @NamedQuery(name = "TgRolUsuarioAfterUpdate.findByActualizoId", query = "SELECT t FROM TgRolUsuarioAfterUpdate t WHERE t.actualizoId = :actualizoId")
    , @NamedQuery(name = "TgRolUsuarioAfterUpdate.findByIdRol", query = "SELECT t FROM TgRolUsuarioAfterUpdate t WHERE t.idRol = :idRol")
    , @NamedQuery(name = "TgRolUsuarioAfterUpdate.findByAnteriorUsuario", query = "SELECT t FROM TgRolUsuarioAfterUpdate t WHERE t.anteriorUsuario = :anteriorUsuario")
    , @NamedQuery(name = "TgRolUsuarioAfterUpdate.findByAnteriorRol", query = "SELECT t FROM TgRolUsuarioAfterUpdate t WHERE t.anteriorRol = :anteriorRol")})
public class TgRolUsuarioAfterUpdate implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_actualizacion_rol")
    private Integer idActualizacionRol;
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Column(name = "hora")
    @Temporal(TemporalType.TIME)
    private Date hora;
    @Column(name = "actualiza_id")
    private BigInteger actualizaId;
    @Column(name = "actualizo_id")
    private BigInteger actualizoId;
    @Column(name = "id_rol")
    private Integer idRol;
    @Column(name = "anterior_usuario")
    private BigInteger anteriorUsuario;
    @Column(name = "anterior_rol")
    private Integer anteriorRol;

    public TgRolUsuarioAfterUpdate() {
    }

    public TgRolUsuarioAfterUpdate(Integer idActualizacionRol) {
        this.idActualizacionRol = idActualizacionRol;
    }

    public Integer getIdActualizacionRol() {
        return idActualizacionRol;
    }

    public void setIdActualizacionRol(Integer idActualizacionRol) {
        this.idActualizacionRol = idActualizacionRol;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public BigInteger getActualizaId() {
        return actualizaId;
    }

    public void setActualizaId(BigInteger actualizaId) {
        this.actualizaId = actualizaId;
    }

    public BigInteger getActualizoId() {
        return actualizoId;
    }

    public void setActualizoId(BigInteger actualizoId) {
        this.actualizoId = actualizoId;
    }

    public Integer getIdRol() {
        return idRol;
    }

    public void setIdRol(Integer idRol) {
        this.idRol = idRol;
    }

    public BigInteger getAnteriorUsuario() {
        return anteriorUsuario;
    }

    public void setAnteriorUsuario(BigInteger anteriorUsuario) {
        this.anteriorUsuario = anteriorUsuario;
    }

    public Integer getAnteriorRol() {
        return anteriorRol;
    }

    public void setAnteriorRol(Integer anteriorRol) {
        this.anteriorRol = anteriorRol;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idActualizacionRol != null ? idActualizacionRol.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TgRolUsuarioAfterUpdate)) {
            return false;
        }
        TgRolUsuarioAfterUpdate other = (TgRolUsuarioAfterUpdate) object;
        if ((this.idActualizacionRol == null && other.idActualizacionRol != null) || (this.idActualizacionRol != null && !this.idActualizacionRol.equals(other.idActualizacionRol))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.TgRolUsuarioAfterUpdate[ idActualizacionRol=" + idActualizacionRol + " ]";
    }
    
}
