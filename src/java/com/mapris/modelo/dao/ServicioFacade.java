/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.Servicio;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author APRENDIZ
 */
@Stateless
public class ServicioFacade extends AbstractFacade<Servicio> implements ServicioFacadeLocal {

    @PersistenceContext(unitName = "maprisPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ServicioFacade() {
        super(Servicio.class);
    }

    @Override
    public List<Servicio> findSalones(Integer salon) {

          try {
            getEntityManager().getEntityManagerFactory().getCache().evictAll();
            Query u = getEntityManager().createNativeQuery("SELECT * FROM servicios as s INNER JOIN salones_has_servicios as ss ON s.id_servicio = ss.servicios_id_servicio INNER JOIN salones as sa ON ss.salones_id_salones = sa.id_salones WHERE sa.id_salones = ?;", Servicio.class);
            u.setParameter(1, salon);
            return u.getResultList();
        } catch (Exception e) {
            e.getStackTrace();
            return null;
            
            
        }
    }
    
}
