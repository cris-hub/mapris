/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.FechaDisponible;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Ruben
 */
@Local
public interface FechaDisponibleFacadeLocal {

    void create(FechaDisponible fechaDisponible);

    void edit(FechaDisponible fechaDisponible);

    void remove(FechaDisponible fechaDisponible);

    FechaDisponible find(Object id);

    List<FechaDisponible> findAll();

    List<FechaDisponible> findRange(int[] range);

    int count();
    
}
