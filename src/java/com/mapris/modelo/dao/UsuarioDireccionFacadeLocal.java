/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.UsuarioDireccion;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author SMEGS
 */
@Local
public interface UsuarioDireccionFacadeLocal {

    void create(UsuarioDireccion usuarioDireccion);

    void edit(UsuarioDireccion usuarioDireccion);

    void remove(UsuarioDireccion usuarioDireccion);

    UsuarioDireccion find(Object id);

    List<UsuarioDireccion> findAll();

    List<UsuarioDireccion> findRange(int[] range);

    int count();
    
}
