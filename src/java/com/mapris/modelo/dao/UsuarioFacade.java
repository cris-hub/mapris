/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.Usuario;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
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

    @Override
    public Usuario loginProcedure(Long documento, String clave) {
        Usuario u = null;
        try {
            getEntityManager().getEntityManagerFactory().getCache().evictAll();
//            String sql = "CALL pr_validar_usuario( " + documento + "," + clave + ")";
 

              StoredProcedureQuery p = getEntityManager().createNamedStoredProcedureQuery("pr_validar_usuario");
              p.setParameter("pr_cedula", documento);
              p.setParameter("pr_clave", clave);
              p.execute();
              u =(Usuario) p.getSingleResult();
//            try {
//                StoredProcedureQuery storedProcedure = getEntityManager().createStoredProcedureQuery("pr_validar_usuario")
//                        .registerStoredProcedureParameter(0, Long.class, ParameterMode.IN)
//                        .registerStoredProcedureParameter(1, String.class, ParameterMode.IN);
//
//                storedProcedure.setParameter(0, documento)
//                        .setParameter(1, clave);
//                        
//
//                storedProcedure.execute();
//           List usuarios = storedProcedure.getResultList();
//
//         
//
//        //Creating Iterator for the List
//
//        Iterator i=usuarios.iterator();
//
//      
//        //Iterating Through
//
//        while(i.hasNext())
//
//        {
//
//         u= (Usuario) i.next();
//
//           
//
//        }
//
//                return u;
//                
//                
//            } catch (Exception e) {
//                e.printStackTrace();
//                
//            }
//            
//        

        
        return u;
    }
    catch (Exception e

    
        ) {
            System.out.println("El usuario no ingreso a la sesión");
        e.printStackTrace();
        return null;
    }
}

public List<Usuario> registros(Date fechaInicio, Date fechaFin, String modo) {
        List<Usuario> usuarios = null;
        String sql = "SELECT ?(cedula),YEAR(fechaNaci) FROM usuarios WHERE usuarios.fechaNaci BETWEEN   ? AND ? GROUP BY ?(fechaNaci)";

        Query 

q = getEntityManager().createNativeQuery(sql, Usuario.class
);
        q.setParameter(1, modo);
        q.setParameter(2, fechaFin);
        q.setParameter(3, fechaFin);
        q.setParameter(4, modo);
        usuarios = q.getResultList();

        return usuarios;

    }

}
