/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.Aplazamiento;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author SMEGS
 */
@Stateless
public class AplazamientoFacade extends AbstractFacade<Aplazamiento> implements AplazamientoFacadeLocal {

    @PersistenceContext(unitName = "maprisPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AplazamientoFacade() {
        super(Aplazamiento.class);
    }

    @Override
    public Aplazamiento registrarAplazamiento(Aplazamiento nuevoAplzamiento) {
        try {
            if (nuevoAplzamiento == null) {
                            System.out.println("El nuevo aplazamiento es nulo error AplazamientoFacade");
                return null;
            }
            //Now saving...
            em.persist(nuevoAplzamiento); //em.merge(u); for updates
            return nuevoAplzamiento;
        } catch (Exception e) {
            System.out.println("El nuevo aplazamiento no pudo ser registrado error AplazamientoFacade");
            e.printStackTrace();
            return null;
        }
    }
}
