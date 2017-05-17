/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.Rutina;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author SMEGS
 */
@Local
public interface RutinaFacadeLocal {

    void create(Rutina rutina);

    void edit(Rutina rutina);

    void remove(Rutina rutina);

    Rutina find(Object id);

    List<Rutina> findAll();

    List<Rutina> findRange(int[] range);

    int count();
    
}
