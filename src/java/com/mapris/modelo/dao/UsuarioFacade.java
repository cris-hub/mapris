/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.Usuario;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author SMEGS
 */
@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> implements UsuarioFacadeLocal {

    @PersistenceContext(unitName = "maprisPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }

    @Override
    public Usuario login(Long documento, String clave) {
        try {
            getEntityManager().getEntityManagerFactory().getCache().evictAll();
            TypedQuery<Usuario> q = getEntityManager().createNamedQuery("Usuario.findLogin", Usuario.class);
            q.setParameter("doc", documento);
            q.setParameter("clv", clave);
            return q.getSingleResult();
        } catch (Exception e) {
            System.out.println("El usuario no ingreso a la sesión");
            e.printStackTrace();
            return null;
        }
    }

    
    public List<Usuario> registros(Date fechaInicio, Date fechaFin,String modo) {
        List<Usuario> usuarios = null;
        String sql = "SELECT ?1(cedula),YEAR(fechaNaci) FROM usuarios WHERE usuarios.fechaNaci BETWEEN   ?2 AND ?3 GROUP BY ?4(fechaNaci)";
               
        Query q =  getEntityManager().createNativeQuery(sql, Usuario.class);
        q.setParameter(1, modo);
        q.setParameter(2, fechaFin);
        q.setParameter(3, fechaFin);
        q.setParameter(4, modo);
        usuarios = q.getResultList();
        
        return usuarios;

    }

   
}
