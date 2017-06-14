/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapris.modelo.dao;

import com.mapris.modelo.entitie.CitaMedica;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author SMEGS
 */
@Local
public interface CitaMedicaFacadeLocal {

    void create(CitaMedica citaMedica);

    void edit(CitaMedica citaMedica);

    void remove(CitaMedica citaMedica);

    CitaMedica find(Object id);

    List<CitaMedica> findAll();

    List<CitaMedica> findRange(int[] range);

    int count();
    
}
