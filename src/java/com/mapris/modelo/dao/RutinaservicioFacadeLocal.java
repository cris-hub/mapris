/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.Rutinaservicio;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author SMEGS
 */
@Local
public interface RutinaservicioFacadeLocal {

    void create(Rutinaservicio rutinaservicio);

    void edit(Rutinaservicio rutinaservicio);

    void remove(Rutinaservicio rutinaservicio);

    Rutinaservicio find(Object id);

    List<Rutinaservicio> findAll();

    List<Rutinaservicio> findRange(int[] range);

    int count();
    
}
