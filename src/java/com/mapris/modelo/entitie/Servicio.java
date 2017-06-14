/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.entitie;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author SMEGS
 */
@Entity
@Table(name = "servicios")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Servicio.findAll", query = "SELECT s FROM Servicio s")
    , @NamedQuery(name = "Servicio.findByIdServicio", query = "SELECT s FROM Servicio s WHERE s.idServicio = :idServicio")
    , @NamedQuery(name = "Servicio.findByNombre", query = "SELECT s FROM Servicio s WHERE s.nombre = :nombre")
    , @NamedQuery(name = "Servicio.findByInicio", query = "SELECT s FROM Servicio s WHERE s.inicio = :inicio")
    , @NamedQuery(name = "Servicio.findByFin", query = "SELECT s FROM Servicio s WHERE s.fin = :fin")})
public class Servicio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idServicio")
    private Integer idServicio;
    
    @Size(max = 20)
    @Column(name = "nombre")
    private String nombre;
   
    @Lob
    @Size(max = 65535)
    @Column(name = "descripcion")
    private String descripcion;
    
    @Column(name = "inicio")
    @Temporal(TemporalType.TIMESTAMP)
    private Date inicio;
    
    @Column(name = "fin")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fin;
    
    
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "servicio", fetch = FetchType.LAZY)
    private Actividad clase;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idServicio", fetch = FetchType.LAZY)
    private List<Inscripcion> inscripciones;
    @JoinColumn(name = "tipo_servicio_idtipo_servicio", referencedColumnName = "idtipo_servicio")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private TipoServicio tipoServicioIdtipoServicio;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "servicio", fetch = FetchType.LAZY)
    private CitaMedica citaMedica;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "servicio", fetch = FetchType.LAZY)
    private Programa programa;

    public Servicio() {
    }

    public Servicio(Integer idServicio) {
        this.idServicio = idServicio;
    }

    public Integer getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(Integer idServicio) {
        this.idServicio = idServicio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getInicio() {
        return inicio;
    }

    public void setInicio(Date inicio) {
        this.inicio = inicio;
    }

    public Date getFin() {
        return fin;
    }

    public void setFin(Date fin) {
        this.fin = fin;
    }

   

    public Actividad getClase() {
        return clase;
    }

    public void setClase(Actividad clase) {
        this.clase = clase;
    }

    @XmlTransient
    public List<Inscripcion> getInscripciones() {
        return inscripciones;
    }

    public void setInscripciones(List<Inscripcion> inscripciones) {
        this.inscripciones = inscripciones;
    }

    public TipoServicio getTipoServicioIdtipoServicio() {
        return tipoServicioIdtipoServicio;
    }

    public void setTipoServicioIdtipoServicio(TipoServicio tipoServicioIdtipoServicio) {
        this.tipoServicioIdtipoServicio = tipoServicioIdtipoServicio;
    }

    public CitaMedica getCitaMedica() {
        return citaMedica;
    }

    public void setCitaMedica(CitaMedica citaMedica) {
        this.citaMedica = citaMedica;
    }

    public Programa getPrograma() {
        return programa;
    }

    public void setPrograma(Programa programa) {
        this.programa = programa;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idServicio != null ? idServicio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Servicio)) {
            return false;
        }
        Servicio other = (Servicio) object;
        if ((this.idServicio == null && other.idServicio != null) || (this.idServicio != null && !this.idServicio.equals(other.idServicio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mapris.modelo.entitie.Servicio[ idServicio=" + idServicio + " ]";
    }
    
}
