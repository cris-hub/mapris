/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.Sesion;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author SMEGS
 */
@Local
public interface SesionFacadeLocal {

    void create(Sesion sesion);

    void edit(Sesion sesion);

    void remove(Sesion sesion);

    Sesion find(Object id);

    List<Sesion> findAll();

    List<Sesion> findRange(int[] range);

    int count();
    
}
