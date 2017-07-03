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
import javax.persistence.TypedQuery;

/**
 *
 * @author Ruben
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
    public List<Inscripcion> buscarCliente(Long idCliente) {
        try {
            getEntityManager().getEntityManagerFactory().getCache().evictAll();
            TypedQuery<Inscripcion> q = getEntityManager().createNamedQuery("Inscripcion.findByIdCliente", Inscripcion.class);
            q.setParameter("idCliente", idCliente);
           return q.getResultList();
        } catch (Exception e) {
            System.out.println("El usuario no pudo encontrar su inscripción");
            e.printStackTrace();
            return null;
        }
    }
}
