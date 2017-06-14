/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.TgRolesUsuariosAfterUpdate;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author SMEGS
 */
@Stateless
public class TgRolesUsuariosAfterUpdateFacade extends AbstractFacade<TgRolesUsuariosAfterUpdate> implements TgRolesUsuariosAfterUpdateFacadeLocal {

    @PersistenceContext(unitName = "maprisPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TgRolesUsuariosAfterUpdateFacade() {
        super(TgRolesUsuariosAfterUpdate.class);
    }
    
}
