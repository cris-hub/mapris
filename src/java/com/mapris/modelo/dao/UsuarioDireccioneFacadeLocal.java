/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.UsuarioDireccione;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author SMEGS
 */
@Local
public interface UsuarioDireccioneFacadeLocal {

    void create(UsuarioDireccione usuarioDireccione);

    void edit(UsuarioDireccione usuarioDireccione);

    void remove(UsuarioDireccione usuarioDireccione);

    UsuarioDireccione find(Object id);

    List<UsuarioDireccione> findAll();

    List<UsuarioDireccione> findRange(int[] range);

    int count();
    
}
