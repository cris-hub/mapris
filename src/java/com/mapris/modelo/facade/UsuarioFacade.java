/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.facade;

import com.mapris.modelo.entities.Usuario;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author SMEGS
 */
@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> {

    @PersistenceContext(unitName = "maprisPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }
      public Usuario login(Long documento, String clave) {
        TypedQuery<Usuario> q = getEntityManager().createNamedQuery("Usuario.findLogin", Usuario.class);
        q.setParameter("doc", documento);
        q.setParameter("clv", clave);
        try {
            return q.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
    
}
