/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.UsuarioDireccione;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author SMEGS
 */
@Stateless
public class UsuarioDireccioneFacade extends AbstractFacade<UsuarioDireccione> implements UsuarioDireccioneFacadeLocal {

    @PersistenceContext(unitName = "maprisPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioDireccioneFacade() {
        super(UsuarioDireccione.class);
    }
    
}