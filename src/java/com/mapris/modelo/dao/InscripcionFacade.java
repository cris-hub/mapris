/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.Inscripcion;
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
public class InscripcionFacade extends AbstractFacade<Inscripcion> implements InscripcionFacadeLocal {

    @PersistenceContext(unitName = "maprisPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public InscripcionFacade() {
        super(Inscripcion.class);
    }

    @Override
    public List<Inscripcion> findCurso() {

        try {
            getEntityManager().getEntityManagerFactory().getCache().evictAll();
            Query q = getEntityManager().createNativeQuery("SELECT * FROM inscripciones as i ORDER BY i.fk_id_curso ;", Inscripcion.class);
            return q.getResultList();
        } catch (Exception e) {
            e.getStackTrace();
            return null;
        }
    }
    
}
